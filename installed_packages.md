# Manually Installed Packages — cleanup review

_Generated: 2026-06-13 09:38 · Host: CachyOS (Arch/pacman)_

## Summary

- **336** packages explicitly installed (`pacman -Qe`)
- **164** of them are *true leaves* — explicit AND required by nothing (`pacman -Qet`). These are the safe cleanup candidates, listed below.
- **13** are foreign/AUR packages (`pacman -Qem`).
- Combined installed size of the 164 leaves: **11.8G**

> **How to read this:** Only *leaf* packages are shown — removing them cannot break dependencies. Packages flagged 🔒 belong to `base`/`base-devel`/`cachyos` meta-groups — keep them. 📦 = AUR/foreign. Sort your eye to the big sizes / old install dates first.

**Remove a package + its now-orphaned deps:** `sudo pacman -Rns <pkg>`
**Bulk-review orphans afterwards:** `pacman -Qdtq` then `sudo pacman -Rns $(pacman -Qdtq)`

## Leaf packages — by size (largest first)

| Package | Size | Installed | Flags | Description |
|---|--:|---|:--:|---|
| `texlive-fontsextra` | 1.8G | 2026-04-14 |  | TeX Live - Additional fonts |
| `proton-cachyos` | 1.5G | 2026-06-12 |  | A compatibility tool for Steam Play based on Wine and additional components, experimental branch with extra CachyOS flavour |
| `ollama-cuda` | 1.0G | 2026-06-13 |  | Create, run and share large language models (LLMs) with CUDA |
| `zoom` | 937.9M | 2026-05-19 | 📦 | Video Conferencing and Web Conferencing Service |
| `vscodium` | 843.3M | 2026-05-30 |  | Free/Libre Open Source Software Binaries of VSCode (git build from latest release). |
| `cudnn` | 826.0M | 2026-06-11 |  | NVIDIA CUDA Deep Neural Network library |
| `libreoffice-fresh` | 442.7M | 2026-06-11 |  | LibreOffice branch which contains new features and program enhancements |
| `chromium` | 415.7M | 2026-06-11 |  | A web browser built for speed, simplicity, and security |
| `google-chrome` | 402.1M | 2026-06-13 | 📦 | The popular web browser by Google (Stable Channel) |
| `cursor-bin` | 399.8M | 2026-06-11 |  | AI-first coding environment |
| `amneziavpn-bin` | 327.6M | 2026-06-12 | 📦 | Amnezia VPN Client |
| `firefox` | 284.6M | 2026-06-11 |  | Fast, Private & Safe Web Browser |
| `happ-desktop-bin` | 273.1M | 2026-06-02 | 📦 | Happ — user-friendly GUI client for xray-core with TUN/VPN and anti-censorship |
| `rust` | 267.4M | 2026-06-05 |  | Systems programming language focused on safety, speed and concurrency |
| `freedownloadmanager` | 163.5M | 2026-06-05 |  | FDM is a powerful modern download accelerator and organizer. |
| `linux-cachyos-headers` | 156.7M | 2026-06-05 |  | Headers and scripts for building modules for the Linux EEVDF + LTO + AutoFDO + Propeller Cachy Sauce Kernel by CachyOS with other patches and improvements. kernel |
| `cachyos-wallpapers` | 154.4M | 2026-02-28 |  | Wallpapers for CachyOS |
| `linux-cachyos-lts-headers` | 150.2M | 2026-05-30 |  | Headers and scripts for building modules for the Linux EEVDF + Cachy Sauce Kernel by CachyOS with other patches and improvements - Long Term Service kernel |
| `telegram-desktop` | 138.9M | 2026-06-12 |  | Official Telegram Desktop client |
| `docker` | 113.1M | 2026-06-02 |  | Pack, ship and run any application as a lightweight container |
| `texlive-latexextra` | 113.0M | 2026-04-14 |  | TeX Live - LaTeX additional packages |
| `rclone` | 104.1M | 2026-06-11 |  | rsync for cloud storage |
| `hiddify` | 100.9M | 2026-06-01 | 📦 | Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH, etc. |
| `searxng-git` | 82.0M | 2026-03-05 | 📦 | A privacy-respecting, hackable metasearch engine |
| `texlive-music` | 70.0M | 2026-04-14 |  | TeX Live - Music packages |
| `texlive-context` | 66.6M | 2026-04-14 |  | TeX Live - ConTeXt and packages |
| `texlive-publishers` | 61.4M | 2026-04-14 |  | TeX Live - Publisher styles, theses, etc. |
| `uv` | 58.7M | 2026-06-12 |  | An extremely fast Python package installer and resolver written in Rust |
| `texlive-pstricks` | 46.6M | 2026-04-14 |  | TeX Live - PSTricks |
| `anki` | 46.1M | 2026-06-01 |  | A smart spaced repetition flashcard program |
| `texlive-bibtexextra` | 45.0M | 2026-04-14 |  | TeX Live - BibTeX additional styles |
| `nvidia-container-toolkit` | 43.3M | 2026-06-01 |  | NVIDIA container toolkit |
| `sof-firmware` | 42.8M | 2026-02-28 |  | Sound Open Firmware |
| `hplip` | 39.8M | 2026-05-23 |  | Drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet |
| `gutenprint` | 34.3M | 2026-02-28 |  | Top quality printer drivers for POSIX systems |
| `intel-ucode` | 30.7M | 2026-05-13 |  | Microcode update files for Intel CPUs |
| `docker-compose` | 28.3M | 2026-05-23 |  | Fast, isolated development environments using Docker |
| `nmap` | 26.5M | 2026-05-26 |  | Utility for network discovery and security auditing |
| `orca` | 26.0M | 2026-05-30 |  | Screen reader for individuals who are blind or visually impaired |
| `texlive-luatex` | 24.8M | 2026-04-14 |  | TeX Live - LuaTeX packages |
| `obs-studio` | 24.6M | 2026-06-02 |  | Free, open source software for live streaming and recording |
| `obsidian` | 23.2M | 2026-04-29 |  | A powerful knowledge base that works on top of a local folder of plain text Markdown files |
| `texlive-mathscience` | 20.3M | 2026-04-14 |  | TeX Live - Mathematics, natural sciences, computer science packages |
| `texlive-games` | 16.9M | 2026-04-14 |  | TeX Live - Games typesetting |
| `alsa-firmware` | 14.1M | 2026-02-28 |  | Firmware binaries for loader programs in alsa-tools and hotplug firmware loader |
| `lutris` | 11.9M | 2026-02-28 |  | Open Gaming Platform |
| `xed` | 11.3M | 2026-04-08 |  | A small and lightweight text editor |
| `mangohud` | 10.7M | 2026-06-01 |  | A Vulkan overlay layer for monitoring FPS, temperatures, CPU/GPU load and more. |
| `cachyos-hello` | 10.4M | 2026-04-25 | 🔒 | Welcome screen for CachyOS |
| `copyq` | 9.4M | 2026-06-05 |  | Clipboard manager with searchable and editable history |
| `linux-cachyos-lts-nvidia-open` | 9.1M | 2026-05-30 |  | nvidia open modules of 610.43.02 driver for the linux-cachyos-lts kernel |
| `linux-cachyos-nvidia-open` | 9.0M | 2026-06-05 |  | nvidia open modules of 610.43.02 driver for the linux-cachyos kernel |
| `texlive-formatsextra` | 8.5M | 2026-04-14 |  | TeX Live - Additional formats |
| `octopi` | 8.4M | 2026-04-25 |  | A powerful Pacman frontend using Qt libs |
| `system-config-printer` | 8.2M | 2026-02-28 |  | A CUPS printer configuration tool and status applet |
| `alacritty` | 8.0M | 2026-04-14 |  | A cross-platform, GPU-accelerated terminal emulator |
| `texlive-fontutils` | 7.5M | 2026-04-14 |  | TeX Live - Graphics and font utilities |
| `ttf-jetbrains-mono` | 7.4M | 2026-03-01 |  | Typeface for developers, by JetBrains |
| `blueman` | 6.9M | 2026-02-28 |  | GTK+ Bluetooth Manager |
| `lib32-mangohud` | 6.7M | 2026-06-01 |  | 32-bit libraries for MangoHud and MangoApp |
| `xfce4-settings` | 6.5M | 2026-03-05 |  | Xfce's Configuration System |
| `glances` | 5.8M | 2026-04-20 |  | CLI curses-based monitoring tool |
| `man-pages` | 5.6M | 2026-04-25 |  | Linux man pages |
| `meld` | 5.1M | 2026-02-28 |  | Compare files, directories and working copies |
| `xfdesktop` | 4.7M | 2026-03-29 |  | Xfce's desktop manager |
| `xfce4-weather-plugin` | 4.6M | 2026-02-28 |  | A weather plugin for the Xfce4 panel |
| `bluez-utils` | 4.1M | 2026-05-13 |  | Development and debugging utilities for the bluetooth protocol stack |
| `hwinfo` | 4.0M | 2026-02-28 |  | Hardware detection tool from openSUSE |
| `texlive-humanities` | 3.5M | 2026-04-14 |  | TeX Live - Humanities packages |
| `xfce4-power-manager` | 3.5M | 2026-02-28 |  | Power Manager for Xfce |
| `xfwm4-themes` | 3.4M | 2026-02-28 | 📦 | A set of additional themes for the Xfce window manager |
| `composer` | 3.4M | 2026-06-05 |  | Dependency Manager for PHP |
| `sg3_utils` | 3.3M | 2026-02-28 |  | Generic SCSI utilities |
| `texlive-xetex` | 3.3M | 2026-04-14 |  | TeX Live - XeTeX and packages |
| `flameshot` | 3.3M | 2026-06-12 |  | Powerful yet simple to use screenshot software |
| `gsfonts` | 3.1M | 2026-02-28 |  | (URW)++ base 35 font set |
| `duf` | 3.0M | 2026-02-28 |  | Disk Usage/Free Utility |
| `texlive-metapost` | 3.0M | 2026-04-14 |  | TeX Live - MetaPost and Metafont packages |
| `ttf-symbola-free` | 2.9M | 2026-03-01 | 📦 | font with grayscale emoji, older free version |
| `ttf-opensans` | 2.9M | 2026-02-28 |  | Sans-serif typeface commissioned by Google |
| `mcfly` | 2.7M | 2026-03-10 |  | Fly through your shell history |
| `alsa-utils` | 2.6M | 2026-06-05 |  | Advanced Linux Sound Architecture - Utilities |
| `mousepad` | 2.2M | 2026-03-05 |  | Simple text editor for Xfce |
| `xfce4-terminal` | 2.1M | 2026-03-10 |  | A modern terminal emulator primarily for the Xfce desktop environment |
| `ly` | 1.9M | 2026-05-18 |  | TUI display manager |
| `cachyos-packageinstaller` | 1.9M | 2026-03-13 | 🔒 | Simple Software Application Package Installer for CachyOS which helps setting up & installing applications |
| `btop` | 1.7M | 2026-05-02 |  | A monitor of system resources, bpytop ported to C++ |
| `parole` | 1.7M | 2026-02-28 |  | Modern media player based on the GStreamer framework |
| `xfce4-session` | 1.6M | 2026-03-05 |  | Xfce's session manager |
| `networkmanager-openvpn` | 1.5M | 2026-02-28 |  | NetworkManager VPN plugin for OpenVPN (with GUI) |
| `nfs-utils` | 1.4M | 2026-04-08 |  | Support programs for Network File Systems |
| `qterminal` | 1.4M | 2026-04-25 |  | A lightweight Qt-based terminal emulator |
| `lightdm-gtk-greeter-settings` | 1.4M | 2026-02-28 |  | Settings editor for the LightDM GTK+ Greeter |
| `galculator` | 1.3M | 2026-02-28 |  | GTK+ based scientific calculator |
| `inetutils` | 1.2M | 2026-05-07 |  | A collection of common network programs |
| `ristretto` | 1.1M | 2026-03-10 |  | A fast and lightweight picture viewer for Xfce |
| `xfce4-xkb-plugin` | 1.1M | 2026-02-28 |  | Plugin to switch keyboard layouts for the Xfce4 panel |
| `ethtool` | 1.0M | 2026-04-29 |  | Utility for controlling network drivers and hardware |
| `cachyos-kernel-manager` | 1006.1K | 2026-05-30 | 🔒 | Simple kernel manager |
| `jfsutils` | 1000.7K | 2026-02-28 |  | JFS filesystem utilities |
| `ttf-all-the-icons` | 945.9K | 2026-03-01 | 📦 | Icon font for all-the-icons.el (A utility package to collect various Icon Fonts and propertize them within Emacs.) |
| `redshift` | 919.0K | 2026-03-01 |  | Adjusts the color temperature of your screen according to your surroundings. |
| `xfce4-whiskermenu-plugin` | 831.0K | 2026-04-13 |  | Menu for Xfce4 |
| `xfce4-screenshooter` | 799.3K | 2026-02-28 |  | An application to take screenshots |
| `cachyos-plymouth-bootanimation` | 777.9K | 2026-03-31 | 🔒 | CachyOS Bootanimation (new) |
| `xfce4-appfinder` | 766.0K | 2026-02-28 |  | Application launcher and finder |
| `otf-font-awesome` | 707.6K | 2026-03-01 |  | Iconic font designed for Bootstrap - otf format |
| `bluez-obex` | 671.6K | 2026-05-13 |  | Object Exchange daemon for sharing content |
| `cachyos-i3wm-settings` | 667.9K | 2026-02-28 |  | CachyOS i3wm settings |
| `stow` | 645.2K | 2026-02-28 |  | Manage installation of multiple softwares in the same directory tree |
| `cpupower` | 631.1K | 2026-05-30 |  | Linux kernel tool to examine and tune power saving related features of your processor |
| `pgvector` | 626.4K | 2026-04-04 | 📦 | A vector similarity search extension for PostgreSQL |
| `network-manager-applet` | 622.6K | 2026-04-10 |  | Applet for managing network connections |
| `cachyos-grub-theme` | 546.1K | 2026-02-28 |  | Grub2 Theme for CachyOS |
| `btrfs-assistant` | 532.2K | 2026-03-29 |  | An application for managing BTRFS subvolumes and Snapper snapshots |
| `ufw` | 528.1K | 2026-02-28 |  | Uncomplicated and easy to use CLI tool for managing a netfilter firewall |
| `xfce4-pulseaudio-plugin` | 485.5K | 2026-02-28 |  | Pulseaudio plugin for the Xfce4 panel |
| `xfce4-taskmanager` | 483.7K | 2026-02-28 |  | Easy to use task manager |
| `xfce4-battery-plugin` | 480.8K | 2026-02-28 |  | A battery monitor plugin for the Xfce panel |
| `mousetweaks` | 423.2K | 2026-02-28 |  | Mouse accessibility enhancements |
| `xfce4-mount-plugin` | 422.4K | 2026-02-28 |  | Mount/umount utility for the Xfce4 panel |
| `awesome-terminal-fonts` | 377.3K | 2026-02-28 |  | fonts/icons for powerlines |
| `neofetch` | 375.4K | 2026-03-01 |  | A CLI system information tool written in BASH that supports displaying images. |
| `pv` | 347.4K | 2026-03-23 |  | A terminal-based tool for monitoring the progress of data through a pipeline |
| `dmraid` | 330.0K | 2026-02-28 |  | Device mapper RAID interface |
| `fsarchiver` | 299.4K | 2026-02-28 |  | Safe and flexible file-system backup and deployment tool |
| `cachyos-micro-settings` | 291.3K | 2026-02-28 | 🔒 | CachyOS micro settings |
| `efitools` | 255.1K | 2026-03-18 |  | Tools for manipulating UEFI secure boot platforms |
| `woff2-font-awesome` | 249.3K | 2026-03-01 |  | Iconic font designed for Bootstrap - woff2 format |
| `foomatic-db-nonfree` | 211.9K | 2026-03-18 |  | Foomatic - database extension consisting of manufacturer-supplied PPD files released under non-free licenses |
| `xfce4-netload-plugin` | 206.9K | 2026-02-28 |  | A netload plugin for the Xfce panel |
| `nano-syntax-highlighting` | 203.6K | 2026-02-28 |  | Nano editor syntax highlighting enhancements |
| `xdg-user-dirs-gtk` | 197.9K | 2026-02-28 |  | Creates user dirs and asks to relocalize them |
| `cups-pdf` | 197.5K | 2026-05-10 |  | PDF printer for cups |
| `hdparm` | 194.4K | 2026-02-28 |  | A shell utility for manipulating Linux IDE drive/driver parameters |
| `cantarell-fonts` | 193.3K | 2026-02-28 |  | Humanist sans serif font |
| `switcheroo-control` | 176.2K | 2026-02-28 |  | D-Bus service to check the availability of dual-GPU |
| `reflector` | 158.2K | 2026-02-28 |  | A Python 3 module and script to retrieve and filter the latest Pacman mirror list. |
| `stalonetray` | 152.5K | 2026-06-05 |  | STAnd-aLONE sysTRAY. It has minimal build and run-time dependencies: the Xlib only. |
| `xfce4-wavelan-plugin` | 149.5K | 2026-02-28 |  | Plugin to monitor wifi connectivity for the Xfce4 panel |
| `splix` | 143.4K | 2026-02-28 | 📦 | CUPS drivers for SPL (Samsung Printer Language) printers |
| `xl2tpd` | 137.7K | 2026-02-28 |  | an open source implementation of the L2TP maintained by Xelerance Corporation |
| `xfce4-datetime-plugin` | 131.0K | 2026-02-28 | 📦 | A date and time display plugin for the Xfce panel |
| `libva-nvidia-driver` | 127.6K | 2026-05-16 |  | VA-API implementation that uses NVDEC as a backend |
| `lsscsi` | 101.1K | 2026-02-28 |  | A tool that lists devices connected via SCSI and its transports |
| `netctl` | 96.4K | 2026-02-28 |  | Profile based systemd network management |
| `i3blocks` | 48.9K | 2026-02-28 |  | Define blocks for your i3bar status line |
| `cachyos-settings` | 39.4K | 2026-05-16 | 🔒 | CachyOS - Settings |
| `xdo` | 24.7K | 2026-03-01 |  | Utility for performing actions on windows in X |
| `cachyos-fish-config` | 16.9K | 2026-02-28 |  | Fish configuration of CachyOS |
| `bluez-hid2hci` | 16.2K | 2026-05-13 |  | Put HID proxying bluetooth HCI's into HCI mode |
| `hwdetect` | 15.4K | 2026-02-28 |  | Hardware detection script with loading modules and mkinitcpio.conf |
| `rebuild-detector` | 6.3K | 2026-02-28 |  | Detects which packages need to be rebuilt |
| `cachyos-rate-mirrors` | 5.8K | 2026-06-05 | 🔒 | CachyOS - Rate mirrors service |
| `cachyos-hooks` | 5.3K | 2026-02-28 | 🔒 | CachyOS libalpm hooks |
| `cachyos-v3-mirrorlist` | 3.7K | 2026-04-13 | 🔒 | CachyOS repository mirrorlist |
| `cachyos-v4-mirrorlist` | 3.7K | 2026-04-13 | 🔒 | CachyOS repository mirrorlist |
| `cachyos-mirrorlist` | 3.6K | 2026-04-13 | 🔒 | CachyOS repository mirrorlist |
| `cachyos-keyring` | 2.4K | 2026-02-28 | 🔒 | CachyOS keyring |
| `grub-btrfs-support` | 842B | 2026-02-28 |  | Support package for enabling grub-btrfs support |
| `nvidia-prime` | 758B | 2026-05-13 |  | NVIDIA Prime Render Offload configuration and utilities |
| `grub-hook` | 253B | 2026-02-28 |  | Pacman hook to update GRUB after a kernel update |
| `base` | 0B | 2026-02-28 |  | Minimal package set to define a basic Arch Linux installation |
| `vlc-plugins-all` | 0B | 2026-06-03 |  | Free and open source cross-platform multimedia player and framework - all plugins |

