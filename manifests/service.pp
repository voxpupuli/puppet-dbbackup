class dbbackup::service {
  assert_private("You're calling a private class, you're not supposed to do this")
  systemd::unit_file{'dump_databases.service':
    content => epp("${module_name}/dump_databases.service.epp", {
      'backuphistory'             => $dbbackup::backuphistory,
      'destination'               => $dbbackup::destination,
      'cleanup_empty_backup_dirs' => $dbbackup::cleanup_empty_backup_dirs
      }),
  }
  -> systemd::unit_file{'dump_databases.timer':
    content => epp("${module_name}/dump_databases.timer.epp", {'interval' => $dbbackup::interval}),
  }
  ~> service{'dump_databases.timer':
    ensure => 'running',
    enable => true,
  }
}
