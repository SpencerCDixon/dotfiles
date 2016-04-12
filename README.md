# Installation
```
git clone <url> .dotfiles
rake install
```

## Directory Structure

## Plugins

**Tabular**: [Video explaining use](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/)
```
:Tab /= (regex)
,a=   " align equal signs
,a:   " align colons
```

**YouCompleteMe**: Intelligent in editor text completetion.  Tab to cycle through options.

```
brew install cmake
vim +PluginInstall +qall
cd .vim/bundle/YouCompleteMe
./install.py
```

## Leader Mappings
|Combo|Plugin|Description|
|-----|------|-----------|
|`,f`|ctrlP|search file system|
