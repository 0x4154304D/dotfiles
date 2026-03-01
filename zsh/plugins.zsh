# ---------------------
# Zim plugin manager
# ---------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Bootstrap: install Zim and link zimrc if missing.
if [[ ! -d $ZIM_HOME ]]; then
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
  rm -f ~/.zimrc
  ln -s ~/.dotfiles/zsh/zimrc ~/.zimrc
fi

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi

# --------------------
# Module configuration
# --------------------
# These must be set BEFORE sourcing init.zsh.

#
# input
#

#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# fast-syntax-highlighting
#

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

#
# duration-info
#

zstyle ':zim:duration-info' threshold 2

#
# completion
#

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.zcompcache"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

#
# prompt-pwd
#

zstyle ':zim:prompt-pwd' tail-count 2

# ------------------
# Initialize modules
# ------------------

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# fzf-tab
#

zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-flags --height=50%
