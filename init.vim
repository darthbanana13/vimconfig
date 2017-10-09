" Enable syntax highlighting
syntax enable

" Delete & Backspace keys can now deletelete indentation, EOL chacters, and
" start of the line char
set backspace=indent,eol,start

" Enable mouse
set mouse=a

" Define leader key , instead of \
let mapleader = ','

" Activate line numbers
set number

" Set true color in (n)vim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" #VIM Plug
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Airline :)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Download our favourite theme
Plug 'zanglg/nova.vim'

" Better file browsing
Plug 'tpope/vim-vinegar'

" Right hand file browser
Plug 'scrooloose/nerdtree'

" Quickly find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'ctrlpvim/ctrlp.vim'

"For the silver searcher plugin
"Plug 'rking/ag.vim'

Plug 'skwp/greplace.vim'

" Ultisnips engine
Plug 'SirVer/ultisnips'

"Snippets are separated from the engine. The following line adds them
Plug 'honza/vim-snippets'

"Delete/Change/Add surroundings
Plug 'tpope/vim-surround'

"Moar PHPs!
Plug 'StanAngeloff/php.vim'

"Auto-add use statement
Plug 'arnaud-lb/vim-php-namespace'

" Initialize plugin system
call plug#end()

" #VIM Plug End

" Actualy apply the colorscheme
colorscheme nova
set background=dark " Setting dark mode

"--------------------AirLine Config------------------------
" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbolslet g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"-------------------Searching--------------------------------

"highlight search results
set hlsearch

"
set incsearch

"-------------------Mappings---------------------------------

"Make it easy to edit Vimrc(init) file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :tabedit 

"Highlight removal
nmap <Leader><space> :nohlsearch<cr>


"-------------------Auto-Commands----------------------------

augroup autosourcing
	autocmd!
	"Automatically source the Vimrc(init) file on save.
	autocmd BufWritePost init.vim source %
augroup END

"/
"/For vim-php-namespace
"/

"add use statement
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

"addd fully qulified class name
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

"-------------------Visuals----------------------------
"Set the vim background to transparent so the colorscheme
"from the theme does not get in the way
hi Normal guibg=NONE ctermbg=NONE

"-------------------Split Management----------------------------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"-------------------FZF----------------------------
"Bind the FZF file search to CTRL+P, same as the CtrlP plugin
nmap <C-p> :Files<cr>

"-------------------NERDTree----------------------------
" Don't let NERDTree Hijack Dash
let NERDTreeHijackNetrw = 0

"Make it easier to toggle NERDTree
nmap <C-\> :NERDTreeToggle<cr>

"-------------------greplace----------------------------
" Instruct greplace to use ag
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'