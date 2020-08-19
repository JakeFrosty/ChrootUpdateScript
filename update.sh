#!/bin/bash

# Check for root
if [[ $EUID -ne 0 ]]; then
	echo "Please run this as root"
	exit 1
fi
echo "[+] Starting Update Script..."
echo "[+] Chroot version $buildver"

# Get current version via github repository
# Take no chances and delete existing if any is found
if [ -f "/etc/update/version.txt" ]; then
	rm /etc/update/version.txt
fi
wget -P /etc/update/ https://raw.githubusercontent.com/JakeFrostyYT/ChrootUpdateScript/master/version.txt -O version.txt
newver=$(cat "/etc/update/version.txt")

# Compare current build version of chroot to newest version
# Clone if newest version found and execute the script
if [ "$buildver" -eq "$newver" ]; then
	echo "[+] Already on latest update"
	exit 1
else
	if [ "$newver" -gt "$buildver" ]; then
		echo "[+] New Version $newver available"
		echo "Proceed with update? y/n"
		read input
		if [ "$input" == "y" ]; then
			echo "[+] Updating..."
			rm -r /etc/update/ChrootUpdateScript/
			git clone https://github.com/JakeFrostyYT/ChrootUpdateScript.git "/etc/update/ChrootUpdateScript"
			rm /etc/update/ChrootUpdateScript/version.txt
			chmod 755 /etc/update/ChrootUpdateScript/script.sh
			/etc/update/ChrootUpdateScript/script.sh
			rm /root/version
			mv /etc/update/version.txt /root/version
		fi
	fi
fi
