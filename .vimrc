syntax on
set number
set backspace=indent,eol,start
set clipboard=unnamed
set completeopt-=preview
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set wildmenu
set nocompatible


let g:clang_c_options = '-std=gnu14'
let g:clang_cpp_options = '-std=c++14 -stdlib=libc++'

filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'justmao945/vim-clang'
    NeoBundle 'terryma/vim-multiple-cursors'
    NeoBundle 'gioele/vim-autoswap'
    NeoBundle 'scrooloose/nerdcommenter'
    call neobundle#end()
endif

"insert here your Neobundle plugins"

filetype plugin indent on
nnoremap <silent><C-e> :NERDTreeToggle<CR>




set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Yggdroot/indentLine'
call vundle#end()            " required
filetype plugin indent on    " required


let g:indentLine_faster = 1

