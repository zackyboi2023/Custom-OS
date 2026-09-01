# MyDistro

A personal Linux distribution built on Arch Linux, with a custom-branded live
ISO, a themed Hyprland desktop, and my own default configuration. Built and
tested entirely in a VM.

This repo is an [`archiso`](https://gitlab.archlinux.org/archlinux/archiso)
profile — a set of config files that `archiso` uses to build a bootable
`.iso`, the same way the official Arch installer ISO is built.

## Requirements

- An Arch Linux machine or VM (archiso itself only runs on Arch — see note below)
- `archiso` installed: `sudo pacman -S archiso`
- QEMU for testing: `sudo pacman -S qemu-full` (or use VirtualBox instead)

> **Don't run Arch day-to-day?** That's fine — you don't need to. Spin up a
> throwaway Arch VM just to *build* the ISO (`build.sh` runs there), then
> test the resulting ISO in any hypervisor you like, including on a non-Arch host.

## Build

```bash
sudo ./build.sh
```

This copies the official `releng` profile as a base, layers this repo's
`profile/` folder on top, and runs `mkarchiso`. Output lands in `out/mydistro.iso`.

## Test in a VM

```bash
./test-vm.sh
```

Boots the freshly built ISO in QEMU. Take a VM snapshot before doing a full
install so you can roll back instantly if something breaks.

## Make it yours

Everything you'd actually want to change lives in `profile/`:

| What | Where |
|---|---|
| Distro name / branding | `profile/airootfs/etc/os-release` |
| Login/terminal message | `profile/airootfs/etc/motd` |
| Installed packages | `profile/packages.x86_64` |
| ISO file/volume name | `profile/profiledef.sh` |
| Desktop config (Hyprland) | `profile/airootfs/etc/skel/.config/hypr/hyprland.conf` |
| Terminal theme | `profile/airootfs/etc/skel/.config/kitty/kitty.conf` |
| Wallpaper | `profile/airootfs/usr/share/backgrounds/` |

Start by renaming the distro, swap the wallpaper, and tweak
`hyprland.conf`'s colors and keybinds. Rebuild and re-test after every change
— small, frequent iterations are much less painful than big ones.

## Roadmap ideas (optional, once the basics work)

- [ ] Custom Plymouth boot splash (branded boot screen)
- [ ] Custom SDDM/greetd login theme
- [ ] A themed `waybar` status bar config
- [ ] Package your dotfiles as a proper `pacman` package so reinstalling is one command
- [ ] Custom wallpaper set / icon theme
- [ ] Calamares installer branding, so the ISO can install to disk, not just run live
