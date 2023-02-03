#!/bin/bash

# Copy the default config to the repo directory
echo "Copying baseline config..."
cp -r /usr/share/archiso/configs/baseline/ acervus-conf
cd acervus-conf || exit
echo "Done."

echo "Copying rootfs template..."
cp -r ../rootfs/ ./airootfs/
echo "Done."

echo "Modifying config..."
# Modify pacman.conf
cp ../pacman.conf ./pacman.conf

# Mogrep -o '^[^#]*' ../packages.txt > ./packages.x86_64dify package list
 # Weird syntax removes comments

# Modify profiledef.sh
cp ../profiledef.sh ./profiledef.sh
echo "Done."
echo "Enabling various systemd units..."
##### Enable systemd units #####
# dhcpcd
echo "dhcpcd"
mkdir -p ./airootfs/etc/systemd/system/multi-user.target.wants
ln -s ./airootfs/etc/systemd/system/multi-user.target.wants/dhcpcd.service /usr/lib/systemd/system/dhcpcd.service
# NetworkManager
echo "NetworkManager"
mkdir -p ./airootfs/etc/systemd/system/network-online.target.wants
ln -s ./airootfs/etc/systemd/system/multi-user.target.wants/NetworkManager.service ./airootfs/usr/lib/systemd/system/NetworkManager.service
ln -s ./airootfs/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service ./airootfs/usr/lib/systemd/system/NetworkManager-dispatcher.service
ln -s ./airootfs/etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service ./airootfs/usr/lib/systemd/system/NetworkManager-wait-online.service
# gdm
echo "gdm"
ln -s ./airootfs/etc/systemd/system/display-manager.service ./airootfs/usr/lib/systemd/system/gdm.service
# acpid
echo "acpid"
ln -s ./airootfs/etc/systemd/system/multi-user.target.wants/acpid.service ./airootfs/usr/lib/systemd/system/acpid.service
# avahi-daemon
echo "avahi-daemon"
mkdir -p ./airootfs/etc/systemd/system/sockets.target.wants
ln -s ./airootfs/etc/systemd/system/dbus-org.freedesktop.Avahi.service ./airootfs/usr/lib/systemd/system/avahi-daemon.service
ln -s ./airootfs/etc/systemd/system/multi-user.target.wants/avahi-daemon.service ./airootfs/usr/lib/systemd/system/avahi-daemon.service
ln -s ./airootfs/etc/systemd/system/sockets.target.wants/avahi-daemon.socket ./airootfs/usr/lib/systemd/system/avahi-daemon.socket
# cups.service
echo "cups.service"
mkdir -p ./airootfs/etc/systemd/system/printer.target.wants
ln -s ./airootfs/etc/systemd/system/printer.target.wants/cups.service ./airootfs/usr/lib/systemd/system/cups.service
ln -s ./airootfs/etc/systemd/system/multi-user.target.wants/cups.service ./airootfs/usr/lib/systemd/system/cups.service
ln -s ./airootfs/etc/systemd/system/sockets.target.wants/cups.socket ./airootfs/usr/lib/systemd/system/cups.socket
ln -s ./airootfs/etc/systemd/system/multi-user.target.wants/cups.path ./airootfs/usr/lib/systemd/system/cups.path
# bluetooth
echo "bluetooth"
ln -s ./airootfs/etc/systemd/system/dbus-org.bluez.service ./airootfs/usr/lib/systemd/system/bluetooth.service
ln -s ./airootfs/etc/systemd/system/bluetooth.target.wants/bluetooth.service ./airootfs/usr/lib/systemd/system/bluetooth.service
#################################
echo "Done."

echo "Running mkarchiso on generated config..."
# Make the actual iso
mkarchiso -v -w ./acervus-iso-tmp "$(pwd)"
cd ..
echo "Done building Acervus. The ISO should be located in your current directory."