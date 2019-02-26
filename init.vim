" Enable syntax highlighting
syntax enable

" Don't let vim work in legacy VI mode
set nocompatible

" Delete & Backspace keys can now deletelete indentation, EOL chacters, and
" start of the line char
set backspace=indent,eol,start

" Enable mouse
set mouse=a

" Define leader key , instead of \
let mapleader = ','

" Activate line numbers
set number

"Automatically write the file when switching buffers.
set autowriteall

"Tabs and spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                       "Use spaces instead of tabs

set undofile
set undodir=$HOME/.local/share/undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Copy to system clipboard (+, not *)
" set clipboard=unnamedplus

"Map delete to black hole register
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
inoremap <Leader>pp <C-o>"+p

nnoremap <Leader>P "+P
vnoremap <Leader>P "+P
inoremap <Leader>PP <C-o>"+P

nnoremap <Leader>l "0p
vnoremap <Leader>l "0p
inoremap <Leader>ll <C-o>"0p

nnoremap <Leader>L "0P
vnoremap <Leader>L "0P
inoremap <Leader>LL <C-o>"0P

nnoremap <Leader>y "+y
vnoremap <Leader>y "+y

nnoremap <Leader>c "+d
vnoremap <Leader>c "+d

vnoremap <C-f> y/<C-R>"<CR>

" Toggle to don't indent on paste
set pastetoggle=<F2>

" Prevent the cursor going back one character when exiting from insert mode
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

"Move lines with Shift+Up/Down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Set the updatime for vim and plugins like git gutter
set updatetime=4000

" Set default encoding
set encoding=utf-8
scriptencoding utf-8

" Set true color in (n)vim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Use tags from Ctags to the max by allowing it to suggest completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Autocomplete match current file, window, buffer, unclosed buffer
set complete=.,w,b,u

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" #VIM Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Airline :)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Download our favourite theme
Plug 'zanglg/nova.vim'

"Best git wrapper form Vim
Plug 'tpope/vim-fugitive'

" Better file browsing
Plug 'tpope/vim-vinegar'

" Right hand file browser
Plug 'scrooloose/nerdtree'

" Quickly find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
"Plug 'ctrlpvim/ctrlp.vim'

"For the silver searcher plugin
Plug 'ggreer/the_silver_searcher'

" Plug 'skwp/greplace.vim'

" Ultisnips engine
Plug 'SirVer/ultisnips'

"Snippets are separated from the engine. The following line adds them
Plug 'honza/vim-snippets'

"Delete/Change/Add surroundings
Plug 'tpope/vim-surround'

"PHP CS Fixer
Plug 'stephpy/vim-php-cs-fixer'

"improve the syntax highlighting
Plug 'StanAngeloff/php.vim', {'for': 'php'}

"Auto-add use statement
Plug 'arnaud-lb/vim-php-namespace'

"Seach as you type
Plug 'osyo-manga/vim-over'

" Add an intellisense engine (and language server) to VIM
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}

" Language: PHP
Plug 'phux/php-doc-modded', {'for': 'php'}
Plug 'phpactor/phpactor', {'for': 'php', 'do': ':call phpactor#Update()'}
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'alvan/vim-php-manual', {'for': 'php'}

" Xdebug for PHP
Plug 'joonty/vdebug'

" Put wrong things in the gutter
Plug 'neomake/neomake'

" outliner
Plug 'majutsushi/tagbar'

"Expand selected region
Plug 'terryma/vim-expand-region'

"Quickly comment lines
Plug 'scrooloose/nerdcommenter'

"To create our own text objects
Plug 'kana/vim-textobj-user'

"Add a textobject for the entire file 'e'
Plug 'kana/vim-textobj-entire'

"Add a textobject for an entire line 'l'
Plug 'kana/vim-textobj-line'

"Add a textobject for an entire indent 'i'
Plug 'kana/vim-textobj-indent'

" Show modified git files
Plug 'airblade/vim-gitgutter'

