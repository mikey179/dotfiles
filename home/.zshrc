export PATH=/usr/local/bin:$PATH:$HOME/bin:/opt/homebrew/bin:$HOME/workspace/go/bin
export GOPATH=$HOME/workspace/go
export GO111MODULE=on
export CDPATH=$HOME/workspace

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

alias coverage="open docs/coverage/index.html"
alias c="code ."
# copy working directory to clipboard
alias cwd='pwd | tr -d "\r\n" | pbcopy'

cdp () {
  TEMP_PWD=`pwd`
  while ! [ -d .git ]; do
    cd ..
  done
  OLDPWD=$TEMP_PWD
}


composer() {
  docker run --rm --interactive --tty \
    --volume ${PWD}:/app \
    --volume ${COMPOSER_HOME:-$HOME/.composer}:/tmp \
    --user $(id -u):$(id -g) \
    arm64v8/composer:2 $@
}

php_container() {
  PHP_VERSION="$1"
  shift
  docker run -it --rm \
    -v "$PWD":/usr/src/myapp \
    -w /usr/src/myapp arm64v8/php:$PHP_VERSION-cli $@
}

alias php-7.4="php_container 7.4 bash"
alias phpunit-7.4="php_container 7.4 vendor/bin/phpunit"
alias php-8.0="php_container 8.0 bash"
alias phpunit-8.0="php_container 8.0 vendor/bin/phpunit"
alias php-8.1="php_container 8.1 bash"
alias phpunit-8.1="php_container 8.1 vendor/bin/phpunit"
alias php-8.2="php_container 8.2 bash"
alias phpunit-8.2="php_container 8.2 vendor/bin/phpunit"
alias php-8.3="php_container 8.3 bash"
alias phpunit-8.3="php_container 8.3 vendor/bin/phpunit"