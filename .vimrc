" Environment {
  "if has('win32') || has('win64')
  " set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
  "endif
  " Setup Bundle Support {
  " The next two lines ensure that the \~/.vim/bundle/ system works
  " runtime! autoload/pathogen.vim
  " silent! call pathogen\#helptags()
  " silent! call pathogen\#runtime_append_all_bundles()
  " }
  " Disable compatibility with vi
  set nocompatible
  " Security
  set modelines=0
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
  " Dark Background
  set background=dark
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
  " Scroll 5 lines when cursor leaves screen
  set scrolljump=5
  set scrolloff=3
  set foldenable
  set gdefault
  set list
  set listchars=tab:>.,trail:.,extends:\#,nbsp:.
  
  if has('statusline')
         set laststatus=2

         " Broken down into easily includeable segments
         set statusline=%<%f\\   " Filename
         set statusline+=%w%h%m%r " Options
         set statusline+=%{fugitive\#statusline()} "  Git Hotness
         set statusline+=\\ [%{&ff}/%Y]            " filetype
         set statusline+=\\ [%{getcwd()}]          " current dir
         "set statusline+=\\ [A=\\%03.3b/H=\\%02.2B] " ASCII /Hexadecimal value of char
         set statusline+=%=%-14.(%l,%c%V%)\\ %p%%  " Right aligned file nav info
     endif
" }

  set backspace=indent,eol,start  " backspace for dummys
  set linespace=0                 " No extra spaces between rows
  set showmatch

  " Search config
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase

" }



" Show color column at 80 characters
" set colorcolumn=80

"Whitespace.
set nowrap
set autoindent
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set pastetoggle=<F12>


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
