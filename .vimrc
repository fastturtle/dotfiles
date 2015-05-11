" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Have Vim load indentation rules according to the detected filetype. Per
" " default Debian Vim only load filetype specific plugins.
if has("autocmd")
    filetype indent on
endif

set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes) in terminals


" Spacing options
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
filetype indent on      " load filetype-specific indent files

" Highlight lines over 80 characters in Python
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END

" Misc options
set number              " show line numbers
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Plugins using vim-plug
call plug#begin('~/.vim/plugged')

" Git control
Plug 'git@github.com:tpope/vim-fugitive.git'

" Syntax and text editing
Plug 'git://github.com/tpope/vim-surround.git'
Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'

" Visual information
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim', {'on': 'CtrlP'}
Plug 'Yggdroot/indentLine'

" Themes and Color Schemes
Plug 'altercation/vim-colors-solarized'
call plug#end()

" Settings for Solarized theme
syntax enable
set background=dark
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized

" Settings for vim-airline
set laststatus=2
let g:bufferline_echo=0
set noshowmode
set timeoutlen=50

" Settings for YouCompleteMe (YCM)
let g:ycm_autoclose_preview_window_after_completion=1
