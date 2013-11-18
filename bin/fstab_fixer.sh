#!/usr/bin/env bash

sudo mkdir -p /media/shared_files

cd ~/
mkdir Desktop
mkdir Documents
mkdir Downloads
mkdir Music
mkdir Pictures
mkdir Programming
mkdir Public
mkdir Videos

mkdir .antd
mkdir .ssh
mkdir .VirtualBox

mkdir bin
mkdir texmf

mkdir Dropbox
mkdir VirtualBox\ VMs

touch .bash_aliases
touch .bash_functions
touch .bashrc
touch .gitconfig
touch .screenrc
touch .vimrc
if [ -f $1 ]; then
  echo "No file given."
else
  sudo bash -c "cat $1 >> /etc/fstab"
fi

