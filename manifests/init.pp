class dbbackup (
  Integer $pigz_cpu_cores             = $facts['processors']['count'],
  Stdlib::Absolutepath $destination   = '/mnt/dumps',
  String $interval                    = '1h',
  Optional[Integer[1]] $backuphistory = undef,
  Boolean $cleanup_empty_backup_dirs = true,
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
