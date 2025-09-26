# @summary Type Alias for Powerdns::Autoprimaries
type Powerdns::Autoprimaries=Hash[
  Pattern[/.+@.+/],
  Struct[{
    account => Optional[String],
  }]
]
