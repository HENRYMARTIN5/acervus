# Acervus
A spin of Arch Linux designed to pack as much useful software into a single ISO as possible while still staying relatively lightweight.

## Building
In order to build Acervus, you need an environment running Arch Linux or an Arch-based distro, such as Manjaro, Crystal, or a pre-existing installation of Acervus. If you're running on a fresh install of Arch, you'll need to install quite a few packages before you start. The magic command to do that automatically is:

```bash
sudo pacman -S git wget curl archiso pacman-contrib squashfs-tools
```

If you're running a non-Arch or Arch-based distro, you can run this process in a docker container. To do so, run the following:

```bash
sudo docker pull archlinux
sudo docker run -i -t archlinux bash
# (inside the container)
pacman -Sy sudo # Install sudo and update package database
sudo pacman -S git wget curl archiso pacman-contrib squashfs-tools # Install needed packages
```

From here, the steps are the same. Since Acervus uses Chaotic-AUR to download prebuilt AUR packages, you need to install its keyring on the system you're using to build it. Run the following:

```bash
pacman-key --init
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036 # If pacman outputs an error, run pacman-key --init again
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
```

And clone the repo:

```bash
git clone https://github.com/HENRYMARTIN5/acervus.git
cd acervus
chmod 777 * # Make sure file perms are correct
```

And of course, the command to do all of that automagically is:

```bash
pacman -Sy sudo git wget curl archiso pacman-contrib squashfs-tools && pacman-key --init && pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com && pacman-key --lsign-key FBA220DFC880C036 && pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf && git clone https://github.com/HENRYMARTIN5/acervus.git && cd acervus && chmod 777 *
```

Then run:

```bash
./buildiso.sh
```

The ISO will be built in a temporary folder (which you can delete once you're done), then copied to your current directory.

## What packages are installed?

See `packages.txt` for full details. As of Jan 31, 2023, there are 153 packages.

A couple of highlights:
- A full Budgie desktop environment
- A ton of web browsers including Firefox, Brave, and Tor
- A lot of fonts
- Lots of emulators including Cemu (Wii U), Dolphin (Wii and Gamecube) and RetroArch with a bunch of cores
- The Steam client and winetricks preinstalled, plus Lutris and MultiMc (Minecraft launcher)
- Some other apps: Spotify, Discord, Amarok, VLC
- Uses Nemo as a file explorer and contains various productivity apps, like Libreoffice, GIMP and Inkscape
- Contains way too many command-line utilities (neofetch, nvim, git, wget, zsh and zsh-completions, fish, various archive formats, htop, ncdu, tcpdump, expac)
- A bunch of tools that I stole from Kali (all jokes aside, this includes metasploit, nmap, netcat, wireshark, and some others)
