#UPDATE and UPGRADE
sudo apt-get update; and sudo apt-get upgrade

#INSTALL PACKAGES FROM REPO
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:team-xbmc/ppa
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-add-repository ppa:webupd8team/java
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886; and echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update
sudo apt-get install kodi git sublime-text vim fish spotify-client texlive xzdec xclip texify

#SET SHELL TO FISH
chsh -s /usr/bin/fish
set -x FISH /home/binni/.config/fish/config.fish
mkdir -p (dirname $FISH)
mkdir -p (dirname $FISH)/functions

set -U EDITOR vim

echo "
# Setup terminal, and turn on colors
set -x TERM xterm-256color
set -xU LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34:su=0:sg=0:tw=0:ow=0:'

# Enable color in grep
set -x GREP_OPTIONS '--color=auto'
set -x GREP_COLOR '3;33'

set -x LESS '--ignore-case --raw-control-chars'
set -x PAGER 'less'
set -x EDITOR 'vim'

set -x LANG en_US.UTF-8
set -x LC_CTYPE 'en_US.UTF-8'
set -x LC_MESSAGES 'en_US.UTF-8'
set -x LC_COLLATE C
" >> $FISH


#INSTALL LASTPASS
sudo mkdir -p /opt/lastpass; and cd /opt/lastpass; and wget https://lastpass.com/lplinux.tar.bz2; and tar xvf lplinux.tar.bz2; and ./install_lastpass.sh; and cd -

#INSTALL GOOGLE CHROME
cd /tmp/; and wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb; and sudo dpkg -i google-chrome-stable_current_amd64.deb; and cd -

#INSTALL ANACONDA
cd /tmp; and wget https://repo.continuum.io/archive/Anaconda3-2.5.0-Linux-x86_64.sh; and bash Anaconda3-2.5.0-Linux-x86_64.sh; and cd -

#INSTALL SCALA IDE
cd /tmp; and wget http://downloads.typesafe.com/scalaide-pack/4.3.0-vfinal-luna-211-20151201/scala-SDK-4.3.0-vfinal-2.11-linux.gtk.x86_64.tar.gz; and tar -xf scala-SDK*; and sudo mv eclipse /opt/; and echo 'set -x PATH /opt/eclipse $PATH' >> (dirname $FISH)/functions/eclipse.fish; and cd -

#INSTALL ATOM
cd /tmp; and wget https://atom.io/download/deb -O atom.deb; and sudo dpkg -i atom.deb; and cd -

#INSTALL JENV
git clone https://github.com/gcuisinier/jenv.git ~/.jenv; and cp $HOME/.jenv/fish/*.fish (dirname $FISH/functions)

#INSTALL JAVA
sudo apt-get install openjdk-7-jdk openjdk-7-jre icedtea-7-plugins
sudo apt-get install oracle-java7-installer oracle-java8-installer

#INSTALL TexStudio
cd /tmp; and wget http://download.opensuse.org/repositories/home:/jsundermeyer/xUbuntu_15.10/amd64/texstudio-qt4_2.10.8_amd64.deb -O ts.deb; and sudo dpkg -i ts.deb; and cd -

sudo apt-get install nfs-common
sudo mkdir -p /mnt/ds
