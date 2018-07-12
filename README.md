# Archived: Project has been moved to [CodingWorkshop](https://git.codingworkshop.eu.org/)!

This repository will probably NOT be updated anymore.
Check [CodingWorkshop GIT](https://git.codingworkshop.eu.org/) for up-to-date version and other projects.


# WAN Monitor &amp; Failover Connection Manager

The wanmonitor package is an agent script that makes Multi-WAN configuration simple,
easy to use and manageable. It comes complete with failover setup supporting many
types of internet connections, including PPPoE and mobile connections. The uci
configuration file /etc/config/wanmonitor is provided as part of the wanmonitorpackage.

The WanMonitor provides the following capabilities:
* provides outbound WAN traffic failover connection setup
* monitors primary link by checking interface status and repeated ping tests
* automatically routes outbound traffic to secondary WAN interface if primary is down
* automatically routes outbound traffic back to primary interface when it is available again
* easy to use and manageable configuration via single file
* up to 2 physical interfaces for easy load-balancing setups


# Configuration

All configuration is done in /etc/config/wanmonitor file. Options available:
* check_host - IP address of remote host used to check Internet connectivity
* interval - Number of seconds to wait between checks
* sleep - number of seconds to wait for slow links during startup
* wan_primary - Primary WAN interface name to use
* wan_secondary - Secondary WAN interface name to use

What is more it can make a use of WAN routes metrics set in /etc/config/network,
thus allowing to use PPPoE to work correctly. When PPPoE connection is established,
it automatically adds a route with proper (higher) priority and this connection
is being used as default. After a while, when WanMonitor notices primary connection
is again available, it removes a route for secondary WAN connection (eg. in order to
save mobile traffic).


# Sample configuration

/etc/config/network:
<pre>	config interface 'wan1'
        option ifname 'eth0'
        option metric '0'
        option proto 'pppoe'
        option username 'login'
        option password 'password'
        option service 'PPPoE'

	config interface 'wan2'
        option ifname 'eth1'
        option proto 'dhcp'
        option metric '5'
        option defaultroute '0'
        option service 'LTE'</pre>

/etc/config/wanmonitor:
<pre>	config wanmonitor
        option check_host '8.8.8.8'
        option interval '5'
        option sleep '5'
        option wan_primary 'wan1'
        option wan_secondary 'wan2'</pre>
