# brew
export PATH=$PATH:/opt/homebrew/bin
# vagrant
export VAGRANT_HOME="/Volumes/WDC/vagrant_boxes"
# Use Neovim as "prefered editor"
export VISUAL=nvim
export FZF_DEFAULT_COMMAND='rg --files'
# Maven
MAVEN_HOME=/opt/maven
PATH=$PATH:$MAVEN_HOME/bin
# Nodejs
NODE_HOME=/opt/node
PATH=$PATH:$NODE_HOME/bin
# GnuPG pinentry
export GPG_TTY=$(tty)
# Homebrew
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
# ollama
export OLLAMA_MODELS="/Volumes/WDC/ollama/models"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
