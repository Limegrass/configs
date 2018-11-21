ln -s ~/git/configs/vim/_vimrc     ~.vimrc
ln -s ~/git/configs/vim/_ideavimrc ~.ideavimrc
ln -s ~/git/configs/vim/_vsvimrc   ~.ideavimrc

if [ ! -d "~/.vim"]; then
    mkdir ~/.vim
fi

ln -s ~/git/configs/vim/UltiSnips  ~/.vim/UltiSnips
