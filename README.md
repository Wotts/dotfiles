# Setup Terminal, Development Tools and Themeing

## Dependencies:
### Navigation and interaction
- [`i3-gaps`](https://github.com/Airblader/i3) - i3wm with gaps
- [`i3blocks`](https://github.com/vivien/i3blocks) - system blocks in i3bar
- [`compton`](http://manpages.ubuntu.com/manpages/focal/man1/compton.1.html) - for window transitions
- [`dunst`](https://manpages.ubuntu.com/manpages/focal/man1/dunst.1.html) - notification daemon
- [`rofi`](https://github.com/davatorium/rofi) - application launcher
- [`xprop`](http://manpages.ubuntu.com/manpages/focal/man1/xprop.1.html) - application property displayer
- [`xrandr`](https://xorg-team.pages.debian.net/xorg/howto/use-xrandr.html) - draw windows

### Functional
- [`eza`](https://github.com/eza-community/eza) - replacement for `ls`
- [`bat`](https://github.com/sharkdp/bat) - better `cat`
- [`homebrew`](https://brew.sh/) - package manager
- [`playerctl`](https://github.com/altdesktop/playerctl) - mediaplayer control
- [`scrot`](https://github.com/dreamer/scrot) - screenshot tool
- [`htop`](https://htop.dev/) - a cool resource monitor
- [`gotop`](https://github.com/cjbassi/gotop) - a cooler resource monitor
- [`btop`](https://github.com/aristocratos/btop) - the coolest recource monitor
- [`bottom`](https://github.com/ClementTsang/bottom) - also a pretty cool resource monitor


### Style
- [`betterlockscreen`](https://github.com/betterlockscreen/betterlockscreen) - a pretty lockscreen
- [`feh`](http://manpages.ubuntu.com/manpages/focal/man1/feh.1.html) - image viewer
- [`gnome-tweak-tool`](https://linuxhint.com/gnome_tweak_installation_ubuntu/) - tweak gnome looks and functionality
- [`lxappearance`](http://manpages.ubuntu.com/manpages/focal/man1/lxappearance.1.html) - theme switcher
- [`change-gdm-background`](https://github.com/thiggy01/change-gdm-background) - change loginscreen background
- [`papirus icon pack`](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) - a pretty icon pack
- [`spicetify`](https://github.com/khanhas/spicetify-cli) - change Spotify looks

### VIM
- [`vim-pathogen`](https://github.com/tpope/vim-pathogen) - Vim package autoloader
- [`vim-airline`](https://github.com/vim-airline) - Statusbar and themes
- [`powerline-fonts`](https://github.com/powerline/fonts.git) - Font for Airline
- [`vim-fugitive`](https://github.com/tpope/vim-fugitive) - Git plugin
- [`auto-pairs`](https://github.com/jiangmiao/auto-pairs) - Insert or delete brackets, parens, quotes in pair
- [`nodejs`](nodejs.org), required by [`junegunn/vim-plug`](https://github.com/junegunn/vim-plug)
- [`code-minimap`](https://github.com/wfxr/code-minimap), required by [`wfxr/minimap.vim`](https://github.com/wfxr/minimap.vim)

### Fonts (see fonts directory)
- FontAwesome
- Consolas font
- Braille font

## Misc
- [`neofetch`](https://github.com/dylanaraps/neofetch) - show OS and system details
- [`cmatrix`](https://github.com/abishekvashok/cmatrix) - the Matrix in your terminal
- [`pipes.sh`](https://github.com/pipeseroni/pipes.sh) - pipes screensaver from W95

## For Mac:
 - [`iTerm2`](https://iterm2.com/) - A better terminal for MacOS
 - [`OhMyZsh`](https://ohmyz.sh/) - Zshell manager
 - [`Powerlevel10K`](https://github.com/romkatv/powerlevel10k) - Theme for Zshell

## VsCode extensions:
- [`Vue Language Features (Volar)`]('https://github.com/johnsoncodehk/volar')
- [`Tailwind CSS IntelliSense`]('https://github.com/tailwindlabs/tailwindcss-intellisense')
- [`Srcery`]('ihttps://github.com/srcery-colors/srcery-vscode')
- [`Prettier`]('https://github.com/prettier/prettier-vscode')
- [`ESLint`]('https://github.com/Microsoft/vscode-eslint')
- [`GitLens`]('https://github.com/gitkraken/vscode-gitlens')
- [`PHP Intelephense`]('https://github.com/bmewburn/vscode-intelephense')

### Repositories for reference:
- [`srcery-vim`](https://github.com/srcery-colors/srcery-vim)
- [`srcery-vscode`](https://github.com/srcery-colors/srcery-vscode)
- [`srdz-af/vimrc`](https://github.com/srdz-af/vimrc)
- [`guns/xterm-color-table`](https://github.com/guns/xterm-color-table.vim)

### Notes:
- remap Caps_Lock to Escape on Ubuntu:
```sh
sudo vim /usr/share/X11/xkb/symbols/pc
```

- reload terminal configuration:
```sh
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profiles.dconf
```
