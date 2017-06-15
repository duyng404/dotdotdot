" Color palette
let s:gui_gray1 = '#262626'
let s:cterm_gray1 = 235
let s:gui_gray2 = '#3a3a3a'
let s:cterm_gray2 = 237
let s:gui_lightgray1 = '#ffffff'
let s:cterm_lightgray1 = 15
let s:gui_lightgray2 = '#a8a8a8'
let s:cterm_lightgray2 = 248

let s:gui_normal_idc = '#808000'
let s:cterm_normal_idc = 3
let s:gui_insert_idc = '#00dfff'
let s:cterm_insert_idc = 45
let s:gui_replace_idc = '#800080'
let s:cterm_replace_idc = 5
let s:gui_visual_idc = '#008000'
let s:cterm_visual_idc = 2

let s:gui_red = '#df0000'
let s:cterm_red = 160
let s:gui_white = '#ffffff'
let s:cterm_white = 15
let s:gui_yellow = '#ff875f'
let s:cterm_yellow = 209
let s:gui_blue1 = '#000080'
let s:cterm_blue1 = 4
let s:gui_black = '#080808'
let s:cterm_black = 232

let g:airline#themes#cyberpink#palette = {}

" Normal mode
let s:N1 = [s:gui_black, s:gui_normal_idc, s:cterm_black, s:cterm_normal_idc]
let s:N2 = [s:gui_lightgray2, s:gui_gray2, s:cterm_lightgray2, s:cterm_gray2]
let s:N3 = [s:gui_normal_idc, s:gui_gray1, s:cterm_normal_idc, s:cterm_gray1]
let g:airline#themes#cyberpink#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#cyberpink#palette.normal_modified = {
      \ 'airline_c': [s:gui_yellow, s:gui_gray1, s:cterm_yellow, s:cterm_gray1, ''],
      \ }

" Insert mode
let s:I1 = [s:gui_black, s:gui_insert_idc, s:cterm_black, s:cterm_insert_idc]
let s:I2 = [s:gui_white, s:gui_blue1, s:cterm_white, s:cterm_blue1]
let s:I3 = [s:gui_insert_idc, s:gui_gray1, s:cterm_insert_idc, s:cterm_gray1]
let g:airline#themes#cyberpink#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#cyberpink#palette.insert_modified = copy(g:airline#themes#cyberpink#palette.normal_modified)
let g:airline#themes#cyberpink#palette.insert_paste = {
      \ 'airline_a': [s:gui_black, s:gui_yellow, s:cterm_black, s:cterm_yellow, ''],
      \ }

" Replace mode
let g:airline#themes#cyberpink#palette.replace = {
      \ 'airline_a': [s:gui_black, s:gui_replace_idc, s:cterm_black, s:cterm_replace_idc, ''],
      \ 'airline_c': [s:gui_replace_idc, s:gui_gray1, s:cterm_replace_idc, s:cterm_gray1, ''],
      \ }
let g:airline#themes#cyberpink#palette.replace_modified = copy(g:airline#themes#cyberpink#palette.insert_modified)

" Visual mode
let s:V1 = [s:gui_black, s:gui_visual_idc, s:cterm_white, s:cterm_visual_idc]
let s:V3 = [s:gui_white, s:gui_gray1, s:cterm_white, s:cterm_gray1]
let g:airline#themes#cyberpink#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:V3)
let g:airline#themes#cyberpink#palette.visual_modified = copy(g:airline#themes#cyberpink#palette.insert_modified)

" Inactive window
let s:IA = [s:gui_lightgray2, s:gui_gray1, s:cterm_lightgray2, s:cterm_gray1, '']
let g:airline#themes#cyberpink#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#cyberpink#palette.inactive_modified = {
      \ 'airline_c': [s:gui_yellow, '', s:cterm_yellow, '', ''],
      \ }

" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#cyberpink#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:gui_yellow, s:gui_gray2, s:cterm_yellow, s:cterm_gray2, '' ] ,
      \ [ s:gui_yellow, s:gui_gray1, s:cterm_yellow, s:cterm_gray1, '' ] ,
      \ [ s:gui_black, s:gui_normal_idc, s:cterm_black, s:cterm_normal_idc, 'bold' ] )
