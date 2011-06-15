class hosts::base {

    file {"Source Directory":
        ensure => directory,
        path => "/etc/hosts.d",
        owner => "root",
        group => "root",
        mode => "0700",
    }

}
