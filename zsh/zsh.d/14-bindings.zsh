zle -N edit-command-line
bindkey -N root emacs
bindkey -A root main
bindkey -M root "^@" set-mark-command
bindkey -M root "^A" beginning-of-line
bindkey -M root "^E" end-of-line
bindkey -M root "^H" backward-char
bindkey -M root "^L" forward-char
bindkey -M root "^G" send-break
bindkey -M root "^W" backward-word
bindkey -M root "^F" forward-word
bindkey -M root "^J" down-line
bindkey -M root "^K" up-line
bindkey -M root "^N" down-history
bindkey -M root "^P" up-history
bindkey -M root "^M" accept-line
bindkey -M root "^I" expand-or-complete
bindkey -M root "^R" history-incremental-pattern-search-backward
bindkey -M root "^S" history-incremental-pattern-search-forward
bindkey -M root "^X^I" edit-command-line
bindkey -M root "^O" select-in-shell-word
bindkey -M root "^D^F" kill-word
bindkey -M root "^D^H" backward-delete-char
#bindkey -M root "^D^L" forward-delete-char
bindkey -M root "^D^W" backward-kill-word
bindkey -M root "^D^D" delete-char-or-list
bindkey -M root "^X^L" clear-screen
bindkey -M root "^Q" push-line
#bindkey -M root "^T" transpose-chars
bindkey -M root "^U" kill-whole-line
bindkey -M root "^V" quoted-insert
#bindkey -M root "^X^B" vi-match-bracket
#bindkey -M root "^X^F" vi-find-next-char
#bindkey -M root "^X^J" vi-join
bindkey -M root "^X^K" kill-buffer
#bindkey -M root "^X^N" infer-next-history
#bindkey -M root "^X^R" _read_comp
bindkey -M root "^X^U" undo
#bindkey -M root "^X^V" vi-cmd-mode
bindkey -M root "^X^X" exchange-point-and-mark
#bindkey -M root "^X*" expand-word
bindkey -M root "^X=" what-cursor-position
#bindkey -M root "^X?" _complete_debug
#bindkey -M root "^XC" _correct_filename
bindkey -M root "^XG" list-expand
#bindkey -M root "^Xa" _expand_alias
#bindkey -M root "^Xc" _correct_word
#bindkey -M root "^Xd" _list_expansions
#bindkey -M root "^Xe" _expand_word
#bindkey -M root "^Xh" _complete_help
#bindkey -M root "^Xm" _most_recent_file
#bindkey -M root "^Xn" _next_tags
#bindkey -M root "^Xt" _complete_tag
#bindkey -M root "^X~" _bash_list-choices
bindkey -M root "^Y" yank
bindkey -M root "^[^D" list-choices
#bindkey -M root "^[^G" send-break
bindkey -M root "^[^I" self-insert-unmeta
bindkey -M root "^[^J" self-insert-unmeta
bindkey -M root "^[^M" self-insert-unmeta
bindkey -M root "^[^_" copy-prev-word
#bindkey -M root "^[!" expand-history
#bindkey -M root "^[\"" quote-region
bindkey -M root "^['" quote-line
#bindkey -M root "^[," _history-complete-newer
#bindkey -M root "^[-" neg-argument
bindkey -M root "^[." insert-last-word
#bindkey -M root "^[/" _history-complete-older
#bindkey -M root "^[0" digit-argument
#bindkey -M root "^[1" digit-argument
#bindkey -M root "^[2" digit-argument
#bindkey -M root "^[3" digit-argument
#bindkey -M root "^[4" digit-argument
#bindkey -M root "^[5" digit-argument
#bindkey -M root "^[6" digit-argument
#bindkey -M root "^[7" digit-argument
#bindkey -M root "^[8" digit-argument
#bindkey -M root "^[9" digit-argument
bindkey -M root "^[<" beginning-of-buffer-or-history
bindkey -M root "^[>" end-of-buffer-or-history
bindkey -M root "^[?" which-command
bindkey -M root "^[A" accept-and-hold
bindkey -M root "^[C" capitalize-word
#bindkey -M root "^[G" get-line
bindkey -M root "^X^H" run-help
bindkey -M root "^[Q" push-line
bindkey -M root "^[W" copy-region-as-kill
bindkey -M root "^[[200~" bracketed-paste
bindkey -M root "^[_" insert-last-word
bindkey -M root "^[a" accept-and-hold
bindkey -M root "^X^C" capitalize-word
bindkey -M root "^[g" get-line # not sure
bindkey -M root "^[l" down-case-word # what for?
bindkey -M root "^[n" history-search-forward # fzf??
bindkey -M root "^[p" history-search-backward # fzf??
bindkey -M root "^[q" push-line # is it really useful??
bindkey -M root "^[s" spell-word # ???
bindkey -M root "^T" transpose-words
bindkey -M root "^[u" up-case-word
bindkey -M root "^[w" copy-region-as-kill
bindkey -M root "^X^X" execute-named-cmd
bindkey -M root "^[y" yank-pop
#bindkey -M root "^[z" execute-last-named-cmd
#bindkey -M root "^[|" vi-goto-column
#bindkey -M root "^[~" _bash_complete-word
bindkey -M root "^?" backward-delete-char
bindkey -M root -R "\M-^@"-"\M-^?" self-insert

bindkey -e
