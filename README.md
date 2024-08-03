<h1 align="center">dotfiles</h1>
<p align="center">My macOS dotfiles /ᐠ - ⩊ -マ Ⳋ</p>

![Screenshot](screenshot.png)

<p align="center">feat: yabai, sketchybar, pywal</p>

## Requirements
- gcc-14

## Installing
Run `./install.sh`

## Generating colorschemes
You can use my custom function:
```bash
fwal path/to/your/image.png
```
This will:
- generate a colorscheme using [pywal16](https://github.com/eylles/pywal16)
- automatically reload everything except neovim and discord
- automatically apply the wallpaper

## Applying the wallpaper
If your wallpaper doesn't apply automatically,
enable System Preferences > Wallpaper > Show on all Spaces

<details>
<summary>Screenshot</summary>
<br>

![Applying the wallpaper](applying-the-wallpaper.png)

</details>

## TODOs
- [x] Add an install script
- [ ] Make some better keymaps for skhd
