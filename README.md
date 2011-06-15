# Module hosts

# Define hosts::entry

Manages `/etc/hosts/` completely.

If you want to use this module this is an all or nothing choice. Don't
expect to add a `hosts::entry` resource and find it magically appear side by
side with the host entries that existed before using the module.

A sample is provided below and resembles the default hosts entries on
Debian/Squeeze (6.0.1).

## Parameters

    $ip:
        This should be either the IPv4 or IPv6 address desired. No sanity
        checks are made the values are treated transparently as strings.
    $hostname:
        The main hostname entry for the given IP address
    $aliases:
        A list of aliases for the given IP address. The default is the empty
        list (`[]`). Thus no aliases are generated.

# Sample Usage

    node "client.example.invalid" {
        hosts::entry {"1":
            ip => "127.0.0.1",
            hostname => "localhost",
        }
        hosts::entry {"2":
            ip => "127.0.1.1",
            hostname => "client.example.invalid",
            aliases => ["client",],
        }
    
        # The following lines are desirable for IPv6 capable hosts
        hosts::entry {"3":
            ip => "::1",
            hostname => "ip6-localhost",
            aliases => ["ip6-loopback",],
        }
        hosts::entry {"4":
            ip => "fe00::0",
            hostname => "ip6-localnet",
        }
        hosts::entry {"5":
            ip => "ff00::0",
            hostname => "ip6-mcastprefix",
        }
        hosts::entry {"6":
            ip => "ff02::1",
            hostname => "ip6-allnodes",
        }
        hosts::entry {"7":
            ip => "ff02::2",
            hostname => "ip6-allrouters",
        }
    
    }

