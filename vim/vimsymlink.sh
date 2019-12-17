#!/bin/bash

GITVIMDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ ! -e ~/.vimrc ]; then
    echo "source $GITVIMDIR/_vimrc" > ~/.vimrc
fi

if [ ! -e ~/.ideavimrc ]; then
    ln -s ~/git/configs/vim/_ideavimrc ~/.ideavimrc
fi

if [ ! -e ~/.vsvimrc ]; then
ln -s ~/git/configs/vim/_vsvimrc ~/.vsvimrc
fi

if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi

if [ ! -e ~/.vim/coc-settings.json ]; then
    ln -s ~/git/configs/vim/coc-settings.json ~/.vim/coc-settings.json
fi

if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi

if [ ! -e ~/.config/nvim/coc-settings.json ]; then
    ln -s ~/git/configs/vim/coc-settings.json  ~/.config/nvim/coc-settings.json
fi

if [ ! -e ~/.config/nvim/init.vim ]; then
    echo "source $GITVIMDIR/_vimrc" > ~/.config/nvim/init.vim
fi

if [ ! -e ~/_gvimrc ]; then
    ln -s ~/git/configs/vim/after/plugin/directory-init.vim \
    ~/.vim/plugin/after/directory-init.vim
fi
