# pipe backend for powerdns
#
# Installs the pipe backend package and sets `launch=pipe`.
# Configure `pipe-command` (and related settings) with `powerdns::config`
# resources in your profile or Hiera.
class powerdns::backends::pipe inherits powerdns {
  if $facts['os']['family'] == 'Debian' {
    # The pdns-server package from the Debian APT repo automatically installs the bind
    # backend package which we do not want when using another backend such as pipe.
    package { 'pdns-backend-bind':
      ensure  => purged,
      require => Package[$powerdns::authoritative_package_name],
    }

    # Remove the default simplebind configuration as we prefer to manage PowerDNS
    # consistently across all operating systems. This file is added to Debian
    # based systems due to Debian's policies.
    file { "${powerdns::authoritative_configdir}/pdns.d/pdns.simplebind.conf":
      ensure  => absent,
      require => Package[$powerdns::authoritative_package_name],
    }
  }

  powerdns::config { 'launch':
    ensure  => present,
    setting => 'launch',
    value   => 'pipe',
    type    => 'authoritative',
  }

  if $powerdns::pipe_backend_package_name {
    package { $powerdns::pipe_backend_package_name:
      ensure  => $powerdns::authoritative_package_ensure,
      before  => Service['pdns'],
      require => Package[$powerdns::authoritative_package_name],
    }
  }

  if $powerdns::backend_install {
    fail('backend_install is not supported with pipe')
  }

  if $powerdns::backend_create_tables {
    fail('backend_create_tables is not supported with pipe')
  }
}
