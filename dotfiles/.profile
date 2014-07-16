
# Add .local/bin in home.
if [ -d $HOME/.local/bin ]; then
    PATH=$HOME/.local/bin:$PATH
fi
# Add bin in home.
if [ -d $HOME/bin ]; then
    PATH=$HOME/bin:$PATH
fi
# Add MyScripts/bin in home.
if [ -d $HOME/Programming/MyScripts/bin ]; then
    PATH=$HOME/Programming/MyScripts/bin:$PATH
fi
# source bashrc if exists
if [ -f $HOME/.bashrc ]; then
    source $HOME/.bashrc
fi
if [ -f $HOME/.opam/opam-init/init.sh ]; then
    source ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
fi
