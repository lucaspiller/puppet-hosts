define hosts::entry($ip,$hostname,$aliases=[]) {

	$real_name = $name
	$real_ip = $ip
	$real_hostname = $hostname
	$real_aliases = $aliases

	include "base" # needed so that the require works
	include "target" # needed so that the notify works
	file {"${real_name}":
		ensure => present,
		path => "/etc/hosts.d/${real_name}.host",
		content => template("hosts/host_line.erb"),
		owner => "root",
        	group => "root",
        	mode => "0600",

		require => Class["hosts::base"],
		notify => Class["hosts::target"],
	}

}
