define simplebackup::backup($source=$name, $listfile="/var/backuplist") {

	if $source =~ /.*//$/ {
		$t  = $source
	} else {
		$s = "${source}/"
	}

	concat::fragment{"backup_${source}":
      target => $listfile,
      content => "${t}\n",
      order   => 01,
   }

}