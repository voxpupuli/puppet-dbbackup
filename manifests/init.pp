class dbbackup (
  Integer $pigz_cpu_cores             = $facts['processors']['count'],
  Stdlib::Absolutepath $destination   = '/mnt/dumps',
  String $interval                    = '1h',
  Optional[Integer[1]] $backuphistory = undef,
  Boolean $cleanup_empty_backup_dirs = true,
) {
  contain dbbackup::install
  contain dbbackup::service

  Class['dbbackup::install']
  ~> Class['dbbackup::service']
}
