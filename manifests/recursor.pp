# @summary powerdns recursor
#
# @param forward_zones
#   Hash containing zone => dns servers pairs
# @param config recursor config (will be converted to YAML, see https://doc.powerdns.com/recursor/yamlsettings.html)
#   when powerdns::recursor_use_yaml is set to `true`
#
class powerdns::recursor (
  Hash $forward_zones = $powerdns::forward_zones,
  Hash $config = {},
) inherits powerdns {
  package { $powerdns::recursor_package_name:
    ensure => $powerdns::recursor_package_ensure,
  }

  if $powerdns::recursor_use_yaml {
    ## Use New YAML based configuration
    $forward_block = empty($powerdns::recursor_forward_zones) ? {
      true  => {},
      false => { 'forward_zones_file' => $powerdns::recursor_forward_zones_file },
    }

    $recursor_config = {
      'recursor' => {
        'include_dir' => $powerdns::recursor_config_includedir,
      } + $forward_block + $config,
    }

    if !empty($powerdns::recursor_forward_zones) {
      file { $powerdns::recursor_forward_zones_file:
        ensure  => file,
        owner   => $powerdns::recursor_file_owner,
        group   => $powerdns::recursor_file_group,
        content => stdlib::to_yaml($powerdns::recursor_forward_zones),
        notify  => Service['pdns-recursor'],
      }
    }
    file { $powerdns::recursor_config_includedir:
      ensure  => directory,
      owner   => $powerdns::recursor_file_owner,
      group   => $powerdns::recursor_file_group,
      require => Package[$powerdns::recursor_package_name],
    }

    file { $powerdns::recursor_config:
      ensure  => file,
      owner   => $powerdns::recursor_file_owner,
      group   => $powerdns::recursor_file_group,
      content => stdlib::to_yaml($recursor_config),
      require => Package[$powerdns::recursor_package_name],
      notify  => Service['pdns-recursor'],
    }

    file { $powerdns::recursor_local_config_file:
      ensure  => file,
      owner   => $powerdns::recursor_file_owner,
      group   => $powerdns::recursor_file_group,
      content => stdlib::to_yaml(lookup('powerdns::recursor_local_config', Data, 'deep', {})),
      require => Package[$powerdns::recursor_package_name],
      notify  => Service['pdns-recursor'],
    }
  } else {
    ## Use Old INI based configuration

    file { $powerdns::recursor_config:
      ensure  => file,
      owner   => $powerdns::recursor_file_owner,
      group   => $powerdns::recursor_file_group,
      require => Package[$powerdns::recursor_package_name],
    }

    if !empty($forward_zones) {
      $zone_config = "${powerdns::recursor_configdir}/forward_zones.conf"
      file { $zone_config:
        ensure  => file,
        owner   => $powerdns::recursor_file_owner,
        group   => $powerdns::recursor_file_group,
        content => template('powerdns/forward_zones.conf.erb'),
        notify  => Service['pdns-recursor'],
      }

      powerdns::config { 'forward-zones-file':
        value => $zone_config,
        type  => 'recursor',
      }
    }
  }
  service { 'pdns-recursor':
    ensure  => running,
    name    => $powerdns::recursor_service_name,
    enable  => true,
    require => Package[$powerdns::recursor_package_name],
  }
}
