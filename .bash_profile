# ========================================================
# Colored command output
# ========================================================

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# ========================================================
# Change prompt
# ========================================================

export PS1="| (\u) > \w "'$(
    if [[ $(__git_ps1) =~ \*\)$ ]] 
    then echo "\e[1;33m" $(__git_ps1) "\e[0m"
    elif [[ $(__git_ps1) =~ \+\)$ ]] 
    then echo "\e[1;33m" $(__git_ps1) "\e[0m"
    else echo "\e[0;32m" $(__git_ps1) "\e[0m"
    fi)'" \n| => "
export PS2="| => "

# ========================================================
# Auto completion
# ========================================================

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# ========================================================
# GIT
# ========================================================

source ~/.bash/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# ========================================================
# Prefered way to call commands
# ========================================================

alias ls='ls -GFh'
alias grep='grep --color=auto'

# ========================================================
# Colored man pages
# ========================================================

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


