define simplebackup::backupsystem($server=$name, $serverpath, $serveruser="root", $listfile="/var/backuplist", $key="/root/.ssh/id_rsa", $cron_hour=ip_to_cron(1,24),$cron_minute=0) {
	
	file { "/bin/backup.sh":
		owner => "root",
		group => "root",
		mode  => "0700",
		content => template("simplebackup/backup.sh.erb"),
		ensure => present,
	}

	cron { "backup":
		command => "/bin/backup.sh",
		user 	=> "root",
		hour    => $cron_hour,
		minute	=> $cron_minute,
	}

	concat { $listfile:
		owner => "root",
		group => "root",
		mode  => "0600",
	}
}