# -*- mode: ruby -*-
# vi: set ft=ruby :

PROVISIONING_PATH = "/var/local/provisioning"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial32"
  config.vm.hostname = "arbitrary-metrics-box"
  config.vm.synced_folder ".", "#{PROVISIONING_PATH}/"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 2003, host: 8081

  config.vm.provision "shell", inline: <<-SHELL
      echo "export ENVIRONMENT='dev'" >> /etc/profile.d/set_environment.sh
  SHELL

  config.vm.provision "ansible_local" do |ansible|
    ansible.provisioning_path = "#{PROVISIONING_PATH}/ansible/"
    ansible.inventory_path = "inventory"
    ansible.verbose = "vvv"
    ansible.playbook = "plays/arbitrary_metrics_box.yml"
    ansible.vault_password_file = "#{PROVISIONING_PATH}/vault-password"
    ansible.install_mode = "pip"
    ansible.version = "2.5.2"
  end

end
