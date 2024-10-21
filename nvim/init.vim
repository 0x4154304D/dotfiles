set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
"source ~/.vim/vimrc

set wildmenu
set hlsearch
set smartcase
set showcmd

set nu
" tab length
set tabstop=4
" autoindent lenth
set shiftwidth=4
" convert tab to space
set expandtab

"set laststatus=2
"set backspace=2

set cursorline

nnoremap <leader><C-s> :w<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"syntax 
syntax enable

"utf-8
set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

set smartindent
set autoindent

nnoremap <c-u> <esc>viw~<esc>
"set foldmethod=indent
nnoremap <space> za

"nnoremap
nnoremap <C-p> :<C-u>FZF<CR>

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
"Plug 'tpope/vim-unimpaired'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
