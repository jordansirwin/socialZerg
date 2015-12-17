#!/usr/bin/env bash
# gets required puppet modules

sudo yum -y update yum
sudo rm -rf /var/cache/yum/*

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
