Package {
  allow_virtual => false
}

# kibana requires java
class { 'java': }

# install kibana
class { 'kibana': 
  version => '4.3.1',
  es_url => 'http://10.0.0.11:9200',
  port => 5601
}
