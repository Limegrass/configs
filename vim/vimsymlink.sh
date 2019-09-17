if [ ! ~/.vimrc ]; then
    ln -s ~/git/configs/vim/_vimrc     ~/.vimrc
fi

if [ ! ~/.ideavimrc ]; then
    ln -s ~/git/configs/vim/_ideavimrc ~/.ideavimrc
fi

if [ ! ~/.vsvimrc ]; then
ln -s ~/git/configs/vim/_vsvimrc   ~/.vsvimrc
fi

if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi

if [ ! -d ~/.vim/pythonx ]; then
    ln -s ~/git/configs/vim/pythonx  ~/.vim/pythonx
fi

if [ ! -d ~/.vim/UltiSnips ]; then
    ln -s ~/git/configs/vim/UltiSnips  ~/.vim/UltiSnips
fi

if [ ! ~/.vim/coc-settings.json ]; then
    ln -s ~/git/configs/vim/coc-settings.json  ~/.vim/coc-settings.json
fi

if [ ! -d ~/.configs/nvim ]; then
    mkdir -p ~/.configs/nvim
fi

if [ ! ~/.configs/nvim/init.vim ]; then
    echo "source ~/.vimrc" >> ~/.configs/nvim/init.vim
fi
