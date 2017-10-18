# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="xiong-chiamiov-plus"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(osx git node go)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/n/bin"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# Add yarn to my path for npm dep management
export PATH="$PATH:`yarn global bin`"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Always prefer vim for text editor
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# chruby auto switching on .ruby-version
# source /usr/local/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh

# import all zsh related files
source $HOME/.dotfiles/aliases
source $HOME/.dotfiles/functions

# set up golang home and include go bin in path
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Added by n-install (see http://git.io/n-install-repo).
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  

# Add tmux scripts for common dev environments
export PATH=$HOME/.dotfiles/tmux-scripts:$PATH

export TERM=xterm-256color
