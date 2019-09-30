# TODO: Confirmation to remove and replace
# TODO: Make sure the script is executed in
# git root and then use git rev-parse --show-toplevel
rm ~/.inputrc
ln -S ~/.inputrc ~/git/configs/dotfiles/.inputrc
ln -S ~/.bashrc ~/git/configs/dotfiles/.bashrc
ln -S ~/.tmux.conf ~/git/configs/dotfiles/dotfiles.symlink.sh
