ln -sf ~/.vim/vimrc ~/.vimrc
# download Vundle
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
# install bundles
vim +BundleInstall +qall
# extra install steps required for 'Command-T' plugin
cd ~/.vim/bundle/Command-T/ruby/command-t/
ruby extconf.rb
make
