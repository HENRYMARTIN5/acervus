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
```

From here, the steps are the same. Since Acervus uses Chaotic-AUR to download prebuilt AUR packages, you need to install its keyring on the system you're using to build it. Run the following:

```bash
# If you're running as a non-root user:
sudo su
# Then run the rest as normal:
pacman -S git wget curl archiso pacman-contrib squashfs-tools # Install needed packages
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

The ISO will be built in a temporary folder (which you can delete once you're done), then copied to `./acervus-conf/out`.

## Installation

Burn the ISO to a USB drive, reboot, and boot from it. Open up a terminal and run:

```bash
acervus-install
```

It will walk you through selecting a drive to install on, choosing a timezone and a hostname, and setting up a root password and a user account. Grub is, by default, installed with its normal text-based configuration. If you want to, you can install custom themes after the system is properly installed. Sadly, due to the limitations of the automatic installation tool at the moment, you can only format an entire drive, not dualboot.

## What packages are installed?

See `packages.txt` for full details. As of Feb 3, 2023, there are 176 packages.

A couple of highlights:
- A full Budgie desktop environment
- A ton of web browsers including Firefox, Brave, and Tor
- A lot of fonts
- Starship on bash, zsh, and fish with a single consistent configuration
- Useful aliases for bash and zsh (see below)
- AstroNvim pre-installed (additional plugins will be installed on first launch)
- Lots of emulators including Cemu (Wii U), Dolphin (Wii and Gamecube) and RetroArch with a bunch of cores
- The Steam client and winetricks preinstalled, plus Lutris, MultiMc (Minecraft launcher)
- Some other apps: Spotify, Discord, Amarok, VLC
- Uses Nemo as a file explorer and contains various productivity apps, like Libreoffice, GIMP and Inkscape
- Contains way too many command-line utilities (neofetch, nvim, git, wget, zsh and zsh-completions, fish, various archive formats, htop, ncdu, tcpdump, expac)
- A bunch of tools that I stole from Kali (all jokes aside, this includes metasploit, nmap, netcat, wireshark, and some others)

## Bash/Zsh Aliases

- `lt` - Shows a nice looking `ls` output with file sizes
- `showmnt` - Shows a list of mounted block devices
- `findh` - Finds a string in bash_history
- `ve` - Creates a python3 virtual environment
- `va` - Activates a python3 virtual environment
- `cpv` - Like `cp`, but with a progress bar
- `cl` - `cd` into a directory, then immediately run `ls`
- `mp` - Just `mkdir -p`
- `vim` - Points to `nvim`
