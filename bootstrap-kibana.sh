#!/usr/bin/env bash
# gets required puppet modules

# open firewall
sudo iptables -I INPUT 1 -p tcp --dport 5601 -j ACCEPT
service iptables saved


# add modules if not already added
if [ ! -d /vagrant/puppet/modules/kibana ]; then 
  puppet module install evenup-kibana --modulepath /vagrant/puppet/modules
fi 