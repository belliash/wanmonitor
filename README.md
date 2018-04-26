# WAN Monitor &amp; Failover Connection Manager


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
<pre>config interface 'wan1'
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
<pre>config wanmonitor
        option check_host '8.8.8.8'
        option interval '5'
        option sleep '5'
        option wan_primary 'wan1'
        option wan_secondary 'wan2'</pre>
