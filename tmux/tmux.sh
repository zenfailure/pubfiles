#!/usr/bin/env bash

[[ -n $TMUX_CONFIG_LOADED ]] && return 1 || readonly TMUX_CONFIG_LOADED=1

DIR=$(cd "$( dirname $(realpath ${BASH_SOURCE[0]}) )" >/dev/null 2>&1 && pwd)

source "$DIR/00-variables"

if [[ -d $TMUX_CONFIG_DIR ]]; then
    for file in $TMUX_CONFIG_DIR/*; do
        if [[ -f $file && $(basename $file) =~ ^[[:digit:]]+-.* ]]; then
            source $file
        fi
    done
fi

return 0
