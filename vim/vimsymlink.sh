ln -s ~/git/configs/vim/_vimrc     ~.vimrc
ln -s ~/git/configs/vim/_ideavimrc ~.ideavimrc
ln -s ~/git/configs/vim/_vsvimrc   ~.ideavimrc

if [ ! -d "~/.vim"] then
    mkdir ~/.vim
fi

ln -s ~/git/configs/vim/UltiSnips  ~/.vim/UltiSnips
ln -s ~/git/configs/vim/coc-settings.json  ~/.vim/coc-settings.json

if [ ! -d "~/.configs/nvim"] then
    mkdir -p ~/.configs/nvim
fi
echo "source ~/.vimrc" >> ~/.configs/nvim/init.vim
