" Environment --------------------------------------------{
" Plugin manager
call plug#begin()
    " Git Plug In
    Plug 'tpope/vim-fugitive'
    " gruvbox theme
    Plug 'morhetz/gruvbox'
    " NerdTree Plugin
    Plug 'preservim/nerdtree'
call plug#end()

" Disable compatibility with vi
set nocompatible
" Security
set modelines=0
" Enable filetype plugins
filetype plugin on
filetype indent on
" autoread file when changed outside of instance
set autoread
au FocusGained,BufEnter * checktime
" --------------------------------------------------------}

" Basic --------------------------------------------------{
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
" Turn on Syntax
syntax on
syntax enable
set regexpengine=0
" Detect Files
filetype plugin indent on
set mouse=a
set number
" Relative l#
set relativenumber

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
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
" }

" Vim UI {
" Dark Background
set background=dark
" load a colorscheme
color gruvbox
" only show 15 tabs
set tabpagemax=15
" display the current modew
set showmode
" Highlight cursor line
set cursorline
" set cursorcolumn
" Show color column at 80 characters
" set colorcolumn=80
" Blink cursor on error
set visualbell
" File Stats
set ruler
" partial cmds
set showcmd
" Scroll 5 lines when cursor leaves screen
set scrolljump=5
set scrolloff=3
set foldenable
set gdefault
set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:.
set splitbelow
set splitright

if has('statusline')
    set laststatus=2

    set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
endif
" }

set backspace=indent,eol,start  " backspace for dummys
set linespace=0                 " No extra spaces between rows
set showmatch

" Search {
set incsearch
set hlsearch
set ignorecase
set smartcase

" }




" Whitespace {
    set nowrap
    set autoindent
    set smartindent
    set tabstop=4
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set pastetoggle=<F12>
" }

" Key Mapping {
    let mapleader = ','
    " Ctrl+W+(J/K/L/H) switch to Ctrl+(J/K/L/H)
     map <C-J> <C-W>j<C-W>_
     map <C-K> <C-W>k<C-W>_
     map <C-L> <C-W>l<C-W>_
     map <C-H> <C-W>h<C-W>_
     map <C-K> <C-W>k<C-W>_
    " Maps Shift+(H/L) to navigate tabs
     map <S-H> gT
     map <S-L> gt

    " Normal Mode
    " Makes ; behave as :
    nnoremap ;:
    " Navigation on wrapped lines
    nnoremap j gj
    nnoremap k gk
    " Yank to eol with Y
    nnoremap Y y$

    "Reduce Save Misses
    cmap W w
    cmap WQ wq
    cmap wQ wq
    cmap Q q
    cmap Tabe tabe
" }

" Enable auto completion menu after pressing TAB
set wildmenu
set wildmode=list:longest,full

" allow hidden buffers"
set hidden
set ttyfast
set laststatus=2
" Last Line
set showmode
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
