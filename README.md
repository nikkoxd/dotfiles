<img width="1680" alt="image" src="https://github.com/user-attachments/assets/62082f42-9574-444d-ab88-78cf0b742c0e" />

<h2 align="center">My macOS dotfiles /ᐠ - ⩊ -マ Ⳋ</h2>

<p align="center">feat: yabai, sketchybar, pywal, stow</p>

### Features
- Custom menu bar featuring sketchybar
- Window management featuring yabai & skhd
- Material You colorscheme generation with pywal integration
- Cool Spotify popup

<p align="center">
  <img width="509" alt="SCR-20241129-lykt" src="https://github.com/user-attachments/assets/c802f341-28f8-4269-96e3-3eedd087c0e1">
</p>

- Dark and light theme genration
<table>
  <tr>
    <td>Dark Mode</td>
    <td>Light Mode</td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/7ee20294-a989-4d1b-a736-6dba3e77920c"></td>
    <td><img src="https://github.com/user-attachments/assets/e11e2817-5336-4c4c-870d-4bf9ced0fa05"></td>
  </tr>
</table>



### Installing

```sh
bash -c "$(curl -s https://raw.githubusercontent.com/nikkoxd/dotfiles/refs/heads/main/install.sh)"
```

> [!IMPORTANT]
> Yabai requires System Integrity Protection to be partially disabled to be able to switch spaces  
> Information on how to disable SIP can be found on the [yabai wiki](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection)

> [!NOTE]
> C++ compiler might be needed for TreeSitter to work

### Generating colorschemes
```bash
matu [-l] -i path/to/your/image.png 
```
### Applying the wallpaper
If your wallpaper doesn't apply automatically,
enable `System Preferences > Wallpaper > Show on all Spaces`

### Previous setups
https://github.com/nikkoxd/dotfiles/tree/fca8cb8ba6bc0322e5158700f0ae56c613e1c623