" Show syntactic errors (like a linter)
Plug 'w0rp/ale'

" Mustache template system, required for pdv |PHP Documentor
Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'}

" Navigate fast in the window
Plug 'easymotion/vim-easymotion'

" To easily see blocks of code
Plug 'nathanaelkane/vim-indent-guides'

" For tmux
" Plug 'edkolev/tmuxline.vim'

" For prompt
" Plug  'edkolev/promptline.vim'

" For navigating registers
Plug 'bfredl/nvim-miniyank'

" Close the currentent bufferer withoutut affecting other windowows
Plug 'moll/vim-bbye'

" easily search, substitute and abbreviate multiple version of words
Plug 'tpope/vim-abolish'

" Undo tree
Plug 'mbbill/undotree'

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

" http://vim.wikia.com/wiki/Move_to_next/previous_line_with_same_indentation
" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>

"-------------------Auto-Commands----------------------------

augroup autosourcing
	autocmd!
	"Automatically source the Vimrc(init) file on save.
	autocmd BufWritePost init.vim source %
augroup END

function! Autodirectory()
    if ( isdirectory(expand("%:p")))
        cd %:p:h
    endif
endfunction
autocmd VimEnter * silent! :call Autodirectory()<CR>

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

"Search in opened buffers
nmap <C-e> :Buffers<cr>

"-------------------NERDTree----------------------------
" Don't let NERDTree Hijack Dash
let NERDTreeHijackNetrw = 0

"Make it easier to toggle NERDTree
 nmap <C-\> :NERDTreeToggle<cr>

"-------------------NERDCommenter----------------------------
let g:NERDSpaceDelims = 4
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle gv
" https://stackoverflow.com/a/2630579/2936504
imap <C-_> <C-o><plug>NERDCommenterToggle

"-------------------greplace----------------------------
" Instruct greplace to use ag
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"-------------------php-cs-fixer----------------------------
" Change the maping for beautifying a file
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"PHP Fixer level
let g:php_cs_fixer_level = "psr2"

"-------------------vim-gitgutter----------------------------
" Don't set up any key shortcuts yet
let g:gitgutter_map_keys = 0

"-------------------ale----------------------------
" Some optimizations
" let g:ale_lint_delay = 4000

" nnoremap <silent> <leader><F8> :ALEToggleBuffer<cr>
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Show the errors in a Vim window
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=1
let g:ale_list_window_size = 5
let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['php'] = ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['vim'] = ['remove_trailing_lines', 'trim_whitespace']
" let g:ale_fixers['notes'] = ['remove_trailing_lines', 'trim_whitespace']
" let g:ale_fixers['markdown'] = ['remove_trailing_lines', 'trim_whitespace']
" let g:ale_fixers['notes.markdown'] = ['remove_trailing_lines', 'trim_whitespace']
" let g:ale_fixers['go'] = ['gofmt', 'goimports']
" let g:ale_fixers['json'] = ['fixjson', 'prettier']
let g:ale_fix_on_save = 1

"-------------------php-namespace----------------------------

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

"-------------------pdv----------------------------

let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <leader>m :call pdv#DocumentWithSnip()<CR>

"-------------------ultisnip----------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"-------------------vim-over----------------------------
nnoremap <leader>f :OverCommandLine<CR>%s/
vnoremap <leader>f :OverCommandLine<CR>%s/<C-R>"/

"-------------------COC----------------------------
" Required for operations modifying multiple buffers like rename.
set hidden
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <silent> <leader>gr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Using CocList
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')
"-------------------ncm2----------------------------
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=noinsert,menuone,noselect
set completeopt=menuone
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
" inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
" au User Ncm2Plugin call ncm2#register_source({
        " \ 'name' : 'css',
        " \ 'priority': 9,
        " \ 'subscope_enable': 1,
        " \ 'scope': ['css','scss'],
        " \ 'mark': 'css',
        " \ 'word_pattern': '[\w\-]+',
        " \ 'complete_pattern': ':\s*',
        " \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        " \ })

let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
