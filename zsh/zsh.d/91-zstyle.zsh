zstyle ':completion:*' menu yes select=2
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
