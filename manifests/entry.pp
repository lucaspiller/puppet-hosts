define hosts::entry(ip,hostname,aliases=[]) {

    $real_ip = $ip
    $real_hostname = $hostname
    $real_aliases = $aliases

    file {"hosts_${real_ip}":
        path => "/etc/hosts.d/:


    }
}
