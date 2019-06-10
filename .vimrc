set nobackup
set noswapfile
set number
set cursorline
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set list listchars=tab:\▸\-
set wrapscan
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set display=lastline
set pumheight=10

nnoremap Y y$


if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('justmao945/vim-clang')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('tpope/vim-fugitive')
    call dein#add('rstacruz/sparkup', {'rtp': 'vim/'})
    call dein#add('Yggdroot/indentLine')
    call dein#add('simeji/winresizer')
    call dein#add('JamshedVesuna/vim-markdown-preview')
    call dein#add('scrooloose/nerdtree')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" terminal
tnoremap <Esc> <C-\><C-n>

" window size manager
let g:winresizer_start_key = '<C-s>'

" markdown preview
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1
let vim_markdown_preview_browser='Google Chrome'

" nerd tree
nnoremap <silent><C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1

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
