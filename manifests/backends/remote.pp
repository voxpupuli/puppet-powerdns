# remote backend for powerdns
#
# Installs the remote backend package and sets `launch=remote`.
# Configure connection details (e.g. `remote-connection-string`) with
# `powerdns::config` resources in your profile or Hiera.
class powerdns::backends::remote inherits powerdns {
  if $facts['os']['family'] == 'Debian' {
    # The pdns-server package from the Debian APT repo automatically installs the bind
    # backend package which we do not want when using another backend such as remote.
    package { 'pdns-backend-bind':
      ensure  => purged,
      require => Package[$powerdns::authoritative_package_name],
    }
  }

  powerdns::config { 'launch':
    ensure  => present,
    setting => 'launch',
    value   => 'remote',
    type    => 'authoritative',
  }

  if $powerdns::remote_backend_package_name {
    package { $powerdns::remote_backend_package_name:
      ensure  => $powerdns::authoritative_package_ensure,
      before  => Service['pdns'],
      require => Package[$powerdns::authoritative_package_name],
    }
  }

  if $powerdns::backend_install {
    fail('backend_install is not supported with remote')
  }

  if $powerdns::backend_create_tables {
    fail('backend_create_tables is not supported with remote')
  }
}
