<h1 align="center">dotfiles</h1>
<p align="center">My macOS dotfiles /ᐠ - ⩊ -マ Ⳋ</p>

![Screenshot](screenshot.png)

<p align="center">feat: yabai, sketchybar, pywal</p>

## Requirements
- gcc-14

## Installing
Run `./install.sh`

## Generating colorschemes
Run the pywal alias:
```bash
fwal -i path/to/your/image.png
```
This will:
- generate a colorscheme using [pywal16](https://github.com/eylles/pywal16)
- automatically reload everything except neovim, discord and spicetify
- automatically apply the wallpaper

This alias is bound to `w` key in Yazi, or `W` for a light colorscheme

<details>
<summary>Applying the Neovim theme</summary>
<br>
  
Reload the theme by running `:Lazy reload pywal16`

</details>

<details>
<summary>Applying the Discord theme (Example for Vencord)</summary>
<br>
  
Symlink the theme file to your theme folder:
```bash
ln -s $HOME/.cache/wal/colors-discord.css $HOME/Library/Application\ Support/Vencord/themes
```
In Vencord, reload the theme by pressing `cmd+r` or by going into `User Settings > Themes`, then turn the theme on and off

</details>

## Applying the wallpaper
If your wallpaper doesn't apply automatically,
enable `System Preferences > Wallpaper > Show on all Spaces`

<details>
<summary>Screenshot</summary>
<br>

![Applying the wallpaper](applying-the-wallpaper.png)

</details>

## TODOs
- [x] Add an install script
- [ ] Make some better keymaps for skhd
