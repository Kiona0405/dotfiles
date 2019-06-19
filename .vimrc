set nobackup
set noswapfile
set number
set cursorline
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set wrapscan
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set display=lastline
set pumheight=10
set laststatus=2
set statusline=[%n]\ %<%f%h%m
set clipboard+=unnamedplus

nnoremap Y y$

if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    " call dein#add('Shougo/deoplete.nvim')
    " call dein#add('Shougo/neoinclude.vim')
    " call dein#add('Shougo/deoplete-clangx')
    " call dein#add('Shougo/neosnippet.vim')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('easymotion/vim-easymotion')
    call dein#add('tpope/vim-fugitive')
    call dein#add('rstacruz/sparkup', {'rtp': 'vim/'})
    call dein#add('Yggdroot/indentLine')
    call dein#add('simeji/winresizer')
    call dein#add('JamshedVesuna/vim-markdown-preview')
    call dein#add('scrooloose/nerdtree')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('octol/vim-cpp-enhanced-highlight')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" deoplete
" call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')
" let g:deoplete#enable_at_startup = 1
" let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
" call deoplete#custom#option('deoplete-options-auto_complete', v:true)
" call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')
" call deoplete#custom#var('clangx', 'default_cpp_options', '-std=c++14')

" "" Plugin key-mappings.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" " SuperTab like snippets behavior.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" " <S-TAB>: completion back.
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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
