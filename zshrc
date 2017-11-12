# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme I want to use
ZSH_THEME="xiong-chiamiov-plus"

# Add useful functions
source $HOME/.dotfiles/functions

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

# Add in aliases
source $HOME/.dotfiles/aliases

# Add autocomplete for fzf and zsh
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nogroup --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

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


# set up golang home and include go bin in path
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Added by n-install (see http://git.io/n-install-repo).
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  

# Add custom binaries to PATH
export PATH=$HOME/.dotfiles/bin:$PATH

export TERM=xterm-256color
