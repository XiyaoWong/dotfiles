# Check if zplug is installed
source ~/.zplug/zplug || { curl -sL zplug.sh/installer | zsh && source ~/.zplug/zplug }


zmodload zsh/zprof

start_time="$(date +%s)"
# export NVM_LAZY_LOAD=true
# export NVM_AUTO_USE=true
# NB for future notice this tries to install in dotfiles unless explicitly
# specified here
export NVM_DIR="$HOME/.nvm"


# ZSH_TMUX_AUTOSTART="true"

export PATH="$PATH:`yarn global bin`"
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.node/bin:$HOME/.rbenv/shims:$PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# this line puts Python in the PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH

export ZSH=/Users/A_nonymous/.oh-my-zsh

# Turn off default zsh vi mode indicator
# export RPS1="%{$reset_color%}"


#=======================================================================

#                 THEME
#=======================================================================

# PROMPT
# ➔ - default arrow
# ➼ - fun alternative
# ➪ - fun alternative2
SPACESHIP_PROMPT_SYMBOL='➜ 🍕 👾 '
SPACESHIP_PROMPT_ADD_NEWLINE=true

# TIME
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true

# VI_MODE
SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_INSERT="[Insert]"
SPACESHIP_VI_MODE_NORMAL="[Normal]"
# GIT
SPACESHIP_PREFIX_GIT='  on '
SPACESHIP_PREFIX_NVM=' @ '



#=======================================================================
# User configuration
#=======================================================================
#
#=======================================================================
#                  ZPLUG
#=======================================================================

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
# zplug "lukechilds/zsh-nvm"

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/heroku", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "lukechilds/zsh-better-npm-completion"
# Vim like bindings plugin. Need to run after theme, so mode indicator
# can be set, if the theme didn't already set it.
# antigen-bundle sharat87/zsh-vim-mode
# ZSH_VIM_MODE_NORMAL_MAP=^j
# antigen bundle rupa/z
# add-zsh-hook precmd _z_precmd
# function _z_precmd {
#     _z --add "$PWD"
# }
zplug "plugins/pyenv", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/zsh-users/zsh-completions", from:oh-my-zsh
zplug "plugins/zsh-users/zsh-autosuggestions", from:oh-my-zsh
zplug "plugins/zsh-users/zsh-history-substring-search", from:oh-my-zsh
zplug "plugins/zsh-users/zsh-syntax-highlighting", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/zsh-users/zsh-history-substring-search", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/vundle", from:oh-my-zsh
zplug "plugins/web-search", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/brew", from:oh-my-zsh
# zplug "$dotfiles/runcom/functions.sh", from:local

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
# zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
# zplug "tcnksm/docker-alias", use:zshrc

# Disable updates using the "frozen" tag
# zplug "k4rthik/git-cal", as:command, frozen:1

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh

# Also prezto
zplug "modules/prompt", from:prezto

# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
# zplug "jhawthorn/fzy", \
#     as:command, \
#     rename-to:fzy, \
#     hook-build:"make && sudo make install"

# Supports checking out a specific branch/tag/commit
# zplug "b4b4r07/enhancd", at:v1
# zplug "mollifier/anyframe", at:4c23cb60

# Can manage gist file just like other packages
# zplug "b4b4r07/79ee61f7c140c63d2786", \
#     from:gist, \
#     as:command, \
#     use:get_last_pane_path.sh

# Support bitbucket
zplug "b4b4r07/hello_bitbucket", \
    from:bitbucket, \
    as:command, \
    use:"*.sh"

# Rename a command with the string captured with `use` tag
# zplug "b4b4r07/httpstat", \
#     as:command, \
#     use:'(*).sh', \
#     rename-to:'$1'

# Group dependencies
# Load "emoji-cli" if "jq" is installed in this example
# zplug "stedolan/jq", \
#     from:gh-r, \
#     as:command, \
#     rename-to:jq
# zplug "b4b4r07/emoji-cli", \
#     on:"stedolan/jq"
# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Can manage local plugins
# zplug "~/.zsh", from:local

# Load theme file
# zplug 'dracula/zsh', as:theme
zplug "sindresorhus/pure"
# zplug "themes/robbyrussell", \
#   from:oh-my-zsh, \
#   as:theme
# zplug "denysdovhan/spaceship-zsh-theme", from:oh-my-zsh as:theme


# zplug check returns true if the given repository exists
if zplug check b4b4r07/enhancd; then
    # setting if enhancd is available
    export ENHANCD_FILTER=fzf-tmux
  fi
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
# source plugins and add commands to the PATH
zplug load





#=======================================================================
#               VI-MODE
#=======================================================================
# Default vi mode - not compatible with vi mode zsh plugin
# bindkey -v
# Binds vim mode terminal esc command to jk
# bindkey -M viins ‘jk’ vi-cmd-mode
# bindkey ‘^R’ history-incremental-search-backward


DEFAULT_USER=$USER

export MANPATH="/usr/local/man:$MANPATH"
export PATH=~/.rbenv:$PATH
# you may need to manually set your language environment
 export LANG=en_us.utf-8

# preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# compilation flags
# export archflags="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/rsa_id"


# if no command is set typing in a line will cd by default
setopt AUTO_CD
setopt CORRECT
setopt RM_STAR_WAIT


if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

# default code for base16 shell
# base16_shell=$home/.config/base16-shell/
# [ -n "$ps1" ] && [ -s $base16_shell/profile_helper.sh ] && eval "$($base16_shell/profile_helper.sh)"
#create powerline env variable
# powerline-path='./library/python/2.7/lib/python/site-packages'

# persistent reshahing i.e puts new executables in the $path
zstyle ':completion:*' rehash true


# source all zsh and sh files inside dotfile/runcom
export dotfiles=$HOME/.dotfiles
export runcom=$DOTFILES/runcom/
source $dotfiles/runcom/functions.sh
source $dotfiles/runcom/zsh/alias.zsh
# for config ($RUNCOM/**/*) source $config - too dangerous
for fzfscript ($dotfiles/runcom/fzf/*.sh) source $fzfscript
for script ($dotfiles/runcom/zsh/*) source $script



# Setup global bookmarks cdg function
# ====================================
# Need to find a way to export this to my cdg function
unalias cdg 2> /dev/null
cdg() {
   local dest_dir=$(cdscuts_glob_echo | fzf )
   if [[ $dest_dir != '' ]]; then
      cd "$dest_dir"
   fi
}
# export -f cdg > /dev/null


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

bindkey '^ ' autosuggest-accept
# Automatically list directory contents on `cd`. slow things down
# unnecessarily
# auto-ls () { ls -m; }
# chpwd_functions=( auto-ls $chpwd_functions )


# Fzf ruby fuzzy finder very fast and adaptable
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

end_time="$(date +%s)"
# Compares start time defined above with end time above and prints the
# difference
echo load time: $((end_time - start_time)) seconds
# zprof

