# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v2.2.0](https://github.com/voxpupuli/puppet-dbbackup/tree/v2.2.0) (2025-06-24)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/v2.1.0...v2.2.0)

**Implemented enhancements:**

- add : ubuntu2404 as supported OS [\#76](https://github.com/voxpupuli/puppet-dbbackup/pull/76) ([Tonguechaude](https://github.com/Tonguechaude))
- metadata.json: Add OpenVox [\#75](https://github.com/voxpupuli/puppet-dbbackup/pull/75) ([jstraw](https://github.com/jstraw))

**Merged pull requests:**

- puppet/systemd: allow 8.x [\#72](https://github.com/voxpupuli/puppet-dbbackup/pull/72) ([jay7x](https://github.com/jay7x))

## [v2.1.0](https://github.com/voxpupuli/puppet-dbbackup/tree/v2.1.0) (2024-07-04)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/v2.0.0...v2.1.0)

**Implemented enhancements:**

- add Ubuntu 20.04 and 22.04 [\#68](https://github.com/voxpupuli/puppet-dbbackup/pull/68) ([Dan33l](https://github.com/Dan33l))
- puppetlabs/systemd: Allow 6.x [\#61](https://github.com/voxpupuli/puppet-dbbackup/pull/61) ([zilchms](https://github.com/zilchms))

**Merged pull requests:**

- update puppet-systemd upper bound to 8.0.0 [\#64](https://github.com/voxpupuli/puppet-dbbackup/pull/64) ([TheMeier](https://github.com/TheMeier))

## [v2.0.0](https://github.com/voxpupuli/puppet-dbbackup/tree/v2.0.0) (2023-08-19)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/v1.3.1...v2.0.0)

**Breaking changes:**

- Drop Puppet 6 support [\#51](https://github.com/voxpupuli/puppet-dbbackup/pull/51) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- puppet/systemd: Allow 5.x [\#57](https://github.com/voxpupuli/puppet-dbbackup/pull/57) ([bastelfreak](https://github.com/bastelfreak))
- Add Puppet 8 support [\#55](https://github.com/voxpupuli/puppet-dbbackup/pull/55) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: Allow 9.x [\#54](https://github.com/voxpupuli/puppet-dbbackup/pull/54) ([bastelfreak](https://github.com/bastelfreak))
- bump puppet/systemd to \< 5.0.0 [\#47](https://github.com/voxpupuli/puppet-dbbackup/pull/47) ([jhoblitt](https://github.com/jhoblitt))
- Fail script on error [\#44](https://github.com/voxpupuli/puppet-dbbackup/pull/44) ([hashworks](https://github.com/hashworks))

## [v1.3.1](https://github.com/voxpupuli/puppet-dbbackup/tree/v1.3.1) (2022-08-27)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/v1.3.0...v1.3.1)

**Fixed bugs:**

- systemd: Set WorkingDirectory=~ [\#42](https://github.com/voxpupuli/puppet-dbbackup/pull/42) ([bastelfreak](https://github.com/bastelfreak))

## [v1.3.0](https://github.com/voxpupuli/puppet-dbbackup/tree/v1.3.0) (2022-07-11)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/v1.2.1...v1.3.0)

**Implemented enhancements:**

- mysql: log each dumped database [\#40](https://github.com/voxpupuli/puppet-dbbackup/pull/40) ([bastelfreak](https://github.com/bastelfreak))

## [v1.2.1](https://github.com/voxpupuli/puppet-dbbackup/tree/v1.2.1) (2022-07-11)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/v1.2.0...v1.2.1)

**Fixed bugs:**

- mysql: log skipped databases [\#38](https://github.com/voxpupuli/puppet-dbbackup/pull/38) ([bastelfreak](https://github.com/bastelfreak))
- mysql: skip performance\_schema [\#37](https://github.com/voxpupuli/puppet-dbbackup/pull/37) ([bastelfreak](https://github.com/bastelfreak))

## [v1.2.0](https://github.com/voxpupuli/puppet-dbbackup/tree/v1.2.0) (2022-04-20)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/v1.1.1...v1.2.0)

**Implemented enhancements:**

- Add CentOS 9 support [\#34](https://github.com/voxpupuli/puppet-dbbackup/pull/34) ([bastelfreak](https://github.com/bastelfreak))
- Add CentOS 8 support [\#32](https://github.com/voxpupuli/puppet-dbbackup/pull/32) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- fixtures.yml: switch to https urls [\#35](https://github.com/voxpupuli/puppet-dbbackup/pull/35) ([bastelfreak](https://github.com/bastelfreak))

## [v1.1.1](https://github.com/voxpupuli/puppet-dbbackup/tree/v1.1.1) (2021-08-26)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/v1.1.0...v1.1.1)

**Merged pull requests:**

- Allow up-to-date dependencies [\#23](https://github.com/voxpupuli/puppet-dbbackup/pull/23) ([smortex](https://github.com/smortex))

## [v1.1.0](https://github.com/voxpupuli/puppet-dbbackup/tree/v1.1.0) (2021-07-26)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/v1.0.1...v1.1.0)

**Implemented enhancements:**

- Add parameter `dependencies` to manage additional dependencies [\#20](https://github.com/voxpupuli/puppet-dbbackup/pull/20) ([bastelfreak](https://github.com/bastelfreak))

## [v1.0.1](https://github.com/voxpupuli/puppet-dbbackup/tree/v1.0.1) (2021-07-26)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/v1.0.0...v1.0.1)

**Merged pull requests:**

- switch from camptocamp/systemd to voxpupuli/systemd [\#17](https://github.com/voxpupuli/puppet-dbbackup/pull/17) ([bastelfreak](https://github.com/bastelfreak))

## [v1.0.0](https://github.com/voxpupuli/puppet-dbbackup/tree/v1.0.0) (2021-05-18)

[Full Changelog](https://github.com/voxpupuli/puppet-dbbackup/compare/b37883a0bdcd3d32989f109fb888cfd429ea9b82...v1.0.0)

**Breaking changes:**

- Drop Eol Puppet 5 support [\#14](https://github.com/voxpupuli/puppet-dbbackup/pull/14) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Enable Puppet 7 support [\#15](https://github.com/voxpupuli/puppet-dbbackup/pull/15) ([bastelfreak](https://github.com/bastelfreak))
- camptocamp/systemd: allow 3.x [\#13](https://github.com/voxpupuli/puppet-dbbackup/pull/13) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs/stdlib: allow 7.x [\#12](https://github.com/voxpupuli/puppet-dbbackup/pull/12) ([bastelfreak](https://github.com/bastelfreak))
- Allow pigz\_cpu\_cores to be undefined [\#9](https://github.com/voxpupuli/puppet-dbbackup/pull/9) ([ekohl](https://github.com/ekohl))

**Fixed bugs:**

- fix puppet-lint warnings [\#1](https://github.com/voxpupuli/puppet-dbbackup/pull/1) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- README.md: Add badges [\#8](https://github.com/voxpupuli/puppet-dbbackup/pull/8) ([bastelfreak](https://github.com/bastelfreak))
- Enable acceptance tests [\#7](https://github.com/voxpupuli/puppet-dbbackup/pull/7) ([bastelfreak](https://github.com/bastelfreak))
- Add README.md [\#6](https://github.com/voxpupuli/puppet-dbbackup/pull/6) ([bastelfreak](https://github.com/bastelfreak))
- add puppet-strings documentation [\#5](https://github.com/voxpupuli/puppet-dbbackup/pull/5) ([bastelfreak](https://github.com/bastelfreak))
- Reduce it to a single file [\#3](https://github.com/voxpupuli/puppet-dbbackup/pull/3) ([ekohl](https://github.com/ekohl))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
