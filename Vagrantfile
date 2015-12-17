# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "twitget" do |twitget|
    twitget.vm.box = "puppetlabs/centos-6.6-64-puppet"
    twitget.vm.box_version = "1.0.1" # due to --manifestdir bug
    twitget.vm.provision "shell", path: 'bootstrap-node.sh', privileged: false 
  end

  config.vm.define "elasticsearch" do |elasticsearch|
    elasticsearch.vm.box = "puppetlabs/centos-6.6-64-puppet"
    elasticsearch.vm.box_version = "1.0.1" # due to --manifestdir bug
    elasticsearch.vm.provision "shell", path: 'bootstrap-elastic.sh', privileged: false 
    elasticsearch.vm.provision "puppet" do |puppet|
      #puppet.options = "--verbose --debug --summarize"
      puppet.manifests_path = "puppet/manifests"
      puppet.module_path    = "puppet/modules"
      puppet.manifest_file  = "elastic.pp"
    end
  end

end
