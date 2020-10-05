" Setting the font and its height
set guifont=JetBrains\ Mono\ Regular:h13

" Fast saving
nmap <leader>w :w!<cr>

set autoread
au FocusGained,BufEnter * checktime

set wildmenu

" Changes the color of the side column
highlight SignColumn guibg=white ctermbg=white

" Adding a shadow to line where cursor is currently located
" set cursorline
" hi cursorline cterm=none term=none
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline

set noerrorbells

set tabstop=4 softtabstop=4

set shiftwidth=4

set smartindent

set smarttab

set nu

set nowrap

set noswapfile

set nobackup
set nowritebackup
set updatetime=300

set undodir=~/.vim/undodir

set undofile

set termguicolors

set scrolloff=8

set ruler

set autoindent

filetype plugin on
filetype indent on

" Configure backspace to act like it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
" set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config) 
set lazyredraw

" Add a bit extra margin to the left
" set foldcolumn=1

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-utils/vim-man'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'peitalin/vim-jsx-typescript'
Plug 'othree/yajs.vim'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main'  }

call plug#end()

let g:jedi#auto_initialization = 1

colorscheme monokai_pro
set background=dark

" if exists('+termguicolors')
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" endif
" let g:gruvbox_invert_selection='0'

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_sameids = 1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set t_Co=256

" Mapping Ctrl+n to :NERDTreeToggle
map <C-n> :NERDTreeToggle<CR>

" Displaying the default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_mapleader = 1

nnoremap <silent> <C-E> :Files<CR>

" Use <cr> to confirm completion, `<C-g>u` means break and undo chain at
" current position.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

let g:jedi#auto_initialization = 0

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documenation()<CR>

function! s:show_documenation()
	if (index(['vim', 'help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocActionsAsync('doHover')
	endif
endfunction

set completeopt=preview,menu
