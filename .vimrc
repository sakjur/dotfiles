set nocompatible
let g:Imap_FreezeImap=1
let mapleader = "-"

""""""""""""""""""""""""""""""""""""""""""""
" Numbers, colors and those kind of things "
""""""""""""""""""""""""""""""""""""""""""""
syntax on
set number
set relativenumber " Avoid headmaths :P
set colorcolumn=80
set laststatus=2
highlight ColorColumn ctermbg=245

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
" <CTRL+K> in imode      "
""""""""""""""""""""""""""
digraph ZZ 8484
digraph la 0955

""""""""""""""""""""
" Custom shortcuts "
""""""""""""""""""""
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

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
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-vividchalk'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/rainbow_parentheses.vim'
call vundle#end()
filetype plugin indent on

"""""""""
" color "
"""""""""
try
    colo vividchalk
catch /^Vim\%((\a\+)\)\=:E185/
    colo torte
endtry

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
let g:ctrlp_custom_ignore = '.git\|env\|target'
let g:syntastic_python_python_exec = '/usr/bin/python3'
autocmd BufEnter * set mouse=

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=90
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=94
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" autocmd VimEnter,Colorscheme * :IndentGuidesEnable

function! Elkme(line)
  let cmd = '/usr/bin/elkme -q --from Vim'
  let msg = getline(a:line)
  call system(cmd, [msg])
endfunction

if(!exists(":SMS"))
  command SMS call Elkme(line("."))
  nnoremap <leader>s :SMS<cr>
else
  echomsg "Error loading Elkme for Vim: Command SMS already exists"
endif

