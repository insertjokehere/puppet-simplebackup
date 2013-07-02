define simplebackup::backupsystem(server, serverpath, serveruser="root", listfile="/var/backuplist", key="/root/.ssh/id_rsa") {
	
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
		hour    => ip_to_cron(1,24),
		minute	=> 0,
	}

	concat { $listfile:
		owner => "root",
		group => "root",
		mode  => "0600",
	}
}