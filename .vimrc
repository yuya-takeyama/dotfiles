syntax on
au BufNewFile,Bufread *.psgi set filetype=perl
au BufNewFile,Bufread *.ru   set filetype=ruby
set number
set ruler
set tabstop=4
set incsearch
set ignorecase
set autoindent
set expandtab
set termencoding=utf-8

source ~/dev/dotfiles/.vimrc.indent

augroup BufferAu
  autocmd!
  au BufNewFile,BufRead * let g:AutoComplPop_CompleteOption = '.,w,b,u,t'
  au BufNewFile,BufRead *.rb let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/ruby.dict'
augroup END

set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off     " required!

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'ZenCoding.vim'
NeoBundle 'groenewege/vim-less'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'The-NERD-Tree'
NeoBundle 'banyan/recognize_charcode.vim'
NeoBundle 'desert256.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'JavaScript-syntax'
NeoBundle 'jQuery'

colorscheme desert256

filetype plugin indent on     " required!

let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

let g:Powerline_symbols = 'fancy'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
