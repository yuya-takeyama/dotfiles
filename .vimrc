" NeoBundle BEGIN
set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off     " required!

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

source ~/dev/dotfiles/.vimrc.bundle

filetype plugin indent on     " required!
" NeoBundle END

source ~/dev/dotfiles/.vimrc.indent
source ~/dev/dotfiles/.vimrc.search

syntax enable
au BufNewFile,Bufread *.psgi set filetype=perl
au BufNewFile,Bufread *.ru   set filetype=ruby
set number
set termencoding=utf-8

colorscheme solarized
set background=dark

let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

let g:Powerline_symbols = 'fancy'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
