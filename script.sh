#!/bin/bash
# Placeholder for now
# Build 76 minor patch to chroot
rm /usr/share/mitmf/plugins/filepwn.py
if [ "$result" == "Success" ]; then
	echo "[+] Update script Finished successfully!"
	# DO NOT MODIFY
	#wget -P /usr/bin/ https://raw.githubusercontent.com/JakeFrostyYT/ChrootUpdateScript/master/chrootupdate
	#chmod 755 /usr/bin/chrootupdate
else
	echo "[-] Update script failed somehow?"
fi