## Leaf packages — by install date (oldest first)

_Old installs you may have forgotten about._

| Package | Installed | Size | Flags |
|---|---|--:|:--:|
| `base` | 2026-02-28 | 0B |  |
| `cachyos-hooks` | 2026-02-28 | 5.3K | 🔒 |
| `cachyos-keyring` | 2026-02-28 | 2.4K | 🔒 |
| `jfsutils` | 2026-02-28 | 1000.7K |  |
| `netctl` | 2026-02-28 | 96.4K |  |
| `cachyos-grub-theme` | 2026-02-28 | 546.1K |  |
| `grub-btrfs-support` | 2026-02-28 | 842B |  |
| `grub-hook` | 2026-02-28 | 253B |  |
| `switcheroo-control` | 2026-02-28 | 176.2K |  |
| `cachyos-micro-settings` | 2026-02-28 | 291.3K | 🔒 |
| `cachyos-wallpapers` | 2026-02-28 | 154.4M |  |
| `networkmanager-openvpn` | 2026-02-28 | 1.5M |  |
| `rebuild-detector` | 2026-02-28 | 6.3K |  |
| `reflector` | 2026-02-28 | 158.2K |  |
| `ufw` | 2026-02-28 | 528.1K |  |
| `xl2tpd` | 2026-02-28 | 137.7K |  |
| `awesome-terminal-fonts` | 2026-02-28 | 377.3K |  |
| `cantarell-fonts` | 2026-02-28 | 193.3K |  |
| `ttf-opensans` | 2026-02-28 | 2.9M |  |
| `alsa-firmware` | 2026-02-28 | 14.1M |  |
| `blueman` | 2026-02-28 | 6.9M |  |
| `dmraid` | 2026-02-28 | 330.0K |  |
| `duf` | 2026-02-28 | 3.0M |  |
| `fsarchiver` | 2026-02-28 | 299.4K |  |
| `galculator` | 2026-02-28 | 1.3M |  |
| `hdparm` | 2026-02-28 | 194.4K |  |
| `hwdetect` | 2026-02-28 | 15.4K |  |
| `hwinfo` | 2026-02-28 | 4.0M |  |
| `lightdm-gtk-greeter-settings` | 2026-02-28 | 1.4M |  |
| `lsscsi` | 2026-02-28 | 101.1K |  |
| `meld` | 2026-02-28 | 5.1M |  |
| `nano-syntax-highlighting` | 2026-02-28 | 203.6K |  |
| `parole` | 2026-02-28 | 1.7M |  |
| `sg3_utils` | 2026-02-28 | 3.3M |  |
| `sof-firmware` | 2026-02-28 | 42.8M |  |
| `xdg-user-dirs-gtk` | 2026-02-28 | 197.9K |  |
| `xfce4-appfinder` | 2026-02-28 | 766.0K |  |
| `xfce4-battery-plugin` | 2026-02-28 | 480.8K |  |
| `xfce4-datetime-plugin` | 2026-02-28 | 131.0K | 📦 |
| `xfce4-mount-plugin` | 2026-02-28 | 422.4K |  |
| `xfce4-netload-plugin` | 2026-02-28 | 206.9K |  |
| `xfce4-power-manager` | 2026-02-28 | 3.5M |  |
| `xfce4-pulseaudio-plugin` | 2026-02-28 | 485.5K |  |
| `xfce4-screenshooter` | 2026-02-28 | 799.3K |  |
| `xfce4-taskmanager` | 2026-02-28 | 483.7K |  |
| `xfce4-wavelan-plugin` | 2026-02-28 | 149.5K |  |
| `xfce4-weather-plugin` | 2026-02-28 | 4.6M |  |
| `xfce4-xkb-plugin` | 2026-02-28 | 1.1M |  |
| `xfwm4-themes` | 2026-02-28 | 3.4M | 📦 |
| `cachyos-i3wm-settings` | 2026-02-28 | 667.9K |  |
| `i3blocks` | 2026-02-28 | 48.9K |  |
| `gsfonts` | 2026-02-28 | 3.1M |  |
| `gutenprint` | 2026-02-28 | 34.3M |  |
| `mousetweaks` | 2026-02-28 | 423.2K |  |
| `splix` | 2026-02-28 | 143.4K | 📦 |
| `system-config-printer` | 2026-02-28 | 8.2M |  |
| `cachyos-fish-config` | 2026-02-28 | 16.9K |  |
| `lutris` | 2026-02-28 | 11.9M |  |
| `stow` | 2026-02-28 | 645.2K |  |
| `redshift` | 2026-03-01 | 919.0K |  |
| `woff2-font-awesome` | 2026-03-01 | 249.3K |  |
| `otf-font-awesome` | 2026-03-01 | 707.6K |  |
| `ttf-jetbrains-mono` | 2026-03-01 | 7.4M |  |
| `ttf-all-the-icons` | 2026-03-01 | 945.9K | 📦 |
| `xdo` | 2026-03-01 | 24.7K |  |
| `ttf-symbola-free` | 2026-03-01 | 2.9M | 📦 |
| `neofetch` | 2026-03-01 | 375.4K |  |
| `mousepad` | 2026-03-05 | 2.2M |  |
| `xfce4-session` | 2026-03-05 | 1.6M |  |
| `xfce4-settings` | 2026-03-05 | 6.5M |  |
| `searxng-git` | 2026-03-05 | 82.0M | 📦 |
| `mcfly` | 2026-03-10 | 2.7M |  |
| `ristretto` | 2026-03-10 | 1.1M |  |
| `xfce4-terminal` | 2026-03-10 | 2.1M |  |
| `cachyos-packageinstaller` | 2026-03-13 | 1.9M | 🔒 |
| `efitools` | 2026-03-18 | 255.1K |  |
| `foomatic-db-nonfree` | 2026-03-18 | 211.9K |  |
| `pv` | 2026-03-23 | 347.4K |  |
| `btrfs-assistant` | 2026-03-29 | 532.2K |  |
| `xfdesktop` | 2026-03-29 | 4.7M |  |
| `cachyos-plymouth-bootanimation` | 2026-03-31 | 777.9K | 🔒 |
| `pgvector` | 2026-04-04 | 626.4K | 📦 |
| `nfs-utils` | 2026-04-08 | 1.4M |  |
| `xed` | 2026-04-08 | 11.3M |  |
| `network-manager-applet` | 2026-04-10 | 622.6K |  |
| `cachyos-mirrorlist` | 2026-04-13 | 3.6K | 🔒 |
| `cachyos-v3-mirrorlist` | 2026-04-13 | 3.7K | 🔒 |
| `cachyos-v4-mirrorlist` | 2026-04-13 | 3.7K | 🔒 |
| `xfce4-whiskermenu-plugin` | 2026-04-13 | 831.0K |  |
| `texlive-bibtexextra` | 2026-04-14 | 45.0M |  |
| `texlive-context` | 2026-04-14 | 66.6M |  |
| `texlive-fontsextra` | 2026-04-14 | 1.8G |  |
| `texlive-fontutils` | 2026-04-14 | 7.5M |  |
| `texlive-formatsextra` | 2026-04-14 | 8.5M |  |
| `texlive-games` | 2026-04-14 | 16.9M |  |
| `texlive-humanities` | 2026-04-14 | 3.5M |  |
| `texlive-latexextra` | 2026-04-14 | 113.0M |  |
| `texlive-luatex` | 2026-04-14 | 24.8M |  |
| `texlive-mathscience` | 2026-04-14 | 20.3M |  |
| `texlive-metapost` | 2026-04-14 | 3.0M |  |
| `texlive-music` | 2026-04-14 | 70.0M |  |
| `texlive-pstricks` | 2026-04-14 | 46.6M |  |
| `texlive-publishers` | 2026-04-14 | 61.4M |  |
| `texlive-xetex` | 2026-04-14 | 3.3M |  |
| `alacritty` | 2026-04-14 | 8.0M |  |
| `glances` | 2026-04-20 | 5.8M |  |
| `cachyos-hello` | 2026-04-25 | 10.4M | 🔒 |
| `man-pages` | 2026-04-25 | 5.6M |  |
| `octopi` | 2026-04-25 | 8.4M |  |
| `qterminal` | 2026-04-25 | 1.4M |  |
| `ethtool` | 2026-04-29 | 1.0M |  |
| `obsidian` | 2026-04-29 | 23.2M |  |
| `btop` | 2026-05-02 | 1.7M |  |
| `inetutils` | 2026-05-07 | 1.2M |  |
| `cups-pdf` | 2026-05-10 | 197.5K |  |
| `bluez-hid2hci` | 2026-05-13 | 16.2K |  |
| `bluez-obex` | 2026-05-13 | 671.6K |  |
| `bluez-utils` | 2026-05-13 | 4.1M |  |
| `intel-ucode` | 2026-05-13 | 30.7M |  |
| `nvidia-prime` | 2026-05-13 | 758B |  |
| `cachyos-settings` | 2026-05-16 | 39.4K | 🔒 |
| `libva-nvidia-driver` | 2026-05-16 | 127.6K |  |
| `ly` | 2026-05-18 | 1.9M |  |
| `zoom` | 2026-05-19 | 937.9M | 📦 |
| `docker-compose` | 2026-05-23 | 28.3M |  |
| `hplip` | 2026-05-23 | 39.8M |  |
| `nmap` | 2026-05-26 | 26.5M |  |
| `cachyos-kernel-manager` | 2026-05-30 | 1006.1K | 🔒 |
| `cpupower` | 2026-05-30 | 631.1K |  |
| `linux-cachyos-lts-headers` | 2026-05-30 | 150.2M |  |
| `linux-cachyos-lts-nvidia-open` | 2026-05-30 | 9.1M |  |
| `orca` | 2026-05-30 | 26.0M |  |
| `vscodium` | 2026-05-30 | 843.3M |  |
| `anki` | 2026-06-01 | 46.1M |  |
| `lib32-mangohud` | 2026-06-01 | 6.7M |  |
| `mangohud` | 2026-06-01 | 10.7M |  |
| `nvidia-container-toolkit` | 2026-06-01 | 43.3M |  |
| `hiddify` | 2026-06-01 | 100.9M | 📦 |
| `docker` | 2026-06-02 | 113.1M |  |
| `obs-studio` | 2026-06-02 | 24.6M |  |
| `happ-desktop-bin` | 2026-06-02 | 273.1M | 📦 |
| `vlc-plugins-all` | 2026-06-03 | 0B |  |
| `alsa-utils` | 2026-06-05 | 2.6M |  |
| `cachyos-rate-mirrors` | 2026-06-05 | 5.8K | 🔒 |
| `composer` | 2026-06-05 | 3.4M |  |
| `copyq` | 2026-06-05 | 9.4M |  |
| `freedownloadmanager` | 2026-06-05 | 163.5M |  |
| `linux-cachyos-headers` | 2026-06-05 | 156.7M |  |
| `linux-cachyos-nvidia-open` | 2026-06-05 | 9.0M |  |
| `rust` | 2026-06-05 | 267.4M |  |
| `stalonetray` | 2026-06-05 | 152.5K |  |
| `chromium` | 2026-06-11 | 415.7M |  |
| `cudnn` | 2026-06-11 | 826.0M |  |
| `firefox` | 2026-06-11 | 284.6M |  |
| `libreoffice-fresh` | 2026-06-11 | 442.7M |  |
| `rclone` | 2026-06-11 | 104.1M |  |
| `cursor-bin` | 2026-06-11 | 399.8M |  |
| `flameshot` | 2026-06-12 | 3.3M |  |
| `proton-cachyos` | 2026-06-12 | 1.5G |  |
| `telegram-desktop` | 2026-06-12 | 138.9M |  |
| `uv` | 2026-06-12 | 58.7M |  |
| `amneziavpn-bin` | 2026-06-12 | 327.6M | 📦 |
| `ollama-cuda` | 2026-06-13 | 1.0G |  |
| `google-chrome` | 2026-06-13 | 402.1M | 📦 |

## Foreign / AUR packages

_Not in official repos — verify each is still maintained / still wanted._

- `amneziavpn-bin` · leaf
- `google-chrome` · leaf
- `happ-desktop-bin` · leaf
- `hiddify` · leaf
- `pgvector` · leaf
- `searxng-git` · leaf
- `splix` · leaf
- `ttf-all-the-icons` · leaf
- `ttf-paratype` · (required by something)
- `ttf-symbola-free` · leaf
- `xfce4-datetime-plugin` · leaf
- `xfwm4-themes` · leaf
- `zoom` · leaf
