export PATH=$PATH:$HOME/bin:$HOME/workspace/go/bin
export GOPATH=$HOME/workspace/go
export GO111MODULE=on

ZSH_THEME="robbyrussell"

source $HOME/.homesick/repos/zgen/zgen.zsh
if ! zgen saved; then
  echo "Creating zgen save ..."

  zgen oh-my-zsh

  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/composer
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose

  zgen load StackExchange/blackbox
  zgen load zsh-users/zsh-syntax-highlighting

  zgen save
fi


source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

if [ -e "$HOME/.aliases" ]; then
  source ~/.aliases
fi

if [ -e "$HOME/.zshrc_work" ]; then
  source $HOME/.zshrc_work
fi

alias phpunit="vendor/bin/phpunit"
alias coverage="open docs/coverage/index.html"
alias c="code ."

cdp () {
  TEMP_PWD=`pwd`
  while ! [ -d .git ]; do
  cd ..
  done
  OLDPWD=$TEMP_PWD
}
