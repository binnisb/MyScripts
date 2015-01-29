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
# function: add only once to path
# ———————————————–

pathadd_front() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:${PATH:+"$PATH"}"
    fi
}

# ———————————————–
# function: extract any compressed filetype
# ———————————————–

#e() {
#    local c e i
#
#    (($#)) || return
#
#    for i; do
#        c=''
#        e=1
#
#        if [[ ! -r $i ]]; then
#            echo "$0: file is unreadable: \`$i'" >&2
#            continue
#        fi
#
#        case $i in
#            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
#                   c=(bsdtar xvf);;
#            *.7z)  c=(7z x);;
#            *.Z)   c=(uncompress);;
#            *.bz2) c=(bunzip2);;
#            *.exe) c=(cabextract);;
#            *.gz)  c=(gunzip);;
#            *.rar) c=(unrar x);;
#            *.xz)  c=(unxz);;
#            *.zip) c=(unzip);;
#            *)     echo "$0: unrecognized file extension: \`$i'" >&2
#                   continue;;
#        esac
#
#        command "${c[@]}" "$i"
#        ((e = e || $?))
#    done
#    return "$e"
#}


# ———————————————–
# Nice shorthands
# ———————————————–

alias t="timedatectl status && ntpq -c lpeer"

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

alias exit="clear; exit"
alias h="htop"

# Cinnamon crashes, login to different tty and execute
alias cinnamon-restart='cinnamon --replace -d :0.0 > /dev/null 2>&1 &'

# ———————————————–
# Python / Conda stuff
# ———————————————–

alias python_server="python -m SimpleHTTPServer 8888 &"

### Path to the miniconda installation
CONDA_PATH="/home/binni/miniconda/bin"

### Aliases to add or remove conda from path
alias conda_add_path='pathadd_front $CONDA_PATH; eval "$(register-python-argcomplete conda)";echo prepending $CONDA_PATH to PATH'
alias conda_remove_path='export PATH=`echo $PATH | sed -re "s;:?$CONDA_PATH:?;;"`'

### Aliases to query environments, create and activate environment,
### source activate and source deactivate environemts
alias conda_env="conda_add_path;conda info -e;conda_remove_path"
alias csa="conda_add_path;source activate"
alias csd="source deactivate;conda_remove_path"

# Function to create new conda environment with name and python version
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

alias ssh_milou_ipython_tunneling="ssh -AXD 9999 brynjar@milou2.uppmax.uu.se"
alias chromium_ipython="chromium-browser --proxy-server='socks5://127.0.0.1:9999' --host-resolver-rules='MAP * 0.0.0.0 , EXCLUDE 127.0.0.1' https://127.0.0.1:9999"

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
    echo "($(git-branch-name)$(git-dirty)$(git-unpushed)) "
  fi
}
function make-prompt
{
  local RED="\[\e[1;31m\]"
  local GREEN="\[\e[1;32m\]"
  local BLUE="\[\e[1;34m\]"
  local PURPLE="\[\e[1;35m\]"
  local NO_COLOR="\[\e[0m\]"
  PS1=$PS1"${RED}\$(gitify)${NO_COLOR}"

}

function git-list-last-merges
{
  for k in $(git branch -a --merged|grep -v "\->"|sed s/^..//);do echo -e $(git log -1 --pretty=format:"%Cgreen%ci %Cred%cr%Creset" "$k")\\t"$k";done|sort|more
}
