#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PROMPT_COMMAND=prompt_cmd
PS2='\[\033[01;36m\]>'

COLOR_WHITE='\[\033[00m\]'
COLOR_CYAN='\033[02;36m\]'
COLOR_GREEN='\033[02;32m\]'
COLOR_ORANGE='\033[00;33m\]'

prompt_cmd () {
  LAST_STATUS=$?
  PS1="$PS1USERCOLOR\u"
  PS1+="$COLOR_WHITE@\h "
  PS1+="$COLOR_CYAN\w "
  if [ -n "$(parse_git_branch)" ]; then
      PS1+="$COLOR_ORANGE$(parse_git_branch) "
  fi
  PS1+="$COLOR_WHITE"
  PS1+='\$ '

  if [[ $LAST_STATUS = 0 ]]; then
      PS1+=""
  else
      PS1+="T_T "
  fi


}

parse_git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }


