# @summary module to configure a systemd timer + script to backup postgres, mysql and ldap databases
#
# @param pigz_cpu_cores
#   number of cpu cores used for backup compression
# @param destination
#   directory where backups will be stored (with one subdirectory per backup day)
# @param interval
#   how often the systemd timer will trigger the dump script. This will be used for the OnUnitInactiveSec option in the timer
# @param backuphistory
#   number of days to keep the backup history
# @param cleanup_empty_backup_dirs
#   enable/disable a post command to cleanup empty directories with $destination. They can occour if the system run out of free diskspace
#
# @author Tim Meusel <tim@bastelfreak.de>
class dbbackup (
  Integer[1] $pigz_cpu_cores          = $facts['processors']['count'],
  Stdlib::Absolutepath $destination   = '/mnt/dumps',
  String[2] $interval                 = '1h',
  Optional[Integer[1]] $backuphistory = undef,
  Boolean $cleanup_empty_backup_dirs  = true,
) {
  file { '/usr/local/bin/dump_databases':
    content => epp("${module_name}/dump_databases.epp", {
        'destination'    => $destination,
        'pigz_cpu_cores' => $pigz_cpu_cores,
    }),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }
  -> systemd::timer { 'dump_databases.timer':
    enable          => true,
    active          => true,
    timer_content   => epp("${module_name}/dump_databases.timer.epp", {
        'interval' => $interval,
    }),
    service_content => epp("${module_name}/dump_databases.service.epp", {
        'backuphistory'             => $backuphistory,
        'destination'               => $destination,
        'cleanup_empty_backup_dirs' => $cleanup_empty_backup_dirs,
    }),
  }
}
