"  _   _ ________  _________  _____
" | | | |_   _|  \/  || ___ \/  __ \
" | | | | | | | .  . || |_/ /| /  \/
" | | | | | | | |\/| ||    / | |
" \ \_/ /_| |_| |  | || |\ \ | \__/\
"  \___/ \___/\_|  |_/\_| \_| \____/
"
" obyx's vimrc
" https://gitlab.com/obyx/dotfiles

let mapleader=" "

" Install Plugins
call plug#begin('~/.local/share/nvim/plugged')
" Utility
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Asynchronus color highlighting
Plug 'tpope/vim-surround' " Change surrounds
Plug 'tpope/vim-commentary' " Comment/uncomment lines or blocks
Plug 'tpope/vim-eunuch' " Add unix commands to vim
Plug 'tpope/vim-fugitive' " Git control
Plug 'itchyny/lightline.vim' " Statusline
Plug 'alvan/vim-closetag' " Auto close tags
Plug 'airblade/vim-gitgutter' " Show git diff info in gutter
Plug 'vimwiki/vimwiki' " Maintain your own wiki
Plug 'junegunn/fzf.vim' " Fuzzy search files
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'jelera/vim-javascript-syntax' " Better JavaScript syntax
Plug 'preservim/nerdtree' " Nerdtree
call plug#end()

" CoC Settings
let g:coc_global_extensions = [
			\ 'coc-spell-checker',
      \ 'coc-pairs',
			\ 'coc-emmet',
			\ 'coc-eslint',
			\ 'coc-prettier',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-tsserver',
			\ 'coc-json',]

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
command! -nargs=0 Prettier :CocCommand prettier.formatFile " set format command

" The basics
syntax on
set encoding=UTF-8
set nocompatible
set number relativenumber
set nobackup
set nowritebackup
set termguicolors
set signcolumn=yes
filetype plugin indent on

" Save file as sudo when no sudo permissions
cmap SW SudoWrite

" Tab space and shift width
set ts=2 sw=2
set laststatus=2

" Enable autocompletion
set wildmode=longest,list,full

" Settings for lightline
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set noshowmode " Turn of showing of mode
let g:lightline = {
	\   'colorscheme': 'catppuccin',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }

" Remap switching between splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Clear search highlighting with Escape key
nnoremap <silent><esc> :noh<return><esc>

" Colorscheme
colorscheme catppuccin-frappe

" VimWiki
let g:vimwiki_list = [{'path': '~/.local/share/vimwiki/',}]"

" Nerdtree Settings
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" FZF Settings
nnoremap <leader>f :Files<CR>

" Fix splits
set splitbelow splitright

" Remove trailing whitespace on buffer write
autocmd BufWritePre * %s/\s\+$//e

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Fix indenting visual block
vmap < <gv
vmap > >gv

" Mappings for tabs
nnoremap tn :tabnew<space>

nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" Compile SASS
" autocmd BufWritePost *.sass,*.scss !sass ./*.s*ss ./main.css

" Compile Groff MS to PDF
autocmd BufWritePost *.ms !groff -ms ./*.ms -T pdf > %:r.pdf

" Vim Hexokinase
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

" pattern to look for
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\ ]
