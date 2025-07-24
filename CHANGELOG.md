# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v6.0.0](https://github.com/voxpupuli/puppet-powerdns/tree/v6.0.0) (2025-07-24)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v5.2.1...v6.0.0)

**Breaking changes:**

- drop archlinux from supported OS, as mysql module isn't supporting it [\#208](https://github.com/voxpupuli/puppet-powerdns/pull/208) ([saz](https://github.com/saz))
- remove EOL Ubuntu 18.04 and Debian 10 [\#192](https://github.com/voxpupuli/puppet-powerdns/pull/192) ([saz](https://github.com/saz))
- remove EOL CentOS 8 [\#190](https://github.com/voxpupuli/puppet-powerdns/pull/190) ([saz](https://github.com/saz))
- remove code related to EOL Debian/Ubuntu releases [\#183](https://github.com/voxpupuli/puppet-powerdns/pull/183) ([saz](https://github.com/saz))
- Remove eol oraclelinux [\#182](https://github.com/voxpupuli/puppet-powerdns/pull/182) ([saz](https://github.com/saz))
- Remove eol centos [\#180](https://github.com/voxpupuli/puppet-powerdns/pull/180) ([saz](https://github.com/saz))
- Remove eol redhat [\#179](https://github.com/voxpupuli/puppet-powerdns/pull/179) ([saz](https://github.com/saz))
- drop EOL Scientific as supported OS [\#177](https://github.com/voxpupuli/puppet-powerdns/pull/177) ([saz](https://github.com/saz))

**Implemented enhancements:**

- Allow puppetlabs/apt 10.x [\#205](https://github.com/voxpupuli/puppet-powerdns/pull/205) ([smortex](https://github.com/smortex))
- metadata.json: Add OpenVox [\#200](https://github.com/voxpupuli/puppet-powerdns/pull/200) ([jstraw](https://github.com/jstraw))
- allow puppetlabs/mysql 16.X [\#197](https://github.com/voxpupuli/puppet-powerdns/pull/197) ([saz](https://github.com/saz))
- update recursor version to 5.0, authoritative version to 4.9 [\#195](https://github.com/voxpupuli/puppet-powerdns/pull/195) ([saz](https://github.com/saz))
- replace params.pp with hiera data [\#184](https://github.com/voxpupuli/puppet-powerdns/pull/184) ([saz](https://github.com/saz))
- add RedHat/CentOS/OracleLinux 8/9 and Debian 11/12 as supported OS [\#178](https://github.com/voxpupuli/puppet-powerdns/pull/178) ([saz](https://github.com/saz))

**Fixed bugs:**

- run sqlite backend table creation as user pdns, fixes \#211 [\#212](https://github.com/voxpupuli/puppet-powerdns/pull/212) ([saz](https://github.com/saz))
- replace hard-coded pdns group, fixes \#202 [\#209](https://github.com/voxpupuli/puppet-powerdns/pull/209) ([saz](https://github.com/saz))
- fix: parameter type error messages [\#201](https://github.com/voxpupuli/puppet-powerdns/pull/201) ([pdemonaco](https://github.com/pdemonaco))
- require package before trying to manage config file [\#198](https://github.com/voxpupuli/puppet-powerdns/pull/198) ([saz](https://github.com/saz))
- set "undef" as default value for backend packages [\#196](https://github.com/voxpupuli/puppet-powerdns/pull/196) ([saz](https://github.com/saz))
- fix schema file paths on RedHat based OS [\#194](https://github.com/voxpupuli/puppet-powerdns/pull/194) ([saz](https://github.com/saz))
- remove unused powertools yum repo [\#191](https://github.com/voxpupuli/puppet-powerdns/pull/191) ([saz](https://github.com/saz))
- correct pdns.conf permissions on Redhat derivatives [\#185](https://github.com/voxpupuli/puppet-powerdns/pull/185) ([pdemonaco](https://github.com/pdemonaco))
- pin recursor apt source with higher priority [\#176](https://github.com/voxpupuli/puppet-powerdns/pull/176) ([saz](https://github.com/saz))

**Closed issues:**

- sqlite3 backend exec should be run as user `pdns` [\#211](https://github.com/voxpupuli/puppet-powerdns/issues/211)
- If pdns.conf missing or removed, it isn't re-created [\#202](https://github.com/voxpupuli/puppet-powerdns/issues/202)
- Ensure correct `LICENSE`. [\#188](https://github.com/voxpupuli/puppet-powerdns/issues/188)

## [v5.2.1](https://github.com/voxpupuli/puppet-powerdns/tree/v5.2.1) (2025-03-05)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v5.2.0...v5.2.1)

**Fixed bugs:**

- fix regex to get repo version [\#175](https://github.com/voxpupuli/puppet-powerdns/pull/175) ([saz](https://github.com/saz))

## [v5.2.0](https://github.com/voxpupuli/puppet-powerdns/tree/v5.2.0) (2025-02-17)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v5.1.0...v5.2.0)

**Merged pull requests:**

- PostgreSQL backend: make powerdns a database owner [\#173](https://github.com/voxpupuli/puppet-powerdns/pull/173) ([nixargh](https://github.com/nixargh))

## [v5.1.0](https://github.com/voxpupuli/puppet-powerdns/tree/v5.1.0) (2025-02-13)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v5.0.0...v5.1.0)

**Closed issues:**

- \[Bug\] Improper sorting of forward\_zones causes broken forwarding configuration [\#168](https://github.com/voxpupuli/puppet-powerdns/issues/168)
- Powerdns config file [\#167](https://github.com/voxpupuli/puppet-powerdns/issues/167)

**Merged pull requests:**

- Add lmdb backend option [\#174](https://github.com/voxpupuli/puppet-powerdns/pull/174) ([Heidistein](https://github.com/Heidistein))
- Update forward\_zones.conf.erb to remove .sort [\#170](https://github.com/voxpupuli/puppet-powerdns/pull/170) ([akremer](https://github.com/akremer))

## [v5.0.0](https://github.com/voxpupuli/puppet-powerdns/tree/v5.0.0) (2024-02-15)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v4.1.1...v5.0.0)

## [v4.1.1](https://github.com/voxpupuli/puppet-powerdns/tree/v4.1.1) (2024-02-15)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v4.1.0...v4.1.1)

**Merged pull requests:**

- Puppet 8 support [\#166](https://github.com/voxpupuli/puppet-powerdns/pull/166) ([deric](https://github.com/deric))
- Pdk update & remove .ruby-version file [\#165](https://github.com/voxpupuli/puppet-powerdns/pull/165) ([deric](https://github.com/deric))
- Allow postgresql 10 module [\#164](https://github.com/voxpupuli/puppet-powerdns/pull/164) ([deric](https://github.com/deric))

## [v4.1.0](https://github.com/voxpupuli/puppet-powerdns/tree/v4.1.0) (2024-02-06)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v4.0.1...v4.1.0)

**Merged pull requests:**

- Add the ability to install pdns and recursor with differents versions [\#163](https://github.com/voxpupuli/puppet-powerdns/pull/163) ([mouchymouchy](https://github.com/mouchymouchy))
- add type/provider for autoprimary [\#162](https://github.com/voxpupuli/puppet-powerdns/pull/162) ([trefzer](https://github.com/trefzer))

## [v4.0.1](https://github.com/voxpupuli/puppet-powerdns/tree/v4.0.1) (2023-09-07)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v4.0.0...v4.0.1)

**Merged pull requests:**

- Bugfix: fix deprecated use of postgresql\_password\(\) [\#161](https://github.com/voxpupuli/puppet-powerdns/pull/161) ([sircubbi](https://github.com/sircubbi))

## [v4.0.0](https://github.com/voxpupuli/puppet-powerdns/tree/v4.0.0) (2023-08-22)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v3.0.3...v4.0.0)

**Merged pull requests:**

- Add Arch Linux support [\#159](https://github.com/voxpupuli/puppet-powerdns/pull/159) ([bastelfreak](https://github.com/bastelfreak))
- puppet/epel: Allow 5.x [\#158](https://github.com/voxpupuli/puppet-powerdns/pull/158) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/postgresql: Require 9.x [\#157](https://github.com/voxpupuli/puppet-powerdns/pull/157) ([bastelfreak](https://github.com/bastelfreak))
- Drop EoL module support  [\#156](https://github.com/voxpupuli/puppet-powerdns/pull/156) ([bastelfreak](https://github.com/bastelfreak))
- puppet-strings: autofix [\#155](https://github.com/voxpupuli/puppet-powerdns/pull/155) ([bastelfreak](https://github.com/bastelfreak))
- pdk: Update 2.5.0-\>3.0.0 [\#154](https://github.com/voxpupuli/puppet-powerdns/pull/154) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/mysql: Allow 15.x [\#153](https://github.com/voxpupuli/puppet-powerdns/pull/153) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Require 9.x  [\#152](https://github.com/voxpupuli/puppet-powerdns/pull/152) ([bastelfreak](https://github.com/bastelfreak))
- .fixtures.yml: Migrate to git [\#151](https://github.com/voxpupuli/puppet-powerdns/pull/151) ([bastelfreak](https://github.com/bastelfreak))

## [v3.0.3](https://github.com/voxpupuli/puppet-powerdns/tree/v3.0.3) (2023-05-27)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v3.0.2...v3.0.3)

**Closed issues:**

- Install PowerDNS version 4.7.x [\#145](https://github.com/voxpupuli/puppet-powerdns/issues/145)

**Merged pull requests:**

- Allow newer dependencies [\#150](https://github.com/voxpupuli/puppet-powerdns/pull/150) ([saz](https://github.com/saz))

## [v3.0.2](https://github.com/voxpupuli/puppet-powerdns/tree/v3.0.2) (2023-04-01)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v3.0.1...v3.0.2)

**Merged pull requests:**

- chore: update metadata & readme for puppet 7 [\#149](https://github.com/voxpupuli/puppet-powerdns/pull/149) ([ju5t](https://github.com/ju5t))

## [v3.0.1](https://github.com/voxpupuli/puppet-powerdns/tree/v3.0.1) (2023-04-01)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v3.0.0...v3.0.1)

## [v3.0.0](https://github.com/voxpupuli/puppet-powerdns/tree/v3.0.0) (2023-03-31)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v2.3.0...v3.0.0)

**Merged pull requests:**

- Support Sensitive strings [\#148](https://github.com/voxpupuli/puppet-powerdns/pull/148) ([deric](https://github.com/deric))

## [v2.3.0](https://github.com/voxpupuli/puppet-powerdns/tree/v2.3.0) (2023-02-27)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v2.2.2...v2.3.0)

**Closed issues:**

- puppet type throws error while running "puppet generate types" [\#129](https://github.com/voxpupuli/puppet-powerdns/issues/129)
- Remove .git folder from puppetforge [\#127](https://github.com/voxpupuli/puppet-powerdns/issues/127)
- collate/charset for db creation [\#126](https://github.com/voxpupuli/puppet-powerdns/issues/126)

**Merged pull requests:**

- mysql::db sql parameter changed to array [\#144](https://github.com/voxpupuli/puppet-powerdns/pull/144) ([skn-bvdh](https://github.com/skn-bvdh))
- allow \(minor\) versions above 9 for schema import [\#143](https://github.com/voxpupuli/puppet-powerdns/pull/143) ([trefzer](https://github.com/trefzer))
- make gpgsql-password optional [\#142](https://github.com/voxpupuli/puppet-powerdns/pull/142) ([bastelfreak](https://github.com/bastelfreak))
- Drop unneeded service\_provider name [\#141](https://github.com/voxpupuli/puppet-powerdns/pull/141) ([bastelfreak](https://github.com/bastelfreak))
- rubocop: Fix Style/RegexpLiteral [\#140](https://github.com/voxpupuli/puppet-powerdns/pull/140) ([bastelfreak](https://github.com/bastelfreak))
- init.pp: fix broken optional variables [\#139](https://github.com/voxpupuli/puppet-powerdns/pull/139) ([bastelfreak](https://github.com/bastelfreak))
- backend\_install: default to true in init.pp [\#138](https://github.com/voxpupuli/puppet-powerdns/pull/138) ([bastelfreak](https://github.com/bastelfreak))
- move static data from params.pp to init.pp [\#137](https://github.com/voxpupuli/puppet-powerdns/pull/137) ([bastelfreak](https://github.com/bastelfreak))
- Support configuration of multiple forward zones [\#135](https://github.com/voxpupuli/puppet-powerdns/pull/135) ([deric](https://github.com/deric))
- Convert to pdk [\#133](https://github.com/voxpupuli/puppet-powerdns/pull/133) ([deric](https://github.com/deric))
- Support 4.7 release [\#132](https://github.com/voxpupuli/puppet-powerdns/pull/132) ([deric](https://github.com/deric))
- Allow passing boolean [\#131](https://github.com/voxpupuli/puppet-powerdns/pull/131) ([deric](https://github.com/deric))
- allow using puppet generate types [\#130](https://github.com/voxpupuli/puppet-powerdns/pull/130) ([maxadamo](https://github.com/maxadamo))
- Ignore .git for pdk build [\#128](https://github.com/voxpupuli/puppet-powerdns/pull/128) ([promasu](https://github.com/promasu))

## [v2.2.2](https://github.com/voxpupuli/puppet-powerdns/tree/v2.2.2) (2022-07-12)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v2.2.1...v2.2.2)

**Merged pull requests:**

- Allow postgresql 8 module [\#121](https://github.com/voxpupuli/puppet-powerdns/pull/121) ([saz](https://github.com/saz))

## [v2.2.1](https://github.com/voxpupuli/puppet-powerdns/tree/v2.2.1) (2022-06-20)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v2.2.0...v2.2.1)

**Closed issues:**

- Please release v2.1.5 [\#125](https://github.com/voxpupuli/puppet-powerdns/issues/125)

## [v2.2.0](https://github.com/voxpupuli/puppet-powerdns/tree/v2.2.0) (2022-06-20)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/v2.1.4...v2.2.0)

**Merged pull requests:**

- sort pdnsutil output to avoid update on each puppet run [\#124](https://github.com/voxpupuli/puppet-powerdns/pull/124) ([trefzer](https://github.com/trefzer))
- disable rubocop errors on Gemfile and spec/spec\_helper\_acceptance.rb [\#123](https://github.com/voxpupuli/puppet-powerdns/pull/123) ([trefzer](https://github.com/trefzer))
- allow to manage zones and records \(with opt out\) with puppet  [\#122](https://github.com/voxpupuli/puppet-powerdns/pull/122) ([trefzer](https://github.com/trefzer))
- add support for version 4.6 [\#120](https://github.com/voxpupuli/puppet-powerdns/pull/120) ([maartenbeeckmans](https://github.com/maartenbeeckmans))
- fix bug duplicate resource yum-plugin-priorities [\#119](https://github.com/voxpupuli/puppet-powerdns/pull/119) ([fe80](https://github.com/fe80))
- Use the Rocky Linux mirrorlist when the OS name is Rocky [\#118](https://github.com/voxpupuli/puppet-powerdns/pull/118) ([wardhus](https://github.com/wardhus))

## [v2.1.4](https://github.com/voxpupuli/puppet-powerdns/tree/v2.1.4) (2021-12-21)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/2.1.3...v2.1.4)

**Merged pull requests:**

- Use package\_ensure on backends' packages [\#117](https://github.com/voxpupuli/puppet-powerdns/pull/117) ([surprisingb](https://github.com/surprisingb))

## [2.1.3](https://github.com/voxpupuli/puppet-powerdns/tree/2.1.3) (2021-10-22)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/2.1.2...2.1.3)

**Merged pull requests:**

- Update dependencies [\#115](https://github.com/voxpupuli/puppet-powerdns/pull/115) ([saz](https://github.com/saz))
- add 4.5 as supported version [\#114](https://github.com/voxpupuli/puppet-powerdns/pull/114) ([neufeind](https://github.com/neufeind))

## [2.1.2](https://github.com/voxpupuli/puppet-powerdns/tree/2.1.2) (2021-06-11)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/2.1.1...2.1.2)

**Closed issues:**

- support puppetlabs-mysql 11.0.0 [\#106](https://github.com/voxpupuli/puppet-powerdns/issues/106)
- support puppetlabs-stdlib 6.0.0 and higher [\#105](https://github.com/voxpupuli/puppet-powerdns/issues/105)
- sqlite parameta for shemata missing, presetting is wrong - reopen as not fixed yet. [\#100](https://github.com/voxpupuli/puppet-powerdns/issues/100)
- sqlite parameta for shemata missing, presetting is wrong [\#97](https://github.com/voxpupuli/puppet-powerdns/issues/97)

**Merged pull requests:**

- Run actions on push to any branch or pull requests [\#112](https://github.com/voxpupuli/puppet-powerdns/pull/112) ([saz](https://github.com/saz))
- update dependencies [\#111](https://github.com/voxpupuli/puppet-powerdns/pull/111) ([saz](https://github.com/saz))
- chore: revert unfinished bugfix [\#102](https://github.com/voxpupuli/puppet-powerdns/pull/102) ([ju5t](https://github.com/ju5t))
- Fix RedHat sqlite schema file [\#98](https://github.com/voxpupuli/puppet-powerdns/pull/98) ([LooOOooM](https://github.com/LooOOooM))

## [2.1.1](https://github.com/voxpupuli/puppet-powerdns/tree/2.1.1) (2021-02-07)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/2.1.0...2.1.1)

**Merged pull requests:**

- authoritative and recursor package should depend on apt repo, fixes \#90 [\#96](https://github.com/voxpupuli/puppet-powerdns/pull/96) ([saz](https://github.com/saz))
- add 4.4 as supported version [\#95](https://github.com/voxpupuli/puppet-powerdns/pull/95) ([saz](https://github.com/saz))
- allow local-ipv6 to be empty, fixes \#76 [\#94](https://github.com/voxpupuli/puppet-powerdns/pull/94) ([saz](https://github.com/saz))
- Allow empty value for security-poll-suffix [\#88](https://github.com/voxpupuli/puppet-powerdns/pull/88) ([saz](https://github.com/saz))

## [2.1.0](https://github.com/voxpupuli/puppet-powerdns/tree/2.1.0) (2021-02-07)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/2.0.0...2.1.0)

**Closed issues:**

- Dependency cycle if apt repo is managed [\#90](https://github.com/voxpupuli/puppet-powerdns/issues/90)
- Usage of version 4.4 not possible due to validation [\#89](https://github.com/voxpupuli/puppet-powerdns/issues/89)
- disable ipv6 [\#76](https://github.com/voxpupuli/puppet-powerdns/issues/76)

**Merged pull requests:**

- Support for FreeBSD platform and minor fixes [\#86](https://github.com/voxpupuli/puppet-powerdns/pull/86) ([olevole](https://github.com/olevole))

## [2.0.0](https://github.com/voxpupuli/puppet-powerdns/tree/2.0.0) (2021-01-04)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.7.2...2.0.0)

**Closed issues:**

- Add support for Puppet 7 [\#84](https://github.com/voxpupuli/puppet-powerdns/issues/84)
- Switch CI to Github Actions [\#83](https://github.com/voxpupuli/puppet-powerdns/issues/83)
- Puppet module dependency for epel [\#82](https://github.com/voxpupuli/puppet-powerdns/issues/82)
- PostgreSQL tests fail [\#80](https://github.com/voxpupuli/puppet-powerdns/issues/80)

**Merged pull requests:**

- Add support for Puppet 7 [\#85](https://github.com/voxpupuli/puppet-powerdns/pull/85) ([ju5t](https://github.com/ju5t))
- Fix postgresql tests [\#81](https://github.com/voxpupuli/puppet-powerdns/pull/81) ([brigriffin](https://github.com/brigriffin))

## [1.7.2](https://github.com/voxpupuli/puppet-powerdns/tree/1.7.2) (2020-12-05)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.7.1...1.7.2)

**Closed issues:**

- Upgrade dependencies [\#77](https://github.com/voxpupuli/puppet-powerdns/issues/77)

**Merged pull requests:**

- Add support for CentOS 8 [\#79](https://github.com/voxpupuli/puppet-powerdns/pull/79) ([ju5t](https://github.com/ju5t))
- Bump apt dependency to 7.6.0 [\#78](https://github.com/voxpupuli/puppet-powerdns/pull/78) ([brigriffin](https://github.com/brigriffin))
- add support for PDNS 4.3 and refactor data type and support case [\#73](https://github.com/voxpupuli/puppet-powerdns/pull/73) ([crigertg](https://github.com/crigertg))

## [1.7.1](https://github.com/voxpupuli/puppet-powerdns/tree/1.7.1) (2020-02-15)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.7.0...1.7.1)

## [1.7.0](https://github.com/voxpupuli/puppet-powerdns/tree/1.7.0) (2020-01-26)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.6.1...1.7.0)

## [1.6.1](https://github.com/voxpupuli/puppet-powerdns/tree/1.6.1) (2019-10-23)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.6.0...1.6.1)

**Closed issues:**

- Upgrade dependencies for Puppet 6 support [\#68](https://github.com/voxpupuli/puppet-powerdns/issues/68)

## [1.6.0](https://github.com/voxpupuli/puppet-powerdns/tree/1.6.0) (2019-03-16)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.5.0...1.6.0)

**Implemented enhancements:**

- Bump dependencies to recent versions [\#63](https://github.com/voxpupuli/puppet-powerdns/issues/63)

**Closed issues:**

- failing on OEL linux [\#64](https://github.com/voxpupuli/puppet-powerdns/issues/64)

## [1.5.0](https://github.com/voxpupuli/puppet-powerdns/tree/1.5.0) (2018-10-30)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.4.0...1.5.0)

**Implemented enhancements:**

- Support Ubuntu 18.04 [\#49](https://github.com/voxpupuli/puppet-powerdns/issues/49)

**Closed issues:**

- Epel module included as hard dependency [\#58](https://github.com/voxpupuli/puppet-powerdns/issues/58)

## [1.4.0](https://github.com/voxpupuli/puppet-powerdns/tree/1.4.0) (2018-06-06)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.3.0...1.4.0)

**Closed issues:**

- Support authoritative AND recursor simulaneously on one node [\#56](https://github.com/voxpupuli/puppet-powerdns/issues/56)

## [1.3.0](https://github.com/voxpupuli/puppet-powerdns/tree/1.3.0) (2018-05-24)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.2.3...1.3.0)

**Implemented enhancements:**

- PostgreSQL backend [\#8](https://github.com/voxpupuli/puppet-powerdns/issues/8)

**Closed issues:**

- mysql\_schema\_file is not working on Debian-systems [\#54](https://github.com/voxpupuli/puppet-powerdns/issues/54)
- Bind backend is broken [\#51](https://github.com/voxpupuli/puppet-powerdns/issues/51)
- Fresh install of powerdns 4.1 fails on Debian [\#47](https://github.com/voxpupuli/puppet-powerdns/issues/47)

## [1.2.3](https://github.com/voxpupuli/puppet-powerdns/tree/1.2.3) (2018-04-28)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.2.2...1.2.3)

**Fixed bugs:**

- Forge module contains lib/facter/powerdns\_version.rb with error [\#44](https://github.com/voxpupuli/puppet-powerdns/issues/44)

**Closed issues:**

- New $version parameter not doing anything [\#45](https://github.com/voxpupuli/puppet-powerdns/issues/45)

## [1.2.2](https://github.com/voxpupuli/puppet-powerdns/tree/1.2.2) (2018-04-20)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.2.1...1.2.2)

## [1.2.1](https://github.com/voxpupuli/puppet-powerdns/tree/1.2.1) (2018-04-19)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.2.0...1.2.1)

## [1.2.0](https://github.com/voxpupuli/puppet-powerdns/tree/1.2.0) (2018-04-19)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.1.0...1.2.0)

**Implemented enhancements:**

- Use database schemas provided by PowerDNS [\#40](https://github.com/voxpupuli/puppet-powerdns/issues/40)
- Update for powerdns 4.1 [\#30](https://github.com/voxpupuli/puppet-powerdns/issues/30)

## [1.1.0](https://github.com/voxpupuli/puppet-powerdns/tree/1.1.0) (2018-03-09)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.0.1...1.1.0)

**Implemented enhancements:**

- Module requires an old version of puppetlabs/apt [\#38](https://github.com/voxpupuli/puppet-powerdns/issues/38)
- powerdns::backends::mysql should set gmysql-host [\#31](https://github.com/voxpupuli/puppet-powerdns/issues/31)
- Remote MySQL Backend [\#19](https://github.com/voxpupuli/puppet-powerdns/issues/19)
- Redhat support [\#7](https://github.com/voxpupuli/puppet-powerdns/issues/7)

**Fixed bugs:**

- powerdns::config only accepts String [\#37](https://github.com/voxpupuli/puppet-powerdns/issues/37)

## [1.0.1](https://github.com/voxpupuli/puppet-powerdns/tree/1.0.1) (2018-02-13)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/1.0.0...1.0.1)

## [1.0.0](https://github.com/voxpupuli/puppet-powerdns/tree/1.0.0) (2018-02-13)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.12...1.0.0)

**Implemented enhancements:**

- powerdns::config ensure =\> absent should remove setting and shouldn't require 'value' [\#20](https://github.com/voxpupuli/puppet-powerdns/issues/20)

**Fixed bugs:**

- Tests are not passing anymore [\#21](https://github.com/voxpupuli/puppet-powerdns/issues/21)

**Closed issues:**

- README.md mentions 'listen-address' instead of 'local-address' [\#18](https://github.com/voxpupuli/puppet-powerdns/issues/18)

## [0.0.12](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.12) (2017-10-14)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.11...0.0.12)

## [0.0.11](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.11) (2017-08-30)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.10...0.0.11)

**Fixed bugs:**

- powerdns::config should allow empty value on only-notify  [\#15](https://github.com/voxpupuli/puppet-powerdns/issues/15)

**Merged pull requests:**

- Update Ruby versions in our tests [\#17](https://github.com/voxpupuli/puppet-powerdns/pull/17) ([ju5t](https://github.com/ju5t))
- Allow only-notify to be empty [\#16](https://github.com/voxpupuli/puppet-powerdns/pull/16) ([ju5t](https://github.com/ju5t))

## [0.0.10](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.10) (2017-07-11)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.9...0.0.10)

## [0.0.9](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.9) (2017-07-11)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.8...0.0.9)

**Implemented enhancements:**

- Add Changelog [\#13](https://github.com/voxpupuli/puppet-powerdns/issues/13)

**Closed issues:**

- instal: apt and mysql problems [\#12](https://github.com/voxpupuli/puppet-powerdns/issues/12)

## [0.0.8](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.8) (2017-02-09)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.7...0.0.8)

**Fixed bugs:**

- db\_root\_password is still required if backend\_install is false [\#10](https://github.com/voxpupuli/puppet-powerdns/issues/10)

**Merged pull requests:**

- Change basic check to look at backend\_install [\#11](https://github.com/voxpupuli/puppet-powerdns/pull/11) ([benhainline](https://github.com/benhainline))
- Be able to overwrite package version [\#9](https://github.com/voxpupuli/puppet-powerdns/pull/9) ([stevie-](https://github.com/stevie-))

## [0.0.7](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.7) (2016-12-23)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.6...0.0.7)

**Merged pull requests:**

- Only try to set config if we want to the corresponding services [\#6](https://github.com/voxpupuli/puppet-powerdns/pull/6) ([stevie-](https://github.com/stevie-))

## [0.0.6](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.6) (2016-11-04)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.5...0.0.6)

**Closed issues:**

- Spelling Fix [\#3](https://github.com/voxpupuli/puppet-powerdns/issues/3)

**Merged pull requests:**

- Spelling Fix [\#4](https://github.com/voxpupuli/puppet-powerdns/pull/4) ([pckls](https://github.com/pckls))
- Be able to overwrite supermaster\_query [\#2](https://github.com/voxpupuli/puppet-powerdns/pull/2) ([stevie-](https://github.com/stevie-))
- Support to disable repo installation and use custom repo [\#1](https://github.com/voxpupuli/puppet-powerdns/pull/1) ([stevie-](https://github.com/stevie-))

## [0.0.5](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.5) (2016-10-12)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.4...0.0.5)

## [0.0.4](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.4) (2016-10-09)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.3...0.0.4)

## [0.0.3](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.3) (2016-09-28)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.2...0.0.3)

## [0.0.2](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.2) (2016-08-11)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/0.0.1...0.0.2)

## [0.0.1](https://github.com/voxpupuli/puppet-powerdns/tree/0.0.1) (2016-07-30)

[Full Changelog](https://github.com/voxpupuli/puppet-powerdns/compare/ba18260ad5a1f431560d2d6d161853991af0a02f...0.0.1)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
