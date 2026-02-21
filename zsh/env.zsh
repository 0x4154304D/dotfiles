# You may need to manually set your language environment
export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi
# set fzf default command
export FZF_DEFAULT_COMMAND='rg --files'
# llvm
export PATH=$PATH:/opt/homebrew/opt/llvm/bin
# brew
export PATH=$PATH:/opt/homebrew/bin
# vagrant
export VAGRANT_HOME="/Volumes/GLOWAY/vagrant_boxes"
# Use Neovim as "prefered editor"
export VISUAL=nvim
# Maven
MAVEN_HOME=/opt/maven
export PATH=$PATH:$MAVEN_HOME/bin
# Nodejs
NODE_HOME=/opt/node
export PATH=$PATH:$NODE_HOME/bin
# GnuPG pinentry
export GPG_TTY=$(tty)
# lima
export LIMA_HOME=/Volumes/GLOWAY/lima/config
# Homebrew
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
# Homebrew Bottles
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
# history timestamp
if [ -n "$BASH_VERSION" ]; then
    export HISTTIMEFORMAT='%F %T '
fi
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/at0m/miniconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/Users/at0m/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/Users/at0m/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="/Users/at0m/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<
# local.bin(include cursur agent)
export PATH="$HOME/.local/bin:$PATH"
