# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 8153, host: 8153

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #  vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL

	echo "deb https://download.go.cd /" | sudo tee /etc/apt/sources.list.d/gocd.list
	curl https://download.go.cd/GOCD-GPG-KEY.asc | sudo apt-key add -

	apt-get update
	apt-get install -y git default-jdk go-server

	# Put our config file in place
	/etc/init.d/go-server stop
	/bin/bash /vagrant/update_config.sh
	/etc/init.d/go-server start

	apt-get install -y go-agent
	/etc/init.d/go-agent start

	# Install 2nd agent
	ln -s /etc/init.d/go-agent /etc/init.d/go-agent-1
  	ln -s /usr/share/go-agent /usr/share/go-agent-1
  	cp /etc/default/go-agent /etc/default/go-agent-1
  	mkdir /var/{lib,log}/go-agent-1
  	chown go:go /var/{lib,log}/go-agent-1
    ln -s /etc/init.d/go-agent-1 /etc/rc2.d/S99go-agent-1
	/etc/init.d/go-agent-1 start

	# Install 3rd agent
	ln -s /etc/init.d/go-agent /etc/init.d/go-agent-2
  	ln -s /usr/share/go-agent /usr/share/go-agent-2
  	cp /etc/default/go-agent /etc/default/go-agent-2
  	mkdir /var/{lib,log}/go-agent-2
  	chown go:go /var/{lib,log}/go-agent-2
    ln -s /etc/init.d/go-agent-2 /etc/rc2.d/S99go-agent-2
	/etc/init.d/go-agent-2 start
  SHELL
end
