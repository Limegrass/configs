#!/bin/bash

VIMCONFIG="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ -z "$VIMINIT" ]; then
    echo "export VIMINIT=\"source $VIMCONFIG/_vimrc\"" >> ~/.bashrc
fi

if [ -z "$GVIMINIT" ]; then
    echo "export GVIMINIT=\"source $VIMCONFIG/_gvimrc\"" >> ~/.bashrc
fi

if [ ! -e ~/.ideavimrc ]; then
    ln -s "$VIMCONFIG"/_ideavimrc ~/.ideavimrc
fi

if [ ! -e ~/.vsvimrc ]; then
    ln -s "$VIMCONFIG"/_vsvimrc ~/.vsvimrc
fi
