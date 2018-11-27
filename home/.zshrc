export PATH=$PATH:$HOME/bin:$HOME/workspace/go/bin
export GO111MODULE=on

if [ -d "$HOME/.jenv" ]; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

if [ -d "/Applications/Postgres.app/Contents/Versions/9.4/bin" ]; then
    export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git composer docker docker-compose)

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
alias a="atom ."
alias c="code ."

cdp () {

  TEMP_PWD=`pwd`
  while ! [ -d .git ]; do
  cd ..
  done
  OLDPWD=$TEMP_PWD

}

export GOPATH=$HOME/workspace/go

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

