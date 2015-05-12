# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.define "master_01" do |master|
	master.vm.network "private_network", ip: "192.168.33.10"
	master.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
	end
	master.vm.provision "file", source: "common_ubuntu.sh", destination: "/tmp/user-shell/common_ubuntu.sh"
	master.vm.provision "file", source: "master_file.sh", destination: "/tmp/user-shell/master_file.sh"
	master.vm.provision "shell", path: "master_01_file.sh"
  end

 config.vm.define "master_02" do |master|
	master.vm.network "private_network", ip: "192.168.33.11"
	master.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
	end
	master.vm.provision "file", source: "common_ubuntu.sh", destination: "/tmp/user-shell/common_ubuntu.sh"
	master.vm.provision "file", source: "master_file.sh", destination: "/tmp/user-shell/master_file.sh"
	master.vm.provision "shell", path: "master_02_file.sh"
  end

  config.vm.define "master_03" do |master|
	master.vm.network "private_network", ip: "192.168.33.12"
	master.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
	end
	master.vm.provision "file", source: "common_ubuntu.sh", destination: "/tmp/user-shell/common_ubuntu.sh"
	master.vm.provision "file", source: "master_file.sh", destination: "/tmp/user-shell/master_file.sh"
	master.vm.provision "shell", path: "master_03_file.sh"
  end

  config.vm.define "slave_01" do |slave|
	slave.vm.network "private_network", ip: "192.168.33.13"
	slave.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
	end
	slave.vm.provision "file", source: "common_ubuntu.sh", destination: "/tmp/user-shell/common_ubuntu.sh"
	slave.vm.provision "file", source: "slave_file.sh", destination: "/tmp/user-shell/slave_file.sh"
	slave.vm.provision "shell", path: "slave_01_file.sh"
  end
  config.vm.define "slave_02" do |slave|
	slave.vm.network "private_network", ip: "192.168.33.14"
	slave.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
	end
	slave.vm.provision "file", source: "common_ubuntu.sh", destination: "/tmp/user-shell/common_ubuntu.sh"
	slave.vm.provision "file", source: "slave_file.sh", destination: "/tmp/user-shell/slave_file.sh"
	slave.vm.provision "shell", path: "slave_02_file.sh"
  end
end
