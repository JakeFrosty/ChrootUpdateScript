#!/bin/bash
# Placeholder for now
# Build 76 minor patch to chroot
rm /usr/share/mitmf/plugins/filepwn.py
if [ -f "/usr/share/mitmf/plugins/filepwn.py" ]; then
	result=failed
else
	result=Success
fi
result=Success
if [ "$result" == "Success" ]; then
	mv /etc/update/version.txt /root/version
	echo "[+] Update script Finished successfully!"
	# DO NOT MODIFY
	#wget -P /usr/bin/ https://raw.githubusercontent.com/JakeFrostyYT/ChrootUpdateScript/master/chrootupdate
	#chmod 755 /usr/bin/chrootupdate
else
	echo "[-] Update script failed somehow?"
fi
