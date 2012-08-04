syntax on
colorscheme desert
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

let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'spec'}
augroup RubyRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" HTML
autocmd FileType html setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" C++
autocmd FileType cpp setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Ruby
autocmd FileType ruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType cucumber setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" PHP
autocmd FileType php setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" JavaScript
autocmd FileType javascript setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" CoffeeScript
autocmd FileType coffee setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Python
" http://d.hatena.ne.jp/shuji_w6e/20090908/1252418641
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Go lang
autocmd FileType go setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Execute python script C-P
function! s:ExecPy()
    exe "!" . &ft . " %"
:endfunction
command! Exec call <SID>ExecPy()
autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>
autocmd FileType python let g:pydiction_location = '~/.vim/pydiction/complete-dict'

augroup BufferAu
  autocmd!
  au BufNewFile,BufRead * let g:AutoComplPop_CompleteOption = '.,w,b,u,t'
  au BufNewFile,BufRead *.rb let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k~/.vim/dict/ruby.dict'
augroup END

" http://www.kawaz.jp/pukiwiki/?vim#cb691f26
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/dev/dotfiles/.vim/vundle.git/
call vundle#rc()
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'ZenCoding.vim'
Bundle 'groenewege/vim-less'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on     " required!

let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

let g:Powerline_symbols = 'fancy'
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
