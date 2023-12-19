" Environment {
  if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
  endif

  " Disable compatibility with vi
  set nocompatible
  " Dark Background
  set background=dark
  " TODO: Load Plugins

  " Turn on Syntax
  syntax on

  " Highlight cursor line
set cursorline
" set cursorcolumn

" Set shift width to 4 spaces
set shiftwidth=4

" Line Numbers with Relative Line Numbers
set number
set relativenumber

" File Stats
set ruler

" Blink cursor on error
set visualbell

" Encoding. 
set encoding=utf-8

" Security
set modelines=0

" Show color column at 80 characters
" set colorcolumn=80

"Whitespace.
set wrap
set autoindent
set smartindent
set tabstop=2 shiftwidth=2 expandtab

" Enable auto completion menu after pressing TAB
set wildmenu
set wildmode=list:longest

" allow hidden buffers"
set hidden

set ttyfast

set laststatus=2

" Last Line
set showmode
set showcmd
