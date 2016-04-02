sudo pacman -Syy --needed yaourt
yaourt -Syy --needed texlive-science texlive-latexextra sublime-text-dev mendeleydesktop google-chrome fish texstudio \
                     libu2f-host intellij-idea-community-edition jdk8-openjdk jdk kodi pkgfile sbt scala \
                     octave htop mariadb-clients nfs-utils openvpn redshift spotify scudcloud weechat slack-desktop dropbox \
                     autofs zsh tmux tmuxinator


sudo archlinux-java set java-8-jdk
sudo wget https://github.com/Yubico/libu2f-host/blob/master/70-u2f.rules -o /etc/udev/rules.d/70-u2f.rules

chsh -s /usr/bin/zsh

mkdir -p $HOME/Projects/ && cd $HOME/Projects && git clone git@github.com:binnisb/MyScripts.git && cd -

mkdir -p $HOME/.tmuxinator && cd $HOME/.tmuxinator && ln -s $HOME/Projects/MyScripts/tmux/*.yml . && cd -

cd /tmp && wget https://torguard.net/downloads/TorGuardPRO.zip && unzip TorGuardPRO.zip && cd TorGuardPRO && rename -v .ovpn .conf *.ovpn & sudo mv * /etc/openvpn/ && cd - && echo "installed TorGuard"
cd /tmp && wget https://repo.continuum.io/archive/Anaconda3-2.5.0-Linux-x86_64.sh && bash Anaconda3-2.5.0-Linux-x86_64.sh && cd - && echo "Installed Anaconda3"

