bindkey -v

# fzf key bindings: Ctrl-R (history search), Ctrl-T (file search), Alt-C (cd)
source <(fzf --zsh)

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# history: this is the only one NOT set by Zim's environment module
setopt HIST_FIND_NO_DUPS