# -*- mode: ruby -*-
# vi: set ft=ruby :
#
Vagrant::Config.run do |config|
  config.vm.define :db2 do |db2|
    db2.vm.box = "precise32"
    db2.vm.box_url = "http://files.vagrantup.com/precise32.box"
    db2.vm.network :hostonly, "172.19.2.20"
    db2.vm.host_name = "db2.vagrant"

    db2.vm.share_folder "db-dump", "/db", "db"

    db2.vm.provision :puppet do |puppet| 
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "db.pp"
      puppet.module_path    = "modules"
      puppet.options        = "--verbose"
    end
  end


  config.vm.define :demo2 do |demo2|
    demo2.vm.box = "precise32"
    demo2.vm.box_url = "http://files.vagrantup.com/precise32.box"
    demo2.vm.network :hostonly, "172.19.2.10"
    demo2.vm.host_name = "demo2.vagrant"

    demo2.vm.share_folder "web-contents", "/web", "web"
    demo2.vm.forward_port 80,8899

    demo2.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "web.pp"
      puppet.module_path    = "modules"
      puppet.options        = "--verbose"
    end
  end
end
