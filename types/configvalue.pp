# @summary Type Alias for Powerdns::ConfigValue
type Powerdns::ConfigValue = Variant[
  String,
  Integer,
  Boolean,
  Sensitive[String[1]]
]
