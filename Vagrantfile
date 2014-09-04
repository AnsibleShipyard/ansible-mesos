# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true
  config.vm.synced_folder Dir.getwd, "/home/vagrant/roles/ansible-mesos", nfs: true

  # ubuntu
  config.vm.define 'ubuntu', primary: true do |c|
    c.vm.network "private_network", ip: "192.168.100.2"
    c.vm.box = "trusty-server-cloudimg-amd64-vagrant-disk1"
  	c.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  	c.vm.provision "shell" do |s|
		  s.inline = "apt-get update -y; apt-get install ansible -y;"
		  s.privileged = true
    end
  end

  # centos:
  config.vm.define 'centos' do |c|
  	c.vm.network "private_network", ip: "192.168.100.3"
    c.vm.box = "centos65-x86_64-20140116"
  	c.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
  	c.vm.provision "shell" do |s|
      s.inline = "/bin/true"
		  s.privileged = true
	  end
  end

end
