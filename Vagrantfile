# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # node app to get twitter data and sent to elastic search
  config.vm.define "twitget" do |twitget|
    twitget.vm.box = "puppetlabs/centos-6.6-64-puppet"
    twitget.vm.box_version = "1.0.1" # due to --manifestdir bug
    twitget.vm.hostname = "twitget"
    twitget.vm.network "private_network", ip: "10.0.0.10"
    twitget.vm.provision "shell", path: 'bootstrap-node.sh', privileged: false 
  end

  # elastic search
  config.vm.define "elasticsearch" do |elasticsearch|
    elasticsearch.vm.box = "puppetlabs/centos-6.6-64-puppet"
    elasticsearch.vm.box_version = "1.0.1" # due to --manifestdir bug
    elasticsearch.vm.hostname = "elasticsearch"
    elasticsearch.vm.network "private_network", ip: "10.0.0.11"

    elasticsearch.vm.provision "shell", path: 'bootstrap-elasticsearch.sh', privileged: false 
    elasticsearch.vm.provision "puppet" do |puppet|
      #puppet.options = "--verbose --debug --summarize"
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "elasticsearch.pp"
    end
  end

  # kibana
  config.vm.define "kibana" do |kibana|
    kibana.vm.box = "puppetlabs/centos-6.6-64-puppet"
    kibana.vm.box_version = "1.0.1" # due to --manifestdir bug
    kibana.vm.hostname = "kibana"
    kibana.vm.network "private_network", ip: "10.0.0.12"
    kibana.vm.network :forwarded_port, guest: 5601, host: 5601

    kibana.vm.provision "shell", path: 'bootstrap-kibana.sh', privileged: false 
    kibana.vm.provision "puppet" do |puppet|
      #puppet.options = "--verbose --debug --summarize"
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "kibana.pp"
    end
  end

end
