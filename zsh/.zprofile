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
