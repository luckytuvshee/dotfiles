# Arch Linux + i3-gaps + Polybar dotfiles
## Packages
* i3gaps, i3lock
   * i3lock-color - improved i3lock
   * imagemagick - for manipulating an image
* polybar
* urxvt (rxvt-unicode)
  * urxvt-resize-font-git (aur)
  * urxvt-perls
* ranger
  to copy config from /usr/share/doc/ranger/config run this command on terminal
  > $ ranger --copy-config=all 
  
  to use ranger-devicons on older version, copy .py to plugin directory
  - ln -sf ~/.config/ranger/plugins/ranger_devicons/__init__.py ~/.config/ranger/plugins/__init__.py
  - ln -sf ~/.config/ranger/plugins/ranger_devicons/devicons.py ~/.config/ranger/plugins/devicons.py
  
* ranger - image preview with urxvt install this package [(document)](https://github.com/ranger/ranger/wiki/Image-Previews#with-urxvt)
  * rxvt-unicode-pixbuf (aur)
* tumbler (thumbnail)
* ttf-iosevka (imho, best powerline enabled font)
* xclip (for youtube-dl and urxvt)
* maim (requires xclip for saving into clipboard)
* dunst (Notification daemon)
* cava (aur)
* compton (or picom)
* rofi
* zsh (oh-my-zsh, autosuggestions)
* vim
* feh
* thunar
* cmus
* xf86-video-intel (to use xorg-xbacklight)
* alsa-utils (to use amixer to control volume because it'll not go further above 100% volume)
* playerctl (for controlling audio)
* ttf-font-awesome
* awesome-terminal-fonts (make fontawesome font bigger)
* pinta
* maim
* xdotool (to get current focused window)
* i3lock-color
* ntfs-3g (to mount ntfs partition with os-prober)
* rsync (a fast, versatile, remote (and local) file-copying tool)
  rsync -ah --progress source destination
  The -a will keep permissions,etc, and -h will be human readable

## Useful notes
* Get window class name of application using xprop package
* Disable PC speaker (BEEP) - Blacklisting the pcspkr module will prevent udev from loading it at boot:
> echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

---

* arch with xfce, to fix locale when using display manager (such as SDDM and LightDM), add below lines to `/etc/profile`

```
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8                                                         
export LANGUAGE=en_U
```
* zsh seems slow when my repo has untracked files, but it's fine after one push. 
