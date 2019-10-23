call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdTree'
Plug 'tpope/vim-fugitive'

Plug 'liuchengxu/space-vim-theme'
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'bling/vim-bufferline'
Plug 'vim-scripts/gtags.vim'
Plug 'majutsushi/tagbar'
Plug 'ap/vim-css-color'
Plug 'ayu-theme/ayu-vim'

call plug#end()

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
nmap <C-n> :NERDTreeToggle<CR>

syntax on

set termguicolors
let ayucolor="light"
colorscheme ayu

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0

set number
nmap <F8> :TagbarToggle<CR>

" \t config
set list
set listchars=tab:>-
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

