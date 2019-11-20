if [ ! -e ~/.vimrc ]; then
    ln -s ~/git/configs/vim/_vimrc ~/.vimrc
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

if [ ! -d ~/.vim/pythonx ]; then
    ln -s ~/git/configs/vim/pythonx ~/.vim/pythonx
fi

if [ ! -d ~/.vim/UltiSnips ]; then
    ln -s ~/git/configs/vim/UltiSnips ~/.vim/UltiSnips
fi

if [ ! -e ~/.vim/coc-settings.json ]; then
    ln -s ~/git/configs/vim/coc-settings.json ~/.vim/coc-settings.json
fi

if [ ! -e ~/.config/nvim/coc-settings.json ]; then
    ln -s ~/git/configs/vim/coc-settings.json  ~/.config/nvim/coc-settings.json
fi

if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
fi

if [ ! -e ~/.config/nvim/init.vim ]; then
    echo "source ~/.vimrc" >> ~/.config/nvim/init.vim
fi
