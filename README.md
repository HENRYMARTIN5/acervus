```

      O~                                                              O~~                                   
     O~ ~~                                                            O~~       O~                          
    O~  O~~       O~~~   O~~    O~ O~~~O~~     O~~O~~  O~~ O~~~~      O~~         O~~ O~~  O~~  O~~O~~   O~~
   O~~   O~~    O~~    O~   O~~  O~~    O~~   O~~ O~~  O~~O~~         O~~      O~~ O~~  O~~O~~  O~~  O~ O~~ 
  O~~~~~~ O~~  O~~    O~~~~~ O~~ O~~     O~~ O~~  O~~  O~~  O~~~      O~~      O~~ O~~  O~~O~~  O~~   O~    
 O~~       O~~  O~~   O~         O~~      O~O~~   O~~  O~~    O~~     O~~      O~~ O~~  O~~O~~  O~~ O~  O~~ 
O~~         O~~   O~~~  O~~~~   O~~~       O~~      O~~O~~O~~ O~~     O~~~~~~~~O~~O~~~  O~~  O~~O~~O~~   O~~
                                                                                                            
```

A spin of Arch Linux designed to include as much software out-of-the-box as possible.

## Installation

Boot from an Arch installation image, then run:

```bash
curl https://raw.githubusercontent.com/HENRYMARTIN5/acervus/main/rootfs/bin/acervus-install | python3 -
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

[![Stargazers repo roster for @HENRYMARTIN5/acervus](https://reporoster.com/stars/dark/HENRYMARTIN5/acervus)](https://github.com/HENRYMARTIN5/acervus/stargazers) [![Forkers repo roster for @HENRYMARTIN5/acervus](https://reporoster.com/forks/dark/HENRYMARTIN5/acervus)](https://github.com/HENRYMARTIN5/acervus/network/members)
