"""
""" Minimalist .vimrc version for slow terminal emulators.
""" Author: Mikael Henriksson
"""

" --- Vim != Vi ---
set nocompatible
filetype off

" --- Enable 24-bit true color support
if exists('+termguicolors')
    " TMUX compliance
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    " Enable true color
    set termguicolors
endif

" --- Vundle ---
" Note to self: Vundle has been depricated and should probably be replaced
" with some other plugin manager. Maybe have a look at Vim-Plug.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'preservim/nerdtree'
    Plugin 'ap/vim-css-color'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'mbbill/undotree'
    Plugin 'morhetz/gruvbox'
call vundle#end()
filetype plugin indent on

" --- Gruvbox colorscheme settings. Setting explanation can be found:
"  https://github.com/morhetz/gruvbox/wiki/Configuration
let g:gruvbox_bold='1'
let g:gruvbox_italic='1'
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" --- Airline settings
let g:airline_theme = 'gruvbox'

" --- Map leader key ---
let mapleader = " "

" --- Enable filetype detection, plugin loading and auto indentation
filetype plugin indent on

" --- Use white space for tabbing ---
set tabstop=4
set shiftwidth=4
set expandtab

" --- Line and column numbering ---
set number
set relativenumber
set ruler
nmap <C-L><C-L> :set invrelativenumber<CR>

" --- Delete functionality, use 'Leader+d' to remove and yank ---
nnoremap d "_d
xnoremap d "_d
nnoremap x "_x
xnoremap x "_x
nnoremap s "_s
xnoremap s "_s
nnoremap c "_c
xnoremap c "_c
nnoremap C "_C
xnoremap C "_C
nnoremap <leader>d ""d
xnoremap <leader>d ""d

" --- ':noh' bind
nnoremap <leader>n :noh<CR>

" --- i3-like binding for switching between splits ---
nnoremap <leader>ö <C-W>l
nnoremap <leader>j <C-W>h
nnoremap <leader>k <C-W>j
nnoremap <leader>l <C-W>k

" --- Nerdtree settings
nnoremap <leader>o :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1

" --- Undotree settings.
nnoremap <leader>u :UndotreeToggle<CR>

" --- Other settings
set laststatus=2
set scrolloff=4
set backspace=2
set hlsearch        " Highlight on search
set hidden          " Keep buffers open in bg for fast reopening
set incsearch       " Highlight text when searching
set signcolumn=no   " No extra linting column
syntax on
set nowrap

