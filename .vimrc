syntax enable
colorscheme Monokai

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
set softtabstop=4
set noexpandtab

set cul
set number

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" map kj to ESC
imap kj <Esc>

" save with admin priviledges
command W w !sudo tee % > /dev/null

" toggle indent-safe paste mode
set pastetoggle=<F2>
