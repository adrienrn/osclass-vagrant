# -*- mode: ruby -*-
# vi: set ft=ruby :

# box      = 'precise32'
# url      = 'http://files.vagrantup.com/precise32.box'
# hostname = 'local'
# domain   = 'osclass.dev'
# ip       = '192.168.50.10'
ram        = '512'

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.
  config.vm.hostname = "ubuntu"

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "puphpet/ubuntu1404-x64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "private_network", ip: "10.37.129.101"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Turn on SSH forwarding (so that 'vagrant ssh' has access to your local SSH keys, and you can use your local SSH keys to access GitHub, etc.)
  config.ssh.forward_agent = true

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
    # Customize the amount of memory on the VM:
    vb.memory = ram
  end

  config.vm.provider "parallels" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = ram
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
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

  # Check if ~/.gitconfig exists locally
  # If so, copy basic Git Config settings to Vagrant VM
  if File.exists?(File.join(Dir.home, ".gitconfig"))
      git_name = `git config user.name`   # find locally set git name
      git_email = `git config user.email` # find locally set git email
      # set git name for 'vagrant' user on VM
      config.vm.provision :shell, :inline => "echo 'Saving local git username to VM...' && sudo -i -u vagrant git config --global user.name '#{git_name.chomp}'"
      # set git email for 'vagrant' user on VM
      config.vm.provision :shell, :inline => "echo 'Saving local git email to VM...' && sudo -i -u vagrant git config --global user.email '#{git_email.chomp}'"
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = 'puppet/modules'
  end

end
