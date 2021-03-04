#!/bin/bash

[[ -n $TMUX_CONFIG_LOADED ]] && return 1 || readonly TMUX_CONFIG_LOADED=1

LOG=1
LOGFILE="$HOME/.tmux/.log"

rm -rf "$LOGFILE" &>/dev/null

log() {
    [[ -n $LOG  ]] && echo "$@" >> $LOGFILE
}

sh="/bin/zsh"
tmux="/bin/tmux"

TMUX_CONFIG_DIR="$HOME/.tmux"
TMUX_PLUGIN_DIR="$TMUX_CONFIG_DIR/plugins"
TMUX_LAYOUT_DIR="$TMUX_CONFIG_DIR/layout"
TMUX_BIN_DIR="$TMUX_CONFIG_DIR/bin"

run="$TMUX_BIN_DIR/mrun"

declare -A TMUX_PLUGINS

TMUX_PLUGINS=(
    [extrakto]="tmux-extrakto"
    [logging]="tmux-logging"
    [thumbs]="tmux-thumbs"
    [yank]="tmux-yank"
    [copycat]="tmux-copycat"
    [easy-motion]="tmux-easy-motion"
    [fzf-url]="tmux-fzf-url"
)

# Loading plugins, kind of dangerous...
if [[ -d $TMUX_PLUGIN_DIR ]]; then
    for plug in $TMUX_PLUGIN_DIR/*/*.tmux; do
        if [[ -x "$plug" ]]; then
            source "$plug"
        fi
    done
fi

# Loading config, safe
if [[ -d $TMUX_CONFIG_DIR ]]; then
    for file in $TMUX_CONFIG_DIR/*; do
        if [[ -f $file && $(basename $file) =~ ^[[:digit:]]+-.* ]]; then
            source $file
        fi
    done
fi

return 0
