# -*- mode: ruby -*-
# vi: set ft=ruby :

SERVERS = 3
CLIENTS = 1

SERVERS_IP = "192.68.50.1"
CLIENTS_IP = "192.68.60.1"

$script = <<SCRIPT
# Update apt and get dependencies
sudo apt-get update
sudo apt-get install -y unzip curl wget vim
SCRIPT

Vagrant.configure(2) do | config |

  # Basic configuration
  config.vm.box = "ubuntu/xenial64"

  # Provisioners
  config.vm.provision "shell", inline: $script,               privileged: false
  config.vm.provision "shell", path: "bin/install-nomad.sh",  privileged: false
  config.vm.provision "shell", path: "bin/install-consul.sh", privileged: false
  config.vm.provision "docker"

  # Servers
  1.upto(SERVERS) do | i |
    vmName = "nomad-server#{i}"
    vmIP = "#{SERVER_IP}#{i}"

    config.vm.define vmName do | server |
      #server.vm.box = "ubuntu/trusty64"
      server.vm.hostname = vmName
      server.vm.network "private_network", ip: vmIP
    end
  end


   # Clients
  1.upto(CLIENTS) do | i |
    vmName = "nomad-client#{i}"
    vmIP = "#{CLIENTS_IP}#{i}"

    config.vm.define vmName do | server |
      #server.vm.box = "ubuntu/trusty64"
      server.vm.hostname = vmName
      server.vm.network "private_network", ip: vmIP
    end
  end

  # Increase memory for Virtualbox
  config.vm.provider "virtualbox" do | vb |
    vb.memory = "1024"
  end

  # Increase memory for Parallels Desktop
  config.vm.provider "parallels" do | p, o |
    p.memory = "1024"
  end

  # Increase memory for VMware
  ["vmware_fusion", "vmware_workstation"].each do | p |
    config.vm.provider p do | v |
      v.vmx["memsize"] = "1024"
    end
  end
end
