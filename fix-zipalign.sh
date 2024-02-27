# !/bin/bash
# fix zipalign made by K1M4K-ID
#
# clear
clear
sleep 1
echo -e "[+] checking essential tools"
sleep 1
if command -v "figlet" &> /dev/null;
then
	echo ""
	sleep 1
	clear
else
	echo "[!]"
	apt-get install figlet -y &> /dev/null
fi

figlet zipalign
echo
echo """
==================================
[-] fix zipalign by K1M4K-ID
==================================

"""
architecture=$(uname -m)

if [ $architecture = "aarch64" ];
then
	echo "[+] install zipalign"
	echo
	sleep 1
	apt-get install android-libandroidfw -y &> /dev/null
	wget http://ftp.de.debian.org/debian/pool/main/a/android-platform-build/zipalign_8.1.0+r23-2_arm64.deb &> /dev/null
	dpkg -i zipalign_8.1.0+r23-2_arm64.deb &> /dev/null

elif [ $architecture = "amd64" ];
then
	echo "[+] install zipalign"
        sleep 1
	apt-get install android-libandroidfw -y &> /dev/null
	wget http://ftp.de.debian.org/debian/pool/main/a/android-platform-build/zipalign_8.1.0+r23-2_amd64.deb &> /dev/null
	dpkg -i zipalign_8.1.0+r23-2_amd64.deb &> /dev/null

elif [ $architecture = "x86_64" ];
then
        echo "[+] install zipalign"
        sleep 1
        apt-get install android-libandroidfw -y &> /dev/null
        wget http://ftp.de.debian.org/debian/pool/main/a/android-platform-build/zipalign_8.1.0+r23-2_amd64.deb &> /dev/null
        dpkg -i zipalign_8.1.0+r23-2_amd64.deb &> /dev/null

fi

desktop="zipalign_8.1.0+r23-2_amd64.deb"
mobile="zipalign_8.1.0+r23-2_arm64.deb"

# Memeriksa apakah file ada
if [ -f "$mobile" ]; then
	rm -f "$mobile"
elif [ -f "$desktop" ]; then
	rm -f "$desktop"
else
	echo "File tidak ditemukan"
fi
        echo "[-] typing: zipalign"
        sleep 1
	echo
