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
PS1='[\u@\h \W]\$ '
source $HOME/.bash_aliases
make-prompt

# Editor
export EDITOR=atom
