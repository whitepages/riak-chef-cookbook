# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  config.vm.provision :shell, :inline => "mkdir -p /opt/cookbooks && if [ ! -d /opt/cookbooks/riak ]; then ln -s /vagrant/ /opt/cookbooks/riak; fi"

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding 
  # some recipes and/or roles.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = [[:vm, "/opt"]]
    chef.add_recipe "riak"
  
    # You may also specify custom JSON attributes:
    chef.json = { 
      "riak" => {
        "package" => {
          "url" => "http://s3.amazonaws.com/downloads.basho.com/riak/1.1/1.1.4/riak_1.1.4-1_amd64.deb"
        }
      }
    }
  end
end
