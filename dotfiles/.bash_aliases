# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Personal: ~/.bash_aliases
# Binni
#
# Last modified: 2013.04.05
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# ———————————————–
# less with vim
# ———————————————–

#The less.sh is /usr/share/vim/vimcurrent/macros/less.sh
alias less="less.sh"

# ———————————————–
# function: type "path" in terminal for ordered $PATH display:
# ———————————————–

function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

# ———————————————–
# Nice shorthands
# ———————————————–

alias t="timedatectl status && ntpq -c lpeer"

alias bashrc="vim ~/.bashrc"
alias bashrc_binni="vim ~/.bashrc_binni"
alias bash_aliases="vim ~/.bash_aliases"

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

alias exit="clear; exit"
alias h="htop"



# ———————————————–
# Python / Conda stuff
# ———————————————–

alias python_server="python -m SimpleHTTPServer 8888 &"

### Path to the miniconda installation
CONDA_PATH="/home/binni/miniconda3/bin"

### Aliases to add or remove conda from path
alias conda_add_path='export PATH="$CONDA_PATH:$PATH"; eval "$(register-python-argcomplete conda)";echo prepending $CONDA_PATH to PATH'
alias conda_remove_path='export PATH=`echo $PATH | sed -re "s;:?$CONDA_PATH:?;;"`'

### Aliases to query environments, create and activate environment, 
### source activate and source deactivate environemts
alias conda_env="conda_add_path;conda info -e;conda_remove_path"
alias csa="conda_add_path;source activate"
alias csd="source deactivate;conda_remove_path"

function conda_create_env { 
  if [ $# -ne 2 ]; then
    echo "Usage:   conda_create_env name python_version"
    echo "Example: conda_create_env MyPy 3.4"
    return 64
  fi 
  conda_add_path
  conda create -n $1 python=$2
  conda_remove_path
  csa $1 
}

### IPython and IJulia notebooks
alias ipython_notebook="cd /home/binni/Dropbox/ipython_notebooks/ && ipython notebook --profile=nbserver"
alias julia_notebook="cd /home/binni/Dropbox/ipython_notebooks/ && ipython notebook --profile=julia"

alias ssh_milou_ipython_tunneling="ssh -AXD 9999 brynjar@milou2.uppmax.uu.se"
alias chromium_ipython="chromium --proxy-server='socks5://127.0.0.1:9999' --host-resolver-rules='MAP * 0.0.0.0 , EXCLUDE 127.0.0.1'"

# ———————————————–
# SSH to milou
# ———————————————–
alias ssh_milou="ssh brynjar@milou2.uppmax.uu.se"

#=======================================GIT_COLORING=================================================
function git-branch-name
{
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}
function git-dirty {
  st=$(git status 2>/dev/null | tail -n 1)
  if [[ ! $st =~ "nothing to commit" ]]
  then
    echo "*"
  fi
}
function git-unpushed {
  brinfo=$(git branch -v | egrep "\* `git-branch-name`")
  if [[ $brinfo =~ ("[ahead "([[:digit:]]*)]) ]]
  then
    echo "(${BASH_REMATCH[2]})"
  fi
}
function gitify {
  status=$(git status 2>/dev/null | tail -n 3)
  if [[ $status == "" ]]
    then
      echo ""
    else
    echo "$(git-branch-name)$(git-dirty)$(git-unpushed)"
  fi
}
function make-prompt
{
  local RED="\[\e[1;31m\]"
  local GREEN="\[\e[1;32m\]"
  local BLUE="\[\e[1;34m\]"
  local PURPLE="\[\e[1;35m\]"
  local NO_COLOR="\[\e[0m\]"
  PS1="${RED}\$(gitify)${NO_COLOR}"$PS1

}

function git-list-last-merges
{
  for k in $(git branch -a --merged|grep -v "\->"|sed s/^..//);do echo -e $(git log -1 --pretty=format:"%Cgreen%ci %Cred%cr%Creset" "$k")\\t"$k";done|sort|more
}

#=======================================Uppmax=================================================
function mount_uppmax
{

  uppmax=/home/binni/Programming/uppmax;
  ce=$uppmax/concoct-execute
  map=$uppmax/map
  fusermount -u $ce || : 
  fusermount -u $map || : 
  sshfs brynjar@milou.uppmax.uu.se:/gulo/glob/brynjar/concoct-execute $ce 
  sshfs brynjar@milou.uppmax.uu.se:/gulo/glob/brynjar/GenerateReads_beta/map $map 
}
function umount_uppmax
{
  fusermount -u $ce || : 
  fusermount -u $map || : 
}

