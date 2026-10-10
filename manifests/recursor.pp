# @summary powerdns recursor
#
# @param forward_zones
#   Hash containing zone => dns servers pairs
# @param config recursor config (will be converted to YAML)
#   when powerdns::recursor_use_yaml is set to `true`
# @see https://doc.powerdns.com/recursor/yamlsettings.html
# @param forward_zones_file filename (without extension)
# @param include Key as filename and its contents as value
#
class powerdns::recursor (
  Optional[Variant[Hash,Tuple]] $forward_zones = $powerdns::forward_zones,
  Hash $config = {},
  String $forward_zones_file = 'forward_zones',
  Stdlib::Absolutepath $config_includedir = "${powerdns::recursor_configdir}/recursor.d",
  Hash $include = {},
) inherits powerdns {
  package { $powerdns::recursor_package_name:
    ensure => $powerdns::recursor_package_ensure,
  }

  if $powerdns::recursor_use_yaml {
    $zone_config = "${powerdns::recursor_configdir}/${forward_zones_file}.yml"
    ## Use New YAML based configuration
    $forward_block = empty($forward_zones) ? {
      true  => {},
      false => { 'forward_zones_file' => $zone_config },
    }

    $recursor_config = deep_merge({
      'recursor' => {
        'include_dir' => $config_includedir,
      } + $forward_block,
    }, $config)

    file { $config_includedir:
      ensure  => directory,
      owner   => $powerdns::recursor_file_owner,
      group   => $powerdns::recursor_file_group,
      require => Package[$powerdns::recursor_package_name],
    }

    file { $zone_config:
      ensure  => file,
      owner   => $powerdns::recursor_file_owner,
      group   => $powerdns::recursor_file_group,
      content => stdlib::to_yaml($forward_zones),
      require => Package[$powerdns::recursor_package_name],
      notify  => Service['pdns-recursor'],
    }

    file { $powerdns::recursor_config:
      ensure  => file,
      owner   => $powerdns::recursor_file_owner,
      group   => $powerdns::recursor_file_group,
      content => stdlib::to_yaml($recursor_config),
      require => Package[$powerdns::recursor_package_name],
      notify  => Service['pdns-recursor'],
    }

    $include.each |String $filename, Hash $content| {
      file { "${config_includedir}/${filename}":
        ensure  => file,
        owner   => $powerdns::recursor_file_owner,
        group   => $powerdns::recursor_file_group,
        content => stdlib::to_yaml($content),
        require => Package[$powerdns::recursor_package_name],
        notify  => Service['pdns-recursor'],
      }
    }
  } else {
    ## Use Old INI based configuration
    $zone_config = "${powerdns::recursor_configdir}/${forward_zones_file}.conf"

    file { $powerdns::recursor_config:
      ensure  => file,
      owner   => $powerdns::recursor_file_owner,
      group   => $powerdns::recursor_file_group,
      require => Package[$powerdns::recursor_package_name],
    }

    if !empty($forward_zones) {
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
