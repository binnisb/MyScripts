
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
# Add nomachine.
if [ -d /usr/local/nomachine ]; then
    PATH=/usr/local/nomachine/NX/bin:$PATH
fi
# Add texlive.
if [ -d /usr/local/texlive ]; then
    PATH=/usr/local/texlive/2014/bin/x86_64-linux:$PATH
fi
## source bashrc if exists
#if [ -f $HOME/.bashrc ]; then
#    source $HOME/.bashrc
#fi
if [ -f $HOME/.opam/opam-init/init.sh ]; then
    source ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
fi

# Load global python argcomplete
if [ -f $HOME/.bash_completion.d/python-argcomplete.sh ]; then
    source ~/.bash_completion.d/python-argcomplete.sh
fi

# OPAM configuration
if [ -f $HOME/.opam/opam-init/init.sh ]; then
    source $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true 
fi

## Elixir configuration
#if [ -d $HOME/Programming/vc-cloned/elixir ]; then
#    PATH=$PATH:$HOME/Programming/vc-cloned/elixir/bin
#fi

# Julia configuration
if [ -d $HOME/opt/julia/usr/bin ]; then
    PATH=$PATH:$HOME/opt/julia/usr/bin
fi
