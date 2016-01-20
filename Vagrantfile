# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network "forwarded_port", guest: 8153, host: 8153

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    # vb.gui = "true"
    vb.memory = "4096"
  end

  config.vm.provision "puppet" 

end
