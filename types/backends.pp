# @summary Type Alias for Powerdns::Backends
type Powerdns::Backends = Enum[
  'ldap',
  'mysql',
  'bind',
  'postgresql',
  'sqlite',
  'lmdb',
]
