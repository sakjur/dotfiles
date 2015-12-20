# Inspiration from https://github.com/eevee/rc/blob/master/.zshrc

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="gallifrey"
# DISABLE_AUTO_UPDATE="true"
export UPDATE_ZSH_DAYS=30
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$PATH:/opt/$USER/bin:$HOME/bin:/usr/local/bin:$HOME/.local/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
# export MANPATH="/usr/local/man:$MANPATH"
alias pyenv="source env/bin/activate"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Always use menu completion, and make the colors pretty!
zstyle ':completion:*' menu select yes
zstyle ':completion:*:default' list-colors ''

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

setopt extended_history hist_no_store hist_ignore_dups hist_expire_dups_first hist_find_no_dups inc_append_history share_history hist_reduce_blanks hist_ignore_space
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

page-up-within-tmux() {
    if [[ $TMUX == '' ]]; then
    # no-op; default behavior isn't useful, and anyway you don't want to do
    # something TOO cool here since you won't be able to do it inside tmux.
    # TODO if there's any way to command the /emu/ to scroll up one page, i
    # would love to hear about it
    else
        tmux copy-mode -u
    fi
}

zle -N page-up-within-tmux
# page up
bindkey "${terminfo[kpp]}" page-up-within-tmux

