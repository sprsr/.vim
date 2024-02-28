" @sprsr vim config
" Environment --------------------------------------------{
    " Plugin manager
    call plug#begin()
    " Git Plug In
    Plug 'tpope/vim-fugitive'
    " gruvbox theme
    Plug 'morhetz/gruvbox'
    " NerdTree Plugin
    Plug 'preservim/nerdtree'
    " Plugin for Visual Marks
    Plug 'kshenoy/vim-signature'
    " Simple Tab Complete"
    Plug 'vim-scripts/VimCompletesMe'
    " Interactive Programs in Buffers (terminal)
    Plug 'vim-scripts/Conque-Shell'
    " Verilog Syntax Plugin
    Plug 'vhda/verilog_systemverilog.vim'
    " Indent Visualization
    Plug 'preservim/vim-indent-guides'
    " quotes, parantheses, brackets, quotes
    Plug 'tpope/vim-surround'
    " DrawIt
    Plug 'vim-scripts/DrawIt'
    # Fuzzy Finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " ChatGPT lol
    Plug 'CoderCookE/vim-chatgpt'
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

" Plug In Settings ---------------------------------------{

    " Enabling System Verilog Syntax Folding
    let g:verilog_syntax_fold_lst = "all"
    set foldenable
    set foldmethod=syntax
    " Follow Modules and Ports in System Verilog
    nnoremap <leader>i :VerilogFollowInstance<CR>
    nnoremap <leader>I :VerilogFollowPort<CR>
    " Jump to Instance start
    nnoremap <leader>u :VerilogGotoInstanceStart<CR"

    "Git Shortcuts"
    nnoremap <leader>ga :Git add 
    nnoremap <leader>gA :Git add *<CR>
    nnoremap <leader>gc :Git commit -m 
    nnoremap <leader>gC :Git commit -m 'updates'<CR>
    nnoremap <leader>gp :Git push<CR>
    nnoremap <leader>gP :Git add *<CR>Git commit -m 'updates'<CR>Git push<CR>

    " Drawit
    nnoremap <leader>dr :DrawIt <CR>

    "ChatGPT Key"
    "let g:openai_api_key='
    let g:chat_gpt_max_tokens=2000
    let g:chat_gpt_model='gpt-4'
    let g:chat_gpt_session_mode=0
    let g:chat_gpt_temperature = 0.7
    let g:chat_gpt_lang = 'English'
    let g:chat_gpt_split_direction = 'vertical'

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
    set backspace=indent,eol,start
    set linespace=0
    set showmatch
" --------------------------------------------------------}

" Vim UI -------------------------------------------------{
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
    set gdefault
    set list
    set listchars=tab:>.,trail:.,extends:\#,nbsp:.
    set splitbelow
    set splitright
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

    if has('statusline')
        set laststatus=2

        set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
    endif
" ------------------------------------------------------}

" GVIM SETTINGS--------------------------------------------}
  if has('gui_running')
    " remove the toolbar
    set guioptions-=T
    set lines=40
  endif
" --------------------------------------------------------}

" Search -------------------------------------------------{
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase
" --------------------------------------------------------}

" Whitespace----------------------------------------------{
    set nowrap
    set autoindent
    set smartindent
    set tabstop=4
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set pastetoggle=<F12>
" --------------------------------------------------------}

" Commands ----------------------------------------------{
    command Spc :sbp | wincmd p | wincmd T
" --------------------------------------------------------}

" Mappings ----------------------------------------------{
    let mapleader = ','
    " toggle spellcheck
    map <leader>ss :setlocal spell!<cr>
    " Spellcheck nav
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=

    " Ctrl+W+(J/K/L/H) switch to Ctrl+(J/K/L/H)
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_
    map <C-K> <C-W>k<C-W>_
    " map spc :sbc | wincmd p | wincmd T
    " Maps Shift+(H/L) to navigate tabs
    map <S-H> gT
    map <S-L> gt
    " Remap VIM 0 to first non-blank character
    map 0 ^
    "Reload .vimrc
    map <F1> :source ~/.vimrc<Enter>

    " Search and replace
    nnoremap <Leader>x *``cgn
    nnoremap <Leader>X #``cgN

    """ Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR> 
    " clear search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Move a line of text using ALT+[jk] or Command+[jk] on mac
    nmap <M-j> mz:m+<cr>`z
    nmap <M-k> mz:m-2<cr>`z
    vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

    if has("autocmd")
        autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
    endif

    " Normal Mode
    " Makes ; behave as :
    nnoremap ; :
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
    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Shifting Block
    vnoremap < <gv
    vnoremap > >gv
" --------------------------------------------------------}

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
" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Colorscheme keeps resetting...
colorscheme gruvbox
