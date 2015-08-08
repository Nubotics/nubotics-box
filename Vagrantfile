# -*- mode: ruby -*-
# vi: set ft=ruby :

# /etc/nginx/nginx.conf) --- sendfile off;

require 'yaml'
current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/config.yaml")
vagrant_config = configs['configs'][configs['configs']['use']]


VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "nio/box"


  # Port forwarding
  #config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3306, host: 3306 #MySql
  config.vm.network "forwarded_port", guest: 28017, host: 28017 #Mongodb

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "salt/roots/", "/srv/"
  config.vm.synced_folder "shell/", "/shell/"
  config.vm.synced_folder "application/", "/var/www/application/"
  config.vm.synced_folder "nginx/sites-available", "/etc/nginx/sites-available/", owner: "root", group: "root"
  #config.vm.synced_folder "nginx/log", "/var/log/nginx/", owner: "root", group: "root"

  # Virtual Box
  config.vm.provider "virtualbox" do |vb|
    #vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "4096"] # Lower if you feel the need.
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
  end

  # Provision fixes
  config.vm.provision :shell, run: 'always' do |s|
    s.path = 'shell/windows-path-limit-fix.sh'
    s.args = '/vagrant/node_modules'
  end

  config.vm.provision :shell, run: 'always' do |s|
    s.path = 'shell/ubuntu-keys.sh'
  end

  # Salt
  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.colorize = true
    salt.verbose = true
    salt.log_level = "debug"
    salt.run_highstate = true
  end

  # Digital Ocean
  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    provider.token = vagrant_config['token']
    provider.image = 'ubuntu-14-04-x64'
    provider.region = 'lon1'
    provider.size = '512mb'
  end

end
