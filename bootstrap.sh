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
vim +NeoBundleInstall <(echo "Plugin installations complete.  Please quit Vim to continue.")

# extra install steps required for 'Command-T' plugin
pushd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make
popd
