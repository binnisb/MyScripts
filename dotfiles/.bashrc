#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# TMUX
if which tmux 2>&1 >/dev/null; then
  # if no session is started, start a new session
  test -z ${TMUX} && tmux
  # when quitting tmux, try to attach
  while test -z ${TMUX}; do
    tmux attach || break
  done
fi

# Make prompt
PS1='[\u@\h \W]\$ '
source $HOME/.bash_aliases
make-prompt

# Editor
export EDITOR=gvim
# Load global python argcomplete
source ~/.bash_completion.d/python-argcomplete.sh
#eval "$(register-python-argcomplete concoct)"
