" NeoBundle BEGIN
set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off     " required!

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif

source ~/.vim/.vimrc.bundle

filetype plugin indent on     " required!
" NeoBundle END

source ~/.vim/.vimrc.indent
source ~/.vim/.vimrc.search
source ~/.vim/.vimrc.nerdtree
source ~/.vim/.vimrc.tag

syntax enable
au BufNewFile,Bufread *.psgi      set filetype=perl
au BufNewFile,Bufread *.ru        set filetype=ruby
au BufNewFile,Bufread Gemfile     set filetype=ruby
au BufNewFile,Bufread Guardfile   set filetype=ruby
au BufNewFile,Bufread Vagrantfile set filetype=ruby
au BufNewFile,Bufread Berksfile   set filetype=ruby
au BufNewFile,Bufread *.go        set filetype=go sw=2 noexpandtab ts=2
au BufNewFile,Bufread *.slim      set filetype=slim
set number
set termencoding=utf-8

set backspace=start,eol,indent

set background=dark
colorscheme solarized

let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

let g:Powerline_symbols = 'fancy'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" Clojure
let vimclojure#HighlightBuiltins   = 1
let vimclojure#HighlightContrib    = 1
let vimclojure#DynamicHighlighting = 1
let vimclojure#ParenRainbow        = 1

" Go lang
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif
" http://qiita.com/methane/items/4905f40e4772afec3e60
" :Fmt などで gofmt の代わりに goimports を使う
let g:gofmt_command = 'goimports'

" Go に付属の plugin と gocode を有効にする
set rtp^=${GOROOT}/misc/vim
set rtp^=${GOPATH}/src/github.com/nsf/gocode/vim

" 保存時に :Fmt する
" au BufWritePre *.go Fmt
au FileType go compiler go

" NERDtree
let NERDTreeIgnore = ['\.swp$', '\.pyc$']
