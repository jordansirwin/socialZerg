#!/usr/bin/env bash
# gets required puppet modules

# open firewall
sudo iptables -I INPUT 1 -p tcp --dport 9200 -j ACCEPT
service iptables save


# add modules if not already added
if [ ! -d /vagrant/puppet/modules/java ]; then 
  puppet module install puppetlabs-java --modulepath /vagrant/puppet/modules
fi 
if [ ! -d /vagrant/puppet/modules/elasticsearch ]; then 
  puppet module install elasticsearch-elasticsearch --modulepath /vagrant/puppet/modules
fi 
if [ ! -d /vagrant/puppet/modules/logstash ]; then 
  puppet module install elasticsearch-logstash --modulepath /vagrant/puppet/modules
fi 
