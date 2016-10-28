#!/bin/bash

USER=$(git config --local --get user.name)
ADDR=$(git config --local --get user.email)
if [ -n "$USER" -a -n "$ADDR" ]; then
    echo "[fix-committer-info] Identity information already set, not updating"
	exit 0
fi

extract_hostname() {
    if [ "ssh" = "${1:0:3}" ]; then
        echo "${1:10}" | awk 'BEGIN { FS="/" } { print $1 }'
    elif [ "git" = "${1:0:3}" ]; then
        echo "${1:4}" | awk 'BEGIN { FS=":" } { print $1 }'
    elif [ "http" = "${1:0:4}" ]; then
        echo "${1:8}" | awk 'BEGIN { FS="/" } { print $1 }'
    else
        echo "[fix-committer-info] Unknown remote url type: ${1}" >&2
    fi
}

GIT_HOSTNAME=$(extract_hostname $(git config --get remote.origin.url))
if [ -a ~/.gitcfg/users/$GIT_HOSTNAME.sh ]; then
    echo "[fix-committer-info] Found user file for host ${GIT_HOSTNAME}, setting user account"
    . ~/.gitcfg/users/$GIT_HOSTNAME.sh
else
    echo "[fix-committer-info] No user file found for host ${GIT_HOSTNAME}, falling back to default"
	git config --local user.name "Frank Kleine"
	git config --local user.email "mikey@bovigo.org"
    git config --local user.signingkey "F6D84238EF89E1D0B7B2CE4C34A8AD190E5304FA"
fi
