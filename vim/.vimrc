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
	Plugin 'kien/ctrlp.vim'
	Plugin 'scrooloose/syntastic'
	Plugin 'bronson/vim-trailing-whitespace'
	Plugin 'flazz/vim-colorschemes'
	Plugin 'tpope/vim-fugitive'
	Plugin 'mattn/emmet-vim'
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

" open nerdtree when no file specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open nerdtree browser
map <F10> :NERDTreeToggle<CR>
" close Vim if the only window left is nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" airline
let g:airline_powerline_fonts = 1
let g:airline_theme="badwolf"
set laststatus=2
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

syntax enable " enable syntax
colorscheme molokai

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
set softtabstop=4
set noexpandtab

set cul
set number " show line number

" c++11
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" python
autocmd BufRead *.py nmap <F5> :w<CR>:!python "%"<CR>
let g:pymode_lint_on_write = 0

" buffer navigation
let mapleader = "z"
nnoremap <leader>] :bnext<cr>
nnoremap <leader>[ :bprevious<cr>
nnoremap <leader>n :enew<cr>
nnoremap <leader>q :bp <BAR> bd #<CR>

" windows navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" copy to clipboard
vnoremap <C-c> "+y

" CtrP
nnoremap <leader>p :CtrlPBuffer<cr>

" toggle indent-safe paste mode
set pastetoggle=<F2>

set foldenable " enable folding
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
" map kj to ESC
imap kj <Esc>

" save with admin priviledges
command W w !sudo tee % > /dev/null

" enable mouse
set mouse=a

" toggle line wrap movement
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
