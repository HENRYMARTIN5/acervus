if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi
source /usr/share/doc/pkgfile/command-not-found.bash
shopt -s autocd

eval "$(starship init bash)"