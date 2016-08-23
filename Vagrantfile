# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  if Vagrant.has_plugin?('vagrant-proxyconf')
    config.proxy.http     = 'http://proxy.lb.abbott.corp:80/'
    # config.proxy.https    = "http://192.168.0.2:3128/"
    # config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
  end

  config.vm.box = 'centos-64-x64-vbox4210'
  config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box'

  # use rsync on Windows
  synced_folder_type = if `uname` =~ /Darwin/
                         'nfs'
                       else
                         'rsync'
                       end
  config.vm.synced_folder '~/.ssh', '/tmp/ssh'
  config.vm.synced_folder '.', '/vagrant', type: synced_folder_type

  config.vm.provider 'virtualbox' do |v|
    v.memory = 4096
    v.cpus = 4
    v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  config.vm.provision :shell, path: 'puppet/bootstrap.sh'

  config.vm.define 'devdb', primary: true do |dev|
    dev.vm.network :forwarded_port, guest: 1521, host: 1521
    dev.vm.network :forwarded_port, guest: 3000, host: 3000
    dev.vm.network :private_network, ip: '192.168.50.5'

    puppet_for dev, 'evodb'
  end

  def puppet_for(box, role)
    box.vm.provision :puppet do |puppet|
      puppet.facter = {
        'role' => role,
        'username' => 'vagrant'
      }

      puppet.manifests_path = 'puppet/manifests'
      puppet.manifest_file  = 'init.pp'
      puppet.module_path    = ['puppet/modules']
      puppet.options        = '--templatedir /vagrant/puppet/templates --fileserverconfig=/vagrant/puppet/fileserver.conf --verbose'

    end
  end
end
