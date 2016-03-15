# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/wily/current/wily-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.box = "base"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "forwarded_port", guest: 6863, host: 22

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.168.168"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #
  # config.vm.synced_folder "./shared", "/var/shared", type: "rsync",
	# rsync__exclude: ".git/"
  config.vm.synced_folder "./shared", "/var/shared", type: "nfs"
  config.vm.synced_folder "~/sites", "/var/www", type: "nfs"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
	config.vm.provider "virtualbox" do |vb|
		### Boot with headless mode
		vb.gui = false

		### turn on host resolver, or guest network calls take forever...
		vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		
		### increase memory for the guest VM
		vb.memory = 2048
		
		### use two cores
		vb.cpus = "2"
	end
			
	### make sure we have an updated repo list in apt-get...
	config.vm.provision "shell", inline: "apt-get -y clean"
	config.vm.provision "shell", inline: "apt-get -y update"

	### install curl docker
	config.vm.provision "shell", inline: "apt-get -y install curl"

	### install gpg
	config.vm.provision "shell", inline: "curl -sSL https://get.docker.com/gpg | sudo apt-key add -"

	### install docker lastest stable version
	config.vm.provision "shell", inline: "curl -sSL https://get.docker.com/ | sh"

	### install docker-compose
	config.vm.provision "shell", inline: "curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"

	### set the exec bit on docker-compose
	config.vm.provision "shell", inline: "chmod +x /usr/local/bin/docker-compose"

	### install mysql client, php (cli), and some other handy utils
	config.vm.provision "shell", inline: "apt-get -y install tmux mysql-client composer npm php5-cli php5-mcrypt php5-curl exuberant-ctags"

	### add vagrant user to docker user group
	config.vm.provision "shell", inline: "usermod -aG docker vagrant"
	
end
