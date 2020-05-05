#!/usr/bin/env bash
#
# brew.sh installs a minimimal brew setup that I want for new machines.

brew tap spencercdixon/formulae
brew tap heroku/brew

brew install cmake
brew install exocortex
brew install heroku
brew install zsh
brew install tree
brew install ctags
brew install reattach-to-user-namespace
brew install autojump
brew install cloc
brew install ruby-install
brew install chruby
brew install tldr
brew install the_platinum_searcher
brew install tmux
brew install redis
brew install youtube-dl
brew install vim
brew install carthage
brew install git-delta
brew install bat

# Fuzzy finder
brew install fzf
$(brew --prefix)/opt/fzf/install

brew cask install 1password
brew cask install alfred
brew cask install dropbox
brew cask install evernote
brew cask install google-chrome
brew cask install insomnia
brew cask install iterm2
brew cask install postgres
brew cask install slack
brew cask install spotify
