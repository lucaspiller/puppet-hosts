class hosts::target {
	file {"Temp Hosts File":
		ensure => present,
		path => "/var/tmp/etc_hosts",
		owner => "root",
        	group => "root",
        	mode => "0600",

		notify => Exec["Generate Hosts File"],
	}

	exec {"Generate Hosts File":
		command => "/usr/bin/find /etc/hosts.d/ -maxdepth 1 -type f -name '*.host' -print0 | /usr/bin/xargs -0 cat >| /var/tmp/etc_hosts",
		refreshonly => true,
		notify => File["Hosts File"],
	}
	file {"Hosts File":
		ensure => present,
		path => "/etc/hosts",
		source => "/var/tmp/etc_hosts",
		owner => "root",
        	group => "root",
        	mode => "0644",
	}
}

