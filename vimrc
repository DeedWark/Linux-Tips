" VIM CONFIG
syntax on
colorscheme koehler
set backspace=2
set mouse=a
set nu
set smartindent
set expandtab
set tabstop=2
retab
set shiftwidth=2
filetype indent on

" call plug#begin()
" Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
" Plug 'darrikonn/vim-gofmt'
" Plug 'ayu-theme/ayu-vim'
" call plug#end()
" set termguicolors
" let ayucolor="dark"
" colorscheme ayu

" SHORTCUT
cmap w!! w !sudo tee >/dev/null %
cmap teebag w !sudo tee >/dev/null %

" AUTOMATION
autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl># Description:\<nl># Author:\<nl># Date:\<nl># Version:\<nl>\<nl>\"|$
