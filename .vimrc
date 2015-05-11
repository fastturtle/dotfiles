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
set showcmd             " show command in bottom bar
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
