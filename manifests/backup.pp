define simplebackup::backup(source=$name, listfile="/var/backuplist") {

	concat::fragment{"backup_${source}":
      target => $listfile,
      content => "${source}\n",
      order   => 01,
   }

}