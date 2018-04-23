# wanmonitor
WAN Monitor &amp; Failover Connection Manager

All configuration is done in /etc/config/wanmonitor file. Options available:
* check_host - IP address of remote host used to check Internet connectivity
* interval - Number of seconds to wait between checks
* wan_primary - Primary WAN interface name to use
* wan_secondary - Secondary WAN interface name to use

In order to work this software correctly it is recommended to disable default routes on all WAN interfaces.
