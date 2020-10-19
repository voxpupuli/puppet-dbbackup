class dbbackup::service {
  assert_private("You're calling a private class, you're not supposed to do this")

  systemd::timer { 'dump_databases.timer':
    enable          => true,
    active          => true,
    timer_content   => epp("${module_name}/dump_databases.timer.epp", {
        'interval' => $dbbackup::interval,
    }),
    service_content => epp("${module_name}/dump_databases.service.epp", {
        'backuphistory'             => $dbbackup::backuphistory,
        'destination'               => $dbbackup::destination,
        'cleanup_empty_backup_dirs' => $dbbackup::cleanup_empty_backup_dirs
    }),
  }
}
