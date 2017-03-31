#!/bin/bash

apt-get -y update
apt-get -y  install libcups2 samba samba-common cups
systemctl stop smbd.service
mv /etc/samba/smb.conf /etc/samba/smb.conf.bak
mkdir - /home/shares/allusers
cat >/etc/samba/smb.conf << EOF
[global]
  workgroup = WORKGROUP
  server string = Samba Server %v
  netbios name = debian
  security = user
  map to guest = bad user
  dns proxy = no
[media]
  comment = Media
  path = /mnt/media
  valid users = @users
  force group = users
  create mask = 0660
  directory mask = 0771
  writable = yes
[allusers]
  comment = All Users
  path = /home/shares/allusers
  valid users = @users
  force group = users
  create mask = 0660
  directory mask = 0771
  writable = yes
[homes]
   comment = Home Directories
   browseable = no
   valid users = %S
   writable = yes
   create mask = 0700
   directory mask = 0700
EOF

systemctl start smbd.service
useradd media -m -G users
echo 'somepassword' | tee - | smbpasswd -s -a media
