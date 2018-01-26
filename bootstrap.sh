#!/bin/bash
set -e

repo_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Linking this repo to the active Vim configuration..."
test -e ~/.vim && echo "~/.vim directory already exists, refusing to continue." && exit
test -e ~/.vimrc && echo "~/.vimrc file exists, refusing to continue." && exit
ln -s $repo_dir ~/.vim && echo "Linked $repo_dir to ~/.vim"
ln -s ~/.vim/vimrc ~/.vimrc && echo "Linked $repo_dir/vimrc to ~/.vimrc"
sleep 3 # let user see what we've done

# download NeoBundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# install bundles
vim +NeoBundleUpdate +qall

# install golang commands used by vim-go
vim +GoInstallBinaries +qall

# extra install steps required for 'Command-T' plugin
pushd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make
popd

# extra install step required for vim-prettier
pushd ~/.vim/bundle/vim-prettier
which -s yarn || \
  (echo "yarn is required -- 'brew install yarn' for OSX."; popd; exit 1)
yarn install
popd

# TODO: can we capture commands like ^^ this in ~/.vimrc if we migrate to a new
# plugin manager from NeoBundle?
