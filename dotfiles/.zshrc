# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export EDITOR='nvim'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# clear and put promt at the bottom
alias cls="clear;printf '\n%.0s' {1..50}"

# find a file and open it in nvim
alias nvimf="nvim \$(find ~ | fzf)"
alias nvimfr="nvim \$(find / | fzf)"
alias nvimfl="nvim \$(find . | fzf)"

# find a path and cd into it
alias cdf="cd \$(find ~ | fzf)"
alias cdfr="cd \$(find / | fzf)"
alias cdfl="cd \$(find . | fzf)"

# change brightness; to use do "brightness x" where 0 < x < 1
# NOTE: This only emulates brightness. To adjust screen backlight brightness,
#        use `light` in sudo
alias brightness="xrandr --output eDP-1 --brightness"

# better ls
alias ll="ls -A --group-directories-first"

# cd and ls
function cl () {
    cd "$@" && ls -A --group-directories-first
}

# ROS initialization (comment out of terminal startup is slow)
# export ROS_DOMAIN_ID=42
# source /opt/ros2/galactic/setup.zsh

# changing the $SHELL enviroment bariable from /bin/bash to /bin/zsh
export SHELL=/bin/zsh

# do not show warnings at startup
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Putting the promt at the bottom
printf '\n%.0s' {1..50}

# change console CWD using lf
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

# archive extractor
extract ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# video card config (for VLC and OBS etc)
export LIBVA_DRIVER_NAME=nouveau
export DRI_PRIME=1

