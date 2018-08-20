#!/usr/bin/env bash
#
# Sets up vim installation

# vim-tmp a requirement in vimrc
mkdir "$HOME/.vim-tmp"
mkdir -p "$HOME/.vim/bundle"

# Clean any previous vundle code
rm -rf "$HOME/.vim/bundle/vundle"

# Fetch vundle and install plugins
git clone https://github.com/gmarik/vundle "$HOME/.vim/bundle/vundle"
vim +PluginInstall +qall

# Install YouCompleteMe binaries with completion for all languages
cd "$HOME/.vim/bundle/YouCompleteMe" || echo "Missing you complete me plugin"
./install.py --all
