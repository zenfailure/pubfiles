
#zplug 'inconshreveable/ngrok', as:command, use:'ngrok',
# browserpass
# zplug '~/rofication', as:command, from:local, ignore:'*', use:'rofication-daemon.py', hook-build: 'ln -s rofication-daemon.py rofication-daemon'
#
zplug 'ram-on/imgurbash2',   as:command, use:'imgurbash2'
zplug 'passff/passff-host',  as:command, ignore:'*', hook-build: "sh src/install_host_app.sh firefox"
zplug 'samhh/bukubrow-host', as:command, ignore:'*', hook-build: "make build-linux-x64 && cd release && unzip build-linux-x64.zip && ./bukubrow-linux-x64 --install-firefox"

zplug 'laktak/extrakto',               as:command, ignore:'*', dir:"~/.tmux/plugins/tmux-extrakto"
zplug 'wfxr/tmux-fzf-url',             as:command, ignore:'*', dir:"~/.tmux/plugins/tmux-fzf-url"
zplug 'IngoMeyer441/tmux-easy-motion', as:command, ignore:'*', dir:"~/.tmux/plugins/tmux-easy-motion", hook-build: "ln -s easy_motion.tmux easy-motion.tmux"
zplug 'fcsonline/tmux-thumbs',         as:command, ignore:'*', dir:"~/.tmux/plugins/tmux-thumbs", hook-build: "ln -s tmux-thumbs.tmux thumbs.tmux"
zplug 'tmux-plugins/tmux-logging',     as:command, ignore:'*', dir:"~/.tmux/plugins/tmux-logging"
zplug 'tmux-plugins/tmux-copycat',     as:command, ignore:'*', dir:"~/.tmux/plugins/tmux-copycat"
zplug 'tmux-plugins/tmux-yank',        as:command, ignore:'*', dir:"~/.tmux/plugins/tmux-yank"

zplug '~/.cfg/pubfiles/zsh', as:command, from:local, use:"dotsync"
zplug '~/.tmux/bin',         as:command, from:local, use:"*"
zplug '~/.scripts',          as:command, from:local, use:"*/*"
zplug '~/.bin',              as:command, from:local, use:"*"
zplug '~/.local/bin',        as:command, from:local, use:"*"
zplug "jimeh/tmuxifier",     as:command, use:"bin/*"
zplug 'gitwatch/gitwatch',   as:command, use:'gitwatch.sh', rename-to:'gitwatch'

zplug 'endaaman/lxd-completion-zsh'
zplug 'jplitza/zsh-virsh-autocomplete'
zplug "b4b4r07/easy-oneliner", if:"which fzf"
zplug "mafredri/zsh-async"
#zplug "zsh-users/zsh-syntax-highlighting"
zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "zsh-users/zsh-completions"
zplug hchbaw/zce.zsh, hook-load:'bindkey "^S" zce'
zplug wyntau/fzf-zsh
zplug 'zpm-zsh/colorize'

#zplug marlonrichert/zsh-autocomplete
zplug 'Aloxaf/fzf-tab', hook-load:'enable-fzf-tab'
zplug 'zdharma/fast-syntax-highlighting'


if ! zplug check; then
    zplug install
fi

zplug load
