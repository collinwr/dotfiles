#############################################################
########################## Aliases ##########################
#############################################################

# GNU extras
alias cls="clear; ls"
alias lh="ls -lh"
alias lah="ls -lah"
alias la="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias svim="sudo -E vim"

#############################################################
######################### Functions #########################
#############################################################


#############################################################
######################### History ########################### 
#############################################################

# Search history with current line as argument
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search
bindkey "\e[B" down-line-or-beginning-search


#############################################################
################## Environment Variables #################### 
#############################################################

DOTFILES="~/dotfiles"


#############################################################
############### Various Configuration Options ###############
#############################################################

# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Sets vi Keymap
bindkey -v
export KEYTIMEOUT=1

unsetopt beep notify

setopt autocd       # automatically cd if filename specified
setopt extendedglob # extra file matching charcters
setopt nomatch      # print error if no file 


#############################################################
######################## Completion ######################### 
#############################################################

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle :compinstall filename '~/dotfiles/zsh/.zshrc'
autoload -Uz compinit
compinit
setopt completealiases


#############################################################
############## Enables Vim Commands in Prompt ###############
#############################################################

precmd() {
    RPROMPT=""
}
zle-keymap-select() {
    RPROMPT=""
      [[ $KEYMAP = vicmd ]] && RPROMPT="(CMD)"
        () { return $__prompt_status }
          zle reset-prompt
}
zle-line-init() {
    typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

#############################################################
########################## History ##########################
#############################################################

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory 
setopt hist_ignore_dups
setopt hist_ignore_space

# Arrow keys will search history for charcters in line
autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "\e[A" up-line-or-beginning-search
bindkey "\e[B" down-line-or-beginning-search


#############################################################
#### Setup colored man pages with and the required colors ### 
#############################################################
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# Colors 
ESC_SEQ="\x1b["
export COL_RESET=$ESC_SEQ"39;49;00m"
export COL_RED=$ESC_SEQ"31;01m"
export COL_GREEN=$ESC_SEQ"32;01m"
export COL_YELLOW=$ESC_SEQ"33;01m"
export COL_BLUE=$ESC_SEQ"34;01m"
export COL_MAGENTA=$ESC_SEQ"35;01m"
export COL_CYAN=$ESC_SEQ"36;01m"


#############################################################
############## Load OS Specific Configuration ###############
#############################################################

os=$(uname -s)
if [[ $os == "Darwin" ]]; then
  source ~/dotfiles/zsh/.zsh-mac
elif [[ $os == "Linux" ]]; then
  source ~/dotfiles/zsh/.zsh-linux
fi
