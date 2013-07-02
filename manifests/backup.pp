define simplebackup::backup(source, listfile="/var/backuplist") {

	concat::fragment{"backup_${source}":
      target => $listfile,
      content => "${source}\n",
      order   => 01,
   }

}