set nocompatible
filetype plugin indent on

syntax on
set number
set relativenumber " Avoid headmaths :P
set colorcolumn=80
set laststatus=2
highlight ColorColumn ctermbg=17

if has('mouse')
    set mouse=a
endif

try
    colo vividchalk
catch /^Vim\%((\a\+)\)\=:E185/
    colo delek
endtry

""""""""""""""""""""""""""""""""""
" Yeah. I stole this from eevee! "
""""""""""""""""""""""""""""""""""
set nobackup
set writebackup
set undodir=~/.vim/undo
set undofile " PERSISTENT `undo` IS AWESOME!
set fileformats=unix,dos
set listchars=tab:↹·,extends:⇉,precedes:⇇,nbsp:␠,trail:␠,nbsp:␣

""""""""""""""""""""""""""""""""""
" Lots of stuff with indentation "
""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent

"""""""""
" UTF-8 "
"""""""""
set nobomb
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,iso-8859-1

set autoread " Re-read the file if the file is edited outside

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swedish Keyboard has this worthless button. Let's map 'em! "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ½ :tabprevious<CR>
nnoremap § :tabnext<CR>

noremap <C-Left> <C-W><Left>
noremap <C-Right> <C-W><Right>
noremap <C-Up> <C-W><Up>
noremap <C-Down> <C-W><Down>
" molokai's diff coloring is terrible
highlight DiffAdd ctermbg=22
highlight DiffDelete ctermbg=52
highlight DiffChange ctermbg=17
highlight DiffText ctermbg=53

""""""""""""""""""""""""""
" Force Markdown on *.md "
""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

""""""""""""""""""""""""""
" Plugins using Pathogen "
""""""""""""""""""""""""""
execute pathogen#infect()

let g:airline_theme='kolor'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

