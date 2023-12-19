" Environment {
  if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
  endif

  " Disable compatibility with vi
  set nocompatible
  " Dark Background
  set background=dark
  " TODO: Load Plugins
" }

" Basic {
  " Turn on Syntax
  syntax on
  " Detect Files
  filetype plugin indent on
  set mouse=a
  set number
  " Relative l#
  set relativenumber
  " Set shift width to 4 spaces
  set shiftwidth=4
  if !has('win32') && !has('win64')
    set term=$TERM
  endif
  " set autochdir
  " Allow cursor to go beyond last char
  set virtualedit=onemore
  " Spell Checking
  set spell
  " Encoding. 
  set encoding=utf-8
" }

" Vim UI {
  " load a colorscheme
  color solarized
  " only show 15 tabs
  set tabpagemax=15
  " display the current modew
  set showmode
  " Highlight cursor line
  set cursorline
  " set cursorcolumn
  " Blink cursor on error
  set visualbell
  " File Stats
  set ruler
  " partial cmds
  set showcmd


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
