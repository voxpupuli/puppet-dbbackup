class dbbackup::install {

  assert_private("You're calling a private class, you're not supposed to do this")

  file{'/usr/local/bin/dump_databases':
    content => epp("${module_name}/dump_databases.epp", {'destination' => $dbbackup::destination, 'pigz_cpu_cores' => $dbbackup::pigz_cpu_cores}),
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }
}
