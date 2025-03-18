# powerdns::authoritative
#
class powerdns::authoritative inherits powerdns {
  # install the powerdns package
  package { $powerdns::authoritative_package_name:
    ensure => $powerdns::authoritative_package_ensure,
  }

  stdlib::ensure_packages($powerdns::authoritative_extra_packages, { 'ensure' => $powerdns::authoritative_extra_packages_ensure })

  include "powerdns::backends::${powerdns::backend}"

  file { $powerdns::authoritative_config:
    ensure  => 'file',
    owner   => 'root',
    group   => $powerdns::authoritative_group,
    mode    => '0640',
    require => Package[$powerdns::authoritative_package_name],
  }

  service { 'pdns':
    ensure  => running,
    name    => $powerdns::authoritative_service_name,
    enable  => true,
    require => File[$powerdns::authoritative_config],
  }
}
