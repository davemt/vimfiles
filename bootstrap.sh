#!/bin/bash
set -e

repo_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Linking this repo to the active Vim configuration..."
test -e ~/.vim && echo "~/.vim directory already exists, refusing to continue." && exit
test -e ~/.vimrc && echo "~/.vimrc file exists, refusing to continue." && exit
ln -s $repo_dir ~/.vim && echo "Linked $repo_dir to ~/.vim"
ln -s ~/.vim/vimrc ~/.vimrc && echo "Linked $repo_dir/vimrc to ~/.vimrc"
ln -s ~/.vim/ideavimrc ~/.ideavimrc && echo "Linked $repo_dir/ideavimrc to ~/.ideavimrc"
sleep 3 # let user see what we've done

# download plug.vim (vim-plug)
mkdir -p ~/.vim/plugged
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Golang is required to exist before installing vim-go
which -s go ||
    (echo "golang is required -- 'brew install go' for OSX."; exit 1)

# yarn is required for vim-prettier plugin -- others?
which -s yarn ||
    (echo "yarn is required -- 'brew install yarn' for OSX."; exit 1)

# install bundles
vim +PlugInstall +qall
