# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`dbbackup`](#dbbackup): module to configure a systemd timer + script to backup postgres, mysql and ldap databases

## Classes

### <a name="dbbackup"></a>`dbbackup`

module to configure a systemd timer + script to backup postgres, mysql and ldap databases

#### Parameters

The following parameters are available in the `dbbackup` class:

* [`pigz_cpu_cores`](#-dbbackup--pigz_cpu_cores)
* [`destination`](#-dbbackup--destination)
* [`interval`](#-dbbackup--interval)
* [`backuphistory`](#-dbbackup--backuphistory)
* [`cleanup_empty_backup_dirs`](#-dbbackup--cleanup_empty_backup_dirs)
* [`dependencies`](#-dbbackup--dependencies)
* [`manage_dependencies`](#-dbbackup--manage_dependencies)

##### <a name="-dbbackup--pigz_cpu_cores"></a>`pigz_cpu_cores`

Data type: `Optional[Integer[1]]`

number of cpu cores used for backup compression. If undefined, nproc will be used when available.

Default value: `undef`

##### <a name="-dbbackup--destination"></a>`destination`

Data type: `Stdlib::Absolutepath`

directory where backups will be stored (with one subdirectory per backup day)

Default value: `'/mnt/dumps'`

##### <a name="-dbbackup--interval"></a>`interval`

Data type: `String[2]`

how often the systemd timer will trigger the dump script. This will be used for the OnUnitInactiveSec option in the timer

Default value: `'1h'`

##### <a name="-dbbackup--backuphistory"></a>`backuphistory`

Data type: `Optional[Integer[1]]`

number of days to keep the backup history

Default value: `undef`

##### <a name="-dbbackup--cleanup_empty_backup_dirs"></a>`cleanup_empty_backup_dirs`

Data type: `Boolean`

enable/disable a post command to cleanup empty directories with $destination. They can occour if the system run out of free diskspace

Default value: `true`

##### <a name="-dbbackup--dependencies"></a>`dependencies`

Data type: `Array[String[1]]`

array of dependencies for the database dump script

Default value: `['pigz']`

##### <a name="-dbbackup--manage_dependencies"></a>`manage_dependencies`

Data type: `Boolean`

Boolean to enable/disable the installation of the dependencies. defaults to false because the parameter was added after the initial release

Default value: `false`

