class hosts::base {

	file {"Source Directory":
		ensure => directory,
		path => "/etc/hosts.d",
		owner => "root",
		group => "root",
		mode => "0700",
		purge => true,
		recurse => true,
	}

	file {"README":
		ensure => present,
		path => "/etc/hosts.d/README",
		content => template("hosts/README.erb"),
		owner => "root",
		group => "root",
		mode => "0600",
		purge => true,
		recurse => true,
	}

}

