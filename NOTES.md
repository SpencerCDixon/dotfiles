Misc Setup Tasks
* install homebrew (get curl command from github repo)
* set global git email and name

# Applications I want to have in every dev environment
brew cask install shiftit   # then add shiftit to sys accesibility prefs (requires sudo)
brew cask install slack 
brew cask install macvim
brew cask install evernote
brew cask install spotify

# Taps
brew install chruby
brew install ruby-install
brew install the_silver_searcher
brew install tree

# Install common rubies
ruby-install ruby 2.1.5
ruby-install ruby 2.2.0
ruby-install ruby 2.3.0

# Useful Links
[relative line numbers](http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/)
[getting snippets and youcompleteme to work together](http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme)

# Design Ideas
* separate plugin initializers into their own folder (vim/init)
* have an alias that displays all aliases
* store aliases in separate files inside an alias folder
* potentially store vundle/bundles in a vimrc.bundles and source it immediately in my main vimrc

Alias Types
* file system
* git helpers
* rake/rspec/npm helpers
* ns (npm start)
