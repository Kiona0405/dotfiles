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

filetype plugin indent on

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'justmao945/vim-clang'
    NeoBundle 'terryma/vim-multiple-cursors'
    NeoBundle 'gioele/vim-autoswap'
    NeoBundle 'tomtom/tcomment_vim'
    NeoBundle 'easymotion/vim-easymotion'
    NeoBundle 'VundleVim/Vundle.vim'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    NeoBundle 'Yggdroot/indentLine'
    NeoBundle 'simeji/winresizer'
    NeoBundle 'JamshedVesuna/vim-markdown-preview'
    call neobundle#end()
endif

" terminal
tnoremap <Esc> <C-\><C-n>

" window size manager
let g:winresizer_start_key = '<C-R>'

" markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1
let vim_markdown_preview_browser='Google Chrome'

" nerd tree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" indent line
let g:indentLine_faster = 1

" easy motion setting
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

syntax on
