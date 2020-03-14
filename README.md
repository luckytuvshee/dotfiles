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
* playerctl (for controlling audio)
* ttf-font-awesome
* awesome-terminal-fonts (make fontawesome font bigger)
* pinta
* maim
* xdotool (to get current focused window)
* i3lock-color

## Useful notes
* Get window class name of application using xprop package
* Disable PC speaker (BEEP) - Blacklisting the pcspkr module will prevent udev from loading it at boot:
> echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
