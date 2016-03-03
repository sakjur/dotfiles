set nocompatible
let g:Imap_FreezeImap=1

syntax on
set number
set relativenumber " Avoid headmaths :P
set colorcolumn=80
set laststatus=2
highlight ColorColumn ctermbg=17

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
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
" OS X has the ° instead of ½, so let's map that too.        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ½ :tabprevious<CR>
nnoremap ° :tabprevious<CR>
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
autocmd BufNewFile,BufReadPost *.pl set filetype=prolog
autocmd BufNewFile,BufReadPost *.hsc set filetype=haskell

""""""""""""""""""""""""""
" Custom Digraphs        "
""""""""""""""""""""""""""
digraph ZZ 8484
digraph la 0955

""""""""""""""""""""""""""
" Plugins using Pathogen "
""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Other plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'fsharp/vim-fsharp'
Plugin 'jimenezrick/vimerl'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-characterize'
call vundle#end()
filetype plugin indent on

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_custom_ignore = '.git\|env'
let g:syntastic_python_python_exec = '/usr/bin/python3'
autocmd BufEnter * set mouse=
