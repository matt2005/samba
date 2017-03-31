Vagrant.configure(2) do |config|
  config.vm.box = "debian/contrib-jessie64"
  config.vm.provision "shell", path: "provision.sh"
  config.vm.network "forwarded_port", guest: 445, host: 445, protocol: "tcp"#, id="SMB_Over_TCP"
  config.vm.network "forwarded_port", guest: 139, host: 139, protocol: "tcp"#, id="NetBIOS_Session"
  config.vm.network "forwarded_port", guest: 138, host: 138, protocol: "udp"#, id="NetBIOS_Datagram"
  config.vm.network "forwarded_port", guest: 137, host: 137, protocol: "udp"#, id="NetBIOS_Name_Service"
  config.vm.synced_folder "/mnt/500usb/media", "/mnt/media"
#  config.vm.provider "virtualbox" do |v|
#    v.gui = false
#  end
end
