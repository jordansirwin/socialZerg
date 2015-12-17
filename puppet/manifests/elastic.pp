# Set the right versions for our installation.
$elasticsearch_application_version = '2.x'

Package {
  allow_virtual => false
}

# elasticsearch requires java
class { 'java': }

# setup yum repo for elasticsearch
yumrepo { 'elasticsearch':
  name => 'elasticsearch',
  descr => "Elasticsearch repository for ${elasticsearch_application_version} packages",
  baseurl => "http://packages.elasticsearch.org/elasticsearch/${elasticsearch_application_version}/centos",
  gpgcheck => 1,
  gpgkey => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch',
  enabled => 1
}

class { 'elasticsearch':
  require => [ Yumrepo['elasticsearch'] ]
}

elasticsearch::instance { 'es-01':
  config => { 
  'cluster.name' => 'vagrant_elasticsearch',
  'index.number_of_replicas' => '0',
  'index.number_of_shards'   => '1',
  'network.host' => '0.0.0.0',
  'marvel.agent.enabled' => false 
  },        
  # Configuration hash
  init_defaults => { }, # Init defaults hash
  #before => Exec['start kibana']
}