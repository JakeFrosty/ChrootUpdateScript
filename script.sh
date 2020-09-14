#!/bin/bash
# Placeholder for now
# Build 82 major patch to chroot
# Install missing KeX Packages, add samba and cifs-utils
if [ -f "/usr/share/mitmf/plugins/filepwn.py" ]; then
	rm /usr/share/mitmf/plugins/filepwn.py
	result=Success
else
	result=Success
fi
packages="tightvncserver samba cifs-utils"
apt install $packages
if [ -f "/usr/bin/vncserver" ]; then
	
if [ "$result" == "Success" ]; then
	sudo rm /root/.bashrc
	wget -P /root/ https://raw.githubusercontent.com/JakeFrostyYT/ChrootUpdateScript/master/.bashrc
	chmod 0644 /root/.bashrc
	mv /etc/update/version.txt /root/version
	echo "[+] Update script Finished successfully!"
	# DO NOT MODIFY
	#wget -P /usr/bin/ https://raw.githubusercontent.com/JakeFrostyYT/ChrootUpdateScript/master/chrootupdate
	#chmod 755 /usr/bin/chrootupdate
else
	echo "[-] Update script failed somehow?"
fi
