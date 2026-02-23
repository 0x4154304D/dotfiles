# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
# avoid hist dups histroy in .zsh_history
setopt HIST_IGNORE_DUPS
# reduce blanks in history
setopt HIST_REDUCE_BLANKS
# don't show duplicates in history
setopt HIST_FIND_NO_DUPS
# share history between sessions
setopt SHARE_HISTORY