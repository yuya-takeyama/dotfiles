source ~/dev/dotfiles/.vimrc.bundle
source ~/dev/dotfiles/.vimrc.indent

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

augroup BufferAu
  autocmd!
  au BufNewFile,BufRead * let g:AutoComplPop_CompleteOption = '.,w,b,u,t'
  au BufNewFile,BufRead *.rb let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/ruby.dict'
augroup END

colorscheme desert256

let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

let g:Powerline_symbols = 'fancy'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
