# @summary Manages powerdns authoritative server and recursor
#
# @param authoritative_package_name
#   Name of the authoritative server package
# @param authoritative_package_ensure
#   Authoritative server ensure property
# @param authoritative_extra_packages
#   Extra packages to install with the authoritative server
# @param authoritative_extra_packages_ensure
#   Authoritative server extra packages ensure property
# @param authoritative_service_name
#   Authoritative server service name
# @param authoritative_configdir
#   Authoritative config directory path
# @param authoritative_config
#   Authoritative config file path
# @param authoritative_version
#   Authoritative server version
# @param db_file
#   Path of the SQLite database file
#   The direct parent directory will be managed by this module
# @param mysql_schema_file
#   MySQL database schema file path
# @param pgsql_schema_file
#   PostgreSQL database schema file path
# @param sqlite_schema_file
#   SQLite database schema file path
# @param recursor_package_name
#   Recursor package name
# @param recursor_package_ensure
#   Recursor package ensure property
# @param recursor_service_name
#   Recursor service name
# @param recursor_configdir
#   Recursor config directory path
# @param recursor_config
#   Recursor config file path
# @param recursor_user
#   Under which user recursor is running
# @param recursor_group
#   Under which group recursor is running
# @param recursor_file_owner
#   Owner of recursor config files
# @param recursor_file_group
#   Group of recursor config files
# @param recursor_version
#   Recursor version
# @param sqlite_package_name
#   SQLite package name to install, if required
# @param mysql_backend_package_name
#   Authoritative server mysql backend package name
# @param ldap_backend_package_name
#   Authoritative server ldap backend package name
# @param pgsql_backend_package_name
#   Authoritative server postgresql backend package name
# @param sqlite_backend_package_name
#   Authoritative server sqlite backend package name
# @param lmdb_backend_package_name
#   Authoritative server lmdb backend package name
# @param mysql_charset
#   The charecter set for the MySQL database
# @param mysql_collate
#   The collation for the MySQL database
# @param authoritative
#   Whether or not this module will manage the authoritative server
# @param recursor
#   Whether or not this module will manage the recursor
# @param backend
#   Which backend should the authoritative server use
# @param backend_install
#   If you set this to true it will try to install a database backend
#   for you. This requires `db_root_password`
# @param backend_create_tables
#   Whether or not backend tables should be created
# @param db_root_password
#   If you set `backend_install` to true you are asked top specify a root
#   password for your database
# @param db_username
#   Backend database username
# @param db_password
#   Backend database password
# @param db_name
#   Backend database name
# @param db_host
#   Backend database host
# @param db_port
#   Database port to use
# @param require_db_password
#   Whether or not db_password must be set
# @param ldap_host
#   LDAP server to connect to
# @param ldap_basedn
#   LDAP base DN
# @param ldap_method
#   LDAP method to use
# @param ldap_binddn
#   LDAP object to authenticate against
# @param ldap_secret
#   LDAP password of the binddn object
# @param lmdb_filename
#   Filename for the lmdb database
# @param lmdb_schema_version
#   Maximum allowed schema version to run on this DB. If a lower version is found, auto update is performed
# @param lmdb_shards
#   Records database will be split into this number of shards
# @param lmdb_sync_mode
#   Sync mode for LMDB. One of 'nosync', 'sync', 'nometasync', 'mapasync'
# @param custom_repo
#   Don't manage the PowerDNS repo with this module
# @param custom_epel
#   Don't manage the EPEL repo with this module
# @param forward_zones
#   Configures recursor forward_zones
# @param autoprimaries
#   Hash of autoprimaries the ensurce (with resource powerdns_autoprimary)
# @param purge_autoprimaries
#   Set this to true if you like to purge all autoprimaries not managed with puppet
# @param authoritative_user
#   Under which user the authoritative server is running
# @param authoritative_group
#   Under which group the authoritative server is running
# @param authoritative_file_owner
#   Owner of authoritative config files
# @param authoritative_file_group
#   Group of authoritative config files
#
class powerdns (
  String[1] $authoritative_package_name,
  String[1] $authoritative_package_ensure,
  Optional[Array[String[1]]] $authoritative_extra_packages,
  String[1] $authoritative_extra_packages_ensure,
  String[1] $authoritative_service_name,
  Stdlib::Absolutepath $authoritative_configdir,
  Stdlib::Absolutepath $authoritative_config,
  Pattern[/4\.[0-9]+/] $authoritative_version,
  Stdlib::Absolutepath $db_file,
  Stdlib::Absolutepath $mysql_schema_file,
  Stdlib::Absolutepath $pgsql_schema_file,
  Stdlib::Absolutepath $sqlite_schema_file,
  String[1] $recursor_package_name,
  String[1] $recursor_package_ensure,
  String[1] $recursor_service_name,
  Stdlib::Absolutepath $recursor_configdir,
  Stdlib::Absolutepath $recursor_config,
  String[1] $recursor_user,
  String[1] $recursor_group,
  String[1] $recursor_file_owner,
  String[1] $recursor_file_group,
  Pattern[/[4,5]\.[0-9]+/] $recursor_version,
  String[1] $sqlite_package_name,
  Optional[String[1]] $mysql_backend_package_name = undef,
  Optional[String[1]] $ldap_backend_package_name = undef,
  Optional[String[1]] $pgsql_backend_package_name = undef,
  Optional[String[1]] $sqlite_backend_package_name = undef,
  Optional[String[1]] $lmdb_backend_package_name = undef,
  Optional[String[1]] $mysql_charset = undef,
  Optional[String[1]] $mysql_collate = undef,
  Boolean $authoritative = true,
  Boolean $recursor = false,
  Powerdns::Backends $backend = 'mysql',
  Boolean $backend_install = true,
  Boolean $backend_create_tables = true,
  Powerdns::Secret $db_root_password = undef,
  String[1] $db_username = 'powerdns',
  Powerdns::Secret $db_password = undef,
  String[1] $db_name = 'powerdns',
  Stdlib::Host $db_host = 'localhost',
  Stdlib::Port $db_port = 3306,
  Boolean $require_db_password = true,
  String[1] $ldap_host = 'ldap://localhost/',
  Optional[String[1]] $ldap_basedn = undef,
  Powerdns::LdapMethod $ldap_method = 'strict',
  Optional[String[1]] $ldap_binddn = undef,
  Powerdns::Secret $ldap_secret = undef,
  Stdlib::Absolutepath $lmdb_filename = '/var/lib/powerdns/pdns.lmdb',
  Optional[Integer] $lmdb_schema_version = undef,
  Optional[Integer] $lmdb_shards = undef,
  Powerdns::LmdbSyncMode $lmdb_sync_mode = undef,
  Boolean $custom_repo = false,
  Boolean $custom_epel = false,
  Hash $forward_zones = {},
  Powerdns::Autoprimaries $autoprimaries = {},
  Boolean $purge_autoprimaries = false,
  String[1] $authoritative_user = 'pdns',
  String[1] $authoritative_group = 'pdns',
  String[1] $authoritative_file_owner = 'root',
  String[1] $authoritative_file_group = $authoritative_group,
) {
  # Do some additional checks. In certain cases, some parameters are no longer optional.
  if $authoritative {
    if $require_db_password and !($powerdns::backend in ['bind', 'ldap', 'sqlite', 'lmdb']) {
      assert_type(Variant[String[1], Sensitive[String[1]]], $db_password) |$expected, $actual| {
        fail("'db_password' must be a non-empty string when 'authoritative' == true")
      }
      if $backend_install {
        assert_type(Variant[String[1], Sensitive[String[1]]], $db_root_password) |$expected, $actual| {
          fail("'db_root_password' must be a non-empty string when 'backend_install' == true")
        }
      }
    }
    if $backend_create_tables and $backend == 'mysql' {
      assert_type(Variant[String[1], Sensitive[String[1]]], $db_root_password) |$expected, $actual| {
        fail("On MySQL 'db_root_password' must be a non-empty string when 'backend_create_tables' == true")
      }
    }
  }

  # Include the required classes
  unless $custom_repo {
    contain powerdns::repo
  }

  if $authoritative {
    contain powerdns::authoritative

    # Set up Hiera. Even though it's not necessary to explicitly set $type for the authoritative
    # config, it is added for clarity.
    $powerdns_auth_config = lookup('powerdns::auth::config', Hash, 'deep', {})
    $powerdns_auth_defaults = { 'type' => 'authoritative' }
    create_resources(powerdns::config, $powerdns_auth_config, $powerdns_auth_defaults)
  }

  if $recursor {
    contain powerdns::recursor

    # Set up Hiera for the recursor.
    $powerdns_recursor_config = lookup('powerdns::recursor::config', Hash, 'deep', {})
    $powerdns_recursor_defaults = { 'type' => 'recursor' }
    create_resources(powerdns::config, $powerdns_recursor_config, $powerdns_recursor_defaults)
  }

  if $purge_autoprimaries {
    resources { 'powerdns_autoprimary':
      purge => true,
    }
  }
  create_resources('powerdns_autoprimary', $autoprimaries)
}
