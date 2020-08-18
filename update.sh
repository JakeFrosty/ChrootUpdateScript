#!/bin/bash
if [[ $EUID -ne 0 ]]; then
	echo "Please run this as root"
	exit 1
fi
echo "[+] Starting Update Script..."
echo "[+] Chroot version $buildver"
wget -P /etc/update/ https://raw.githubusercontent.com/JakeFrostyYT/ChrootUpdateScript/master/version.txt -O version.txt
newver=$(cat "/etc/update/version.txt")
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
			git clone https://github.com/JakeFrostyYT/ChrootUpdateScript.git "/etc/update/ChrootUpdateScript"
			chmod 755 /etc/update/ChrootUpdateScript/script.sh
			/etc/update/ChrootUpdateScript/script.sh
		fi
	fi
fi
