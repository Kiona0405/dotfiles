call plug#begin('~/.vim/plugged')
    " ####
    " completion
    " ####
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    inoremap ( ()<Esc>i
    inoremap { {}<Esc>i
    inoremap {<CR> {<CR>}<Esc>O
    inoremap [ []<Esc>i
    inoremap ' ''<Esc>i
    inoremap " ""<Esc>i
    

    " ###
    " File
    " ###
    Plug 'preservim/nerdtree'
    Plug 'airblade/vim-gitgutter'

    " ###
    " color/style
    " ###
    " Plug 'joshdick/onedark.vim'
    " Plug 'jmoggee/mirage.vim'
    Plug 'cocopon/iceberg.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'

    " ###
    " window resize
    " ### 
    Plug 'simeji/winresizer'
call plug#end()

" ######
" color scheme
" ######
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
syntax on
colorscheme iceberg

" ####
" vertival split column
" ####
set signcolumn=yes:1
set number relativenumber

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
set encoding=UTF-8
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
nnoremap <silent><C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1


" ##########
" coc
" ##########
let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-git', 'coc-clangd', 'coc-yaml', 'coc-highlight', 'coc-html', 'coc-sh']

" ###
" winresize
" ###
let g:winresizer_start_key = '<C-q>'
