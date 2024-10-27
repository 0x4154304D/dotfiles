"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath=&runtimepath
"source ~/.vim/vimrc
"runtime vim.lua


set nocompatible

set wildmenu
set hlsearch
set smartcase
set showcmd

set number
set relativenumber
set cursorline

" tab indent
set tabstop=4
" autoindent lenth
set shiftwidth=4
" convert tab to space
set expandtab

set laststatus=2
"set backspace=2

nnoremap <leader><C-s> :w<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


"syntax 
syntax enable
filetype on

"utf-8
set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

set smartindent
"set autoindent

autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$")
      \ |   exe "normal! g`\""
      \ | endif

"nnoremap <c-u> <esc>viw~<esc>
"foldexpr 指定的方式折叠代
set foldmethod=indent
"使用 treesitter 根据语言语法折叠代码
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=1
nnoremap <space> za

"nnoremap <C-p> :<C-u>FZF<CR>
"FZF
nnoremap <C-p> :Files<CR>
nnoremap <C-e> :Buffers<CR>
"let g:fzf_action = {'ctrl-e': 'edit'}

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"lsp
Plug 'neovim/nvim-lspconfig'
Plug 'preservim/nerdtree' |
        \  Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'kien/rainbow_parentheses.vim'
"let g:rbpt_colorpairs = [
"    \ ['brown',       'RoyalBlue3'],
"    \ ['Darkblue',    'SeaGreen3'],
"    \ ['darkgray',    'DarkOrchid3'],
"    \ ['darkgreen',   'firebrick3'],
"    \ ['darkcyan',    'RoyalBlue3'],
"    \ ['darkred',     'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['brown',       'firebrick3'],
"    \ ['gray',        'RoyalBlue3'],
"    \ ['black',       'SeaGreen3'],
"    \ ['darkmagenta', 'DarkOrchid3'],
"    \ ['Darkblue',    'firebrick3'],
"    \ ['darkgreen',   'RoyalBlue3'],
"    \ ['darkcyan',    'SeaGreen3'],
"    \ ['darkred',     'DarkOrchid3'],
"    \ ['red',         'firebrick3'],
"    \ ]
"let g:rbpt_max = 16
"let g:rbpt_loadcmd_toggle = 0
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"git
Plug 'lewis6991/gitsigns.nvim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

"==============================================================================
" colortheme
"==============================================================================

" 24bit color
if has('termguicolors')
    set termguicolors
endif
colorscheme monokai

"==============================================================================
" NERDTree
"==============================================================================

"nerdtree
nnoremap <leader>e :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
" 打开和关闭NERDTree快捷键
nnoremap <leader>f :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=0
" 设置宽度
" let NERDTreeWinSize=31
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

"==============================================================================
"  nerdtree-git-plugin
"==============================================================================
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeGitStatusShowIgnoredStatus = 1
