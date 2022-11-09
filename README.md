hi libera
# puppet-dbbackup

[![Build Status](https://github.com/voxpupuli/puppet-dbbackup/workflows/CI/badge.svg)](https://github.com/voxpupuli/puppet-dbbackup/actions?query=workflow%3ACI)
[![Release](https://github.com/voxpupuli/puppet-dbbackup/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/puppet-dbbackup/actions/workflows/release.yml)
[![Puppet Forge](https://img.shields.io/puppetforge/v/puppet/dbbackup.svg)](https://forge.puppetlabs.com/puppet/dbbackup)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/puppet/dbbackup.svg)](https://forge.puppetlabs.com/puppet/dbbackup)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/puppet/dbbackup.svg)](https://forge.puppetlabs.com/puppet/dbbackup)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/puppet/dbbackup.svg)](https://forge.puppetlabs.com/puppet/dbbackup)
[![puppetmodule.info docs](http://www.puppetmodule.info/images/badge.png)](http://www.puppetmodule.info/m/puppet-dbbackup)
[![AGPL v3 License](https://img.shields.io/github/license/voxpupuli/puppet-dbbackup.svg)](LICENSE)

## Table of Contents

* [Overview](#overview)
* [Example configuration](#example-configuration)
* [Tests](#tests)
* [Contributions](#contributions)
* [License and Author](#license-and-author)

## Overview

This is a module for deploying a backup solution for mysql,postgresql and LDAP databases.

It configures two things, the `dump_databases` script in `/usr/local/bin/`, and
a sytemd timer+service to start it. multiple parameters are exposed to
configure the history you want to keep and also the backup interval. All
parameters have [puppet-strings](https://puppet.com/docs/puppet/latest/puppet_strings.html)
documentation in the [REFERENCE.md](REFERENCE.md). Dependingon the database you
backup, multiple CLI tools are required:

* psql
* pg_dumpall
* mysql
* mysqldump
* slapcat
* pigz

The script always assumes that it's executed on the same machine that runs the
database. The dependencies aren't managed by this module.

## Example configuration

You can simply include the class and it will do dumps every 1 hour and never
delete them:

```puppet
include dbbackup
```

you can also configure parameter via Hiera or Puppet DSL. An example:

```yaml
dbbackup::backuphistory: 730
dbbackup::destination: '/var/dumps'
dbbackup::interval: '2h'
```

## Tests

This module has several unit tests and linters configured. You can execute them
by running:

```sh
bundle exec rake test
```

Detailed instructions are in the [CONTRIBUTING.md](.github/CONTRIBUTING.md)
file.

## Contributions

Contribution is fairly easy:

* Fork the module into your namespace
* Create a new branch
* Commit your bugfix or enhancement
* Write a test for it (maybe start with the test first)
* Create a pull request

Detailed instructions are in the [CONTRIBUTING.md](.github/CONTRIBUTING.md)
file.

## License and Author

This module was originally written by [Tim Meusel](https://github.com/bastelfreak).
It's licensed with [AGPL version 3](LICENSE).
