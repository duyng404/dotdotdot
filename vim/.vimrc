" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'bling/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'scrooloose/syntastic'
    Plugin 'bronson/vim-trailing-whitespace'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'pangloss/vim-javascript'
    Plugin 'leafgarland/typescript-vim'
    Plugin 'Quramy/tsuquyomi'
    Plugin 'mxw/vim-jsx'
    Plugin 'fatih/vim-go'
    Plugin 'Raimondi/delimitMate' " Auto close brackets
    Plugin 'mattn/emmet-vim' " Quick HTML input
    Plugin 'alvan/vim-closetag' " Auto close HTML tags
    " Plugin 'Shougo/neocomplete'
    Plugin 'editorconfig/editorconfig-vim'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

map <F10> :NERDTreeToggle<CR>
"close vim if only nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='cyberpink'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" airline sections
function! AirlineInit()
    let g:airline_section_y = airline#section#create('')
    " let g:airline_section_error = airline#section#create('syntastic')
    let g:airline_section_warning = airline#section#create('')
    let g:airline_detect_whitespace = 0
endfunction
autocmd VimEnter * call AirlineInit()

try
    colorscheme wal
catch
    colorscheme molokai
endtry

" weird bug with cc file idk
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
set softtabstop=4
set noexpandtab

" show line number
set cul
set number

" Navigate 4x faster when holding down Shift
nmap <S-j> 4j
vmap <S-j> 4j
nmap <S-k> 4k
vmap <S-k> 4k
nmap <S-h> 5h
vmap <S-h> 5h
nmap <S-l> 5l
vmap <S-l> 5l

" c++11
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" buffer navigation
let mapleader = "z"
nnoremap <leader>] :bnext<cr>
nnoremap <leader>[ :bprevious<cr>
nnoremap <leader>n :enew<cr>
nnoremap <leader>q :bp <BAR> bd #<CR>

" navigate buffer without writing
set hidden

" windows navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" copy to clipboard
vnoremap <C-c> "+y

" toggle indent-safe paste mode
set pastetoggle=<F2>

" enable folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" map kj to ESC
imap kj <Esc>

" save with admin priviledges
command W w !sudo tee % > /dev/null

" enable mouse
set mouse=a

" set auto read when opened file changes
set autoread

" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
if has ("clipboard")
    set clipboard=unnamed

    if has ("unnamedplus")
        set clipboard+=unnamedplus
    endif
endif
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
hi cursorline ctermbg=0
" Show “invisible” characters
"set lcs=trail:·,nbsp:_
"set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
"set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling four lines before the horizontal window border
set scrolloff=4

" Automatic commands
if has("autocmd")
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Go
let g:go_doc_keywordprg_enabled = 0

" delimitMate HTML conflict with vim-closetag
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php"
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"

" emmet
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
