#!/usr/bin/zsh

#=======================================================================
#       ENV VARIABLES
#=======================================================================
# NB for future notice this tries to install in dotfiles unless explicitly
# specified here
export DOTFILES=$HOME/Dotfiles
export RUNCOM=$DOTFILES/runcom/
if which yarn >/dev/null; then
  export PATH="$PATH:$(yarn global bin)"
fi
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.npm/bin:$PATH"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # GO ============================================================
    export GOPATH=$(go env GOPATH)
    export PATH=$PATH:/usr/local/go/bin
    export PATH=$PATH:$(go env GOPATH)/bin
    export PATH=$HOME/.local/bin:$PATH

  # RUBY ==========================================================
  if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ $MINIMAL != true ]]; then
    # Mac OSX
    export GOPATH=$HOME/Desktop/Coding/Go
    export GOROOT=/usr/local/opt/go/libexec
    export PATH=$PATH:/usr/local/opt/go/libexec/bin
    export PATH=$PATH:$(go env GOPATH)/bin
  fi

fi
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

export MANPATH="/usr/local/man:$MANPATH"
export PATH=~/.rbenv:$PATH

# you may need to manually set your language environment
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

if [ -f "$HOME/.environment.secret.sh" ]; then
  source $HOME/.environment.secret.sh
fi
# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=241'

if ! type "$bat" > /dev/null; then
  export BAT_THEME="TwoDark"
fi
