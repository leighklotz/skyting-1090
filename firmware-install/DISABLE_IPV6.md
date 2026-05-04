# grep dhcp /etc/netplan/*
# mg /etc/netplan/*
# add these lines: 
      dhcp6: false
# leave this line alone
      dhcp4: true

# add this line to /boot/armbianEnv.txt
# mg /boot/armbianEnv.txt
verbosity=1
bootlogo=false
console=both
disp_mode=1920x1080p60
overlay_prefix=sun50i-h616
rootdev=UUID=0946312a-1463-46e9-917f-c0a08ef45880
rootfstype=ext4
-------------------------------->extraargs=ipv6.disable=1<--------------------------------
usbstoragequirks=0x2537:0x1066:u,0x2537:0x1068:u
