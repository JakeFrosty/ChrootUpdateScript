#!/bin/bash
# Placeholder for now
# Build 79 minor patch to chroot
checkforfile() {
if [ -f "$file" ]; then
	result=failed
else
	result=Success
fi
}
rm /usr/share/mitmf/plugins/filepwn.py
file=/usr/share/mitmf/plugins/filepwn.py
checkforfile
if [ "$result" == "failed" ]; then
	checkforfile
fi
apt install tightvncserver
file=/usr/bin/vncserver
checkforfile
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
