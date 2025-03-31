# sqlite backend for powerdns
class powerdns::backends::sqlite (
) inherits powerdns {
  # set the configuration variables
  powerdns::config { 'launch':
    ensure  => present,
    setting => 'launch',
    value   => 'gsqlite3',
    type    => 'authoritative',
  }

  powerdns::config { 'gsqlite3-database':
    ensure  => present,
    setting => 'gsqlite3-database',
    value   => $powerdns::db_file,
    type    => 'authoritative',
  }

  # set up the powerdns backend
  if $powerdns::sqlite_backend_package_name {
    package { $powerdns::sqlite_backend_package_name:
      ensure  => $powerdns::authoritative_package_ensure,
      before  => Service['pdns'],
      require => Package[$powerdns::authoritative_package_name],
    }
  }
  if $powerdns::backend_install {
    if ! defined(Package[$powerdns::sqlite_package_name]) {
      package { $powerdns::sqlite_package_name:
        ensure => $powerdns::authoritative_package_ensure,
      }
    }
  }
  if $powerdns::backend_create_tables {
    file { $powerdns::db_dir:
      ensure  => directory,
      mode    => '0755',
      owner   => 'pdns',
      group   => 'pdns',
      require => Package[$powerdns::authoritative_package_name],
    }
    -> file { $powerdns::db_file:
      ensure => file,
      mode   => '0644',
      owner  => 'pdns',
      group  => 'pdns',
    }
    -> exec { 'powerdns-sqlite3-create-tables':
      command => "/usr/bin/env sqlite3 ${powerdns::db_file} < ${powerdns::sqlite_schema_file}",
      unless  => "/usr/bin/env test `echo '.tables domains' | sqlite3 ${powerdns::db_file} | wc -l` -eq 1",
      before  => Service['pdns'],
    }
  }
}
