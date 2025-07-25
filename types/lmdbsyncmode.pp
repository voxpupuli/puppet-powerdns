# @summary Type Alias for Powerdns::LmdbSyncMode
type Powerdns::LmdbSyncMode = Optional[
  Enum[
    'nosync',
    'sync',
    'nometasync',
    'mapasync',
  ]
]
