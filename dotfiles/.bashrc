#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# TMUX
if hash tmux 2>/dev/null; then
  # if no session is started, start a new session
  test -z ${TMUX} && tmux
fi

# Make prompt
export PS1="\[\e[00;36m\]\t\[\e[0m\]\[\e[00;37m\] \[\e[0m\]\[\e[00;32m\]\u\[\e[0m\]\[\e[00;36m\]@\[\e[0m\]\[\e[00;32m\]\h\[\e[0m\]\[\e[00;37m\] \W \[\e[0m\]\[\e[00;36m\]\\$\[\e[0m\]\[\e[00;37m\] \[\e[0m\]"
source $HOME/.bash_aliases
make-prompt

# Editor
export EDITOR=vim

