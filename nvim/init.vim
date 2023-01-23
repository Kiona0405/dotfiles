"####
" general setting
" ####
syntax enable
set imdisable
let mapleader = "\<space>"
let maplocalleader=","
set tags+=~/.vim/systags
set foldmethod=indent

set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8
set fileencodings=ucs-bom,utf-8,default
set cmdheight=1
let g:python_host_prog = system('echo -n $(which python2)')
let g:python3_host_prog = system('echo -n $(which python3)')

"###
" lua
"###
lua require('init')
" ###
" mappings
" ###
nnoremap * *``
" mode change
inoremap jk <esc>
" delete line
noremap <leader>d dd
" move cursor 
noremap K 10k
noremap J 10j
noremap A 0
noremap E $
noremap L 10l
noremap H 10h
" move window
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j
noremap <leader>l <c-w>l
noremap <leader>h <c-w>h
" close window 
noremap <leader>z :only<Enter>
noremap <leader>q :q<Enter> :echo 'quit'<Enter>
noremap <leader>w :w<Enter> :echo 'save'<Enter>
" split window
noremap <Leader>sp :sp<Enter>
noremap <Leader>vs :vs<Enter>
" open as new tab/ close
noremap <Leader>op :tab split<Enter>
noremap <Leader>cl :tabclose<Enter>
" vimrc
nnoremap <Leader>ev :vs $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>
" clipboard
vnoremap <Leader>c "*y


call plug#begin('~/.vim/plugged')
    " ####
    " completion
    " ####
    Plug 'neovim/nvim-lspconfig'
    Plug 'jiangmiao/auto-pairs'
    Plug 'andviro/flake8-vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
    Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
    Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
    Plug 'hrsh7th/cmp-cmdline'

    " ###
    " File
    " ###
    Plug 'preservim/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " ###
    " color/style
    " ###
    Plug 'rodnaph/vim-color-schemes'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'cocopon/iceberg.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'altercation/vim-colors-solarized'

    " ###
    " debug
    " ###
    " Plug 'puremourning/vimspector'

    " ###
    " UI
    " ### 
    Plug 'simeji/winresizer'
    Plug 'christoomey/vim-tmux-runner'
    Plug 'tpope/vim-commentary'
call plug#end()

" ######
" color scheme
" ######
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" let g:onedark_hide_endofbuffer=1
" let g:onedark_termcolors=256
" let g:onedark_terminal_italics=1
syntax on
set background=dark
colorscheme iceberg

" ####
" column
" ####
set number relativenumber
set numberwidth=2

" ####
" indent
" ####
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" #######
" status bar (airline)
" #######

nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='iceberg'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = ' '

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" ##########
" nerd tree
" ##########
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
nnoremap <silent><leader>to :NERDTree<CR>
nnoremap <silent><leader>tc :NERDTreeClose<CR>
nnoremap <silent><leader>tf :NERDTreeFocus<CR>
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1
let g:NERDTreeWinSize=20
let g:netrw_menu=0

" ###
" flake8-vim
" ###
let g:PyFlakeCheckers = 'pep8,flake8'
let g:PyFlakeDisabledMessages = 'E402'
nnoremap <leader>pd PyFlakeToggle

" ###
" winresize
" ###
let g:winresizer_start_key = '<leader>rw'

" ###
" gitgutter(diff column)
" ###
let g:gitgutter_map_keys = 0
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghs <Plug>(GitGutterStageHunk)

" ###
" vim-tmux-runner
" ###
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
nnoremap <leader>mo :VtrOpenRunner<Enter>
nnoremap <leader>mf :VtrFocusRunner<Enter>
nnoremap <leader>ma :VtrAttachToPane<Enter>
nnoremap <leader>mk :VtrKillRunner<Enter>
nnoremap <leader>mr :VtrSendCommandToRunner !! <Enter>
" nnoremap <leader>mr :VtrSendCommandToRunner ls

" ###
" Makefile
" ###
if expand("%:r") == 'Makefile'
  set noexpandtab
endif

" ###
" ctags
" ###
nnoremap <leader>jd <c-]>
nnoremap <leader>jb <c-o>
nnoremap <leader>jn <c-i>

" ###
" fzf
" ###
nnoremap <leader>of :FZF<Enter>

" ###
" digdag's config file
" ###
autocmd BufNewFile,BufRead *.dig set filetype=yaml
autocmd Syntax yaml setl indentkeys-=<:> indentkeys-=0#

" ###
" vimspector
" ###
let g:vimspector_enable_mappings='HUMAN'
