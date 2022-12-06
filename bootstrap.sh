#!/bin/bash
set -eu

### Install homeshick ###
if [ ! -d $HOME/.homesick/repos/homeshick ]; then
  git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
fi
source $HOME/.homesick/repos/homeshick/homeshick.sh

### Deploy dotfiles ###
homeshick clone --batch https://github.com/tarjoilija/zgen.git
homeshick clone --batch https://github.com/mikey179/dotfiles.git

### Link it all to $HOME ###
homeshick link
