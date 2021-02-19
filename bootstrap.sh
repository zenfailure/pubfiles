#!/bin/bash

PUBDIR="$HOME/.cfg/pubfiles"
GITURL="https://github.com/zenfailure/pubfiles"

[[ -d $PUBDIR ]] && exit 1

if [[ -d $PUBDIR ]]; then
    echo "Directory $PUBDIR already exists."
    exit 1
fi

mkdir -p $PUBDIR

git clone $GITURL $PUBDIR

if ! which ansible-playbook &>/dev/null; then
    echo "Missing ansible-playbook."
    exit 1
fi

ansible-playbook $PUBDIR/all.yaml
exit 0
