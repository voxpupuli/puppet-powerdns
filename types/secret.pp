# @summary Type Alias for Powerdns::Secret
type Powerdns::Secret = Optional[
  Variant[
    String[1],
    Sensitive[String[1]]
  ]
]
