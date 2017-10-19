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

" Copy to system clipboard (+, not *)
" set clipboard=unnamedplus

"Automatically write the file when switching buffers.
set autowriteall

"Autocomplete match current file, window, buffer, unclosed buffer
set complete=.,w,b,u

"Tabs and spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                       "Use spaces instead of tabs

"PHP Fixer level
let g:php_cs_fixer_level = "psr2"

"Map delete to black hole register
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
inoremap <Leader>pp <C-o>"+p

nnoremap <Leader>l "0p
vnoremap <Leader>l "0p
inoremap <Leader>ll <C-o>"0p

nnoremap <Leader>y "+y
vnoremap <Leader>y "+y

nnoremap <Leader>c "+d
vnoremap <Leader>c "+d

" Toggle to don't indent on paste
" set pastetoggle=<F2>

" To paste without explicitly turning paste mode on or off https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
" function! WrapForTmux(s)
  " if !exists('$TMUX')
    " return a:s
  " endif

  " let tmux_start = "\<Esc>Ptmux;"
  " let tmux_end = "\<Esc>\\"

  " return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
" endfunction

" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" function! XTermPasteBegin()
  " set pastetoggle=<Esc>[201~
  " set paste
  " return ""
" endfunction

" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

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

"Best git wrapper form Vim
Plug 'tpope/vim-fugitive'

" Better file browsing
Plug 'tpope/vim-vinegar'

" Right hand file browser
Plug 'scrooloose/nerdtree'

" Quickly find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'ctrlpvim/ctrlp.vim'

"For the silver searcher plugin
Plug 'ggreer/the_silver_searcher'

Plug 'skwp/greplace.vim'

" Ultisnips engine
Plug 'SirVer/ultisnips'

"Snippets are separated from the engine. The following line adds them
Plug 'honza/vim-snippets'

"Delete/Change/Add surroundings
Plug 'tpope/vim-surround'

"PHP CS Fixer
Plug 'stephpy/vim-php-cs-fixer'

"Moar PHPs!
Plug 'StanAngeloff/php.vim'

"Auto-add use statement
Plug 'arnaud-lb/vim-php-namespace'

"Tab completion
Plug 'ervandew/supertab'

"PHP CS Fixer
Plug 'stephpy/vim-php-cs-fixer'

"Sublime like multiple cursors
Plug 'terryma/vim-multiple-cursors'

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

"Search in opened buffers
nmap <C-e> :Buffers<cr>

"-------------------NERDTree----------------------------
" Don't let NERDTree Hijack Dash
let NERDTreeHijackNetrw = 0

"Make it easier to toggle NERDTree
" nmap <C-\> :NERDTreeToggle<cr>

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

"-------------------vim-gitgutter----------------------------
" Don't set up any key shortcuts yet
let g:gitgutter_map_keys = 0

"-------------------ale----------------------------
" Some optimizations
let g:ale_lint_delay = 4000

"-------------------vinegar----------------------------
" map - to something else so it does not interfere with fugitive
