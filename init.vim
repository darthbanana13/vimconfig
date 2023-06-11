" Enable syntax highlighting
syntax enable

" Don't let vim work in legacy VI mode
set nocompatible

" Delete & Backspace keys can now delete indentation, EOL characters, and
" start of the line char
set backspace=indent,eol,start

" Enable mouse
set mouse=a

" Define leader key , instead of \
let mapleader=','

" Activate line numbers
" The old absolute way is boring, let's show hybrid line numbers
set number relativenumber
set nu rnu

" Let's set a toggle for line numbers: in insert mode use absolute, use hybrid everywhere else
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup 

" Automatically write the file when switching buffers.
set autowriteall

" Tabs and spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
" Use spaces instead of tabs
set expandtab

if has("persistent_undo")
    silent set undodir
    silent set undofile
endif

" Copy to system clipboard (+, not *)
" set clipboard=unnamedplus

" Map delete to black hole register
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

" Live preview of search/replace
set inccommand=split

" Do case insensitive search unless a add a capital letter to the search
set ignorecase
set smartcase

" Prevent the cursor going back one character when exiting from insert mode
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

" Move lines with Shift+Up/Down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" Set the updatetime for vim and plugins like git gutter
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Set default encoding
set encoding=utf-8
scriptencoding utf-8

" Press // to search for the highlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Set true color in (neo)vim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

" Remove all trailing whitespaces
nnoremap <Leader>t :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Set syntax highlighting for Jenkinsfile to Groovy
au BufNewFile,BufRead Jenkinsfile setf groovy
au BufNewFile,BufRead *.sql.j2 setf sql
au BufNewFile,BufRead *.service.j2 setf systemd

" spellcheck
" set spell
" set spelllang=en_us

"--------------------Terminal mode Config------------------------
" Map leaving the terminal to something more useful
:tnoremap <C-s> <C-\><C-n>

" Map changing splits to CTRL+h,j,k,l
" !!! WARNING !!! This means you can't use those CTRL+ characters in the terminal
:tnoremap <C-h> <C-\><C-N><C-w>h
:tnoremap <C-j> <C-\><C-N><C-w>j
:tnoremap <C-k> <C-\><C-N><C-w>k
:tnoremap <C-l> <C-\><C-N><C-w>l

"--------------------VIM Plug------------------------
" #VIM Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

" To not flag some spelling
" cSpell:ignore zanglg etdev tpope junegunn ggreer skwp honza arnaud scrooloose
" cSpell:ignore neoclide terryma bfredl bbye suda itchyny mbbill romainl iamcco
" cSpell:ignore mkdp mzlogin kassio Shougo christoomey maxbrunsfeld linenr m'gv
" cSpell:ignore noheading gofmt phpcbf goimports phpcs mygroup funcobj noinsert
" cSpell:ignore pyright

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin(stdpath('data') . '/plugged')

" Airline :)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Download our favorite theme
" Plug 'zanglg/nova.vim'
Plug 'NLKNguyen/papercolor-theme'

Plug 'etdev/vim-hexcolor', {'for': ['css', 'vim']}

"Best git wrapper form Vim
Plug 'tpope/vim-fugitive'

" Better file browsing
Plug 'tpope/vim-vinegar'
" Don't hide files in netrw
let g:netrw_list_hide=''
let g:netrw_altv=1

" Quickly find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"For the silver searcher plugin
Plug 'ggreer/the_silver_searcher'

"Snippets are separated from the engine. The following line adds them
Plug 'honza/vim-snippets'

"Delete/Change/Add surroundings
Plug 'tpope/vim-surround'

" Add an intellisense engine (and language server) to VIM
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language: PHP
let g:php_manual_online_search_shortcut = '<C-i>'

" Put wrong things in the gutter
Plug 'neomake/neomake'

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

" Navigate fast in the window
Plug 'easymotion/vim-easymotion'

" For navigating registers
Plug 'bfredl/nvim-miniyank'

" Close the current buffer without affecting other windows
Plug 'moll/vim-bbye'

" easily search, substitute and abbreviate multiple version of words
Plug 'tpope/vim-abolish'

" Until this is fixed: https://github.com/neovim/neovim/issues/1496#issuecomment-63695965
" This is a workaround for editing files as sudo
Plug 'lambdalisue/suda.vim' 
 
" underline the word under the cursor in the entire file
Plug 'itchyny/vim-cursorword'

" navigate camelCase & snake_case  easily and also select it
Plug 'chaoren/vim-wordmotion'

noremap <silent> <leader>w W
noremap <silent> <leader>b B
noremap <silent> <leader>e E
noremap <silent> g<leader>e gE
sunmap <leader>w
sunmap <leader>b
sunmap <leader>e
sunmap g<leader>e

onoremap <silent> i,w iW
xnoremap <silent> i,w iW
onoremap <silent> i,b iB
xnoremap <silent> i,b iB
onoremap <silent> i,e iE
xnoremap <silent> i,e iE

noremap <silent> W w
noremap <silent> B b
noremap <silent> E e
noremap <silent> gE ge
sunmap W
sunmap B
sunmap E
sunmap gE

onoremap <silent> iW iw
xnoremap <silent> iW iw
onoremap <silent> iB ib
xnoremap <silent> iB ib
onoremap <silent> iE ie
xnoremap <silent> iE ie

inoremap <silent> <C-Left> <S-Left>
inoremap <silent> <C-Right> <S-Right>

let g:wordmotion_mappings = {
\ 'w' : 'w',
\ 'b' : 'b',
\ 'e' : 'e',
\ 'ge' : 'ge',
\ 'aw' : 'aw',
\ 'iw' : 'iw',
\ '<C-R><C-W>' : '<C-R><C-w>'
\ }
let g:wordmotion_spaces = '_-.'

" Undo tree
Plug 'mbbill/undotree'
nnoremap <F7> :UndotreeToggle<cr>

" " smart search highlighting
" let g:CoolTotalMatches = 1
Plug 'romainl/vim-cool'

""" For markdown language """

" Check for spelling mistakes
" Plug 'preservim/vim-lexical', {'for': ['text', 'markdown', 'gitcommit']}
" let g:lexical#spelllang = ['en_us']

" Preview markdown files
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': ['markdown', 'vim-plug'] }
let g:mkdp_auto_close = 0
let g:mkdp_path_to_chrome = 'chromium-browser'

" For syntax highlighting and conversion
Plug 'vim-pandoc/vim-pandoc', {'for': ['markdown']}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': ['markdown']}

" Generate table of contents for markdown
Plug 'mzlogin/vim-markdown-toc', {'for': ['markdown']}

""" End markdown """

" Better use of terminal manipulation
Plug 'kassio/neoterm'

" Use VSCode way of debugging of languages
Plug 'puremourning/vimspector'
" Workarounds for neovim

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
"
let g:vimspector_enable_mappings = 'HUMAN'

" Display function signatures from completion
Plug 'Shougo/echodoc.vim'

" Auto set shift/tab with depending on the current open file
Plug 'tpope/vim-sleuth'

" Easily switch between vim and tmux splits
Plug 'christoomey/vim-tmux-navigator'

" Syntax highlight & more for Nginx
Plug 'chr4/nginx.vim'

" Emacs killring (yank ring) for VIM
Plug 'maxbrunsfeld/vim-yankstack'

" Initialize plugin system
call plug#end()

"--------------------AirLine Config------------------------
" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled = 1

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
" let g:nova_transparent = 1
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

" Actually apply the colorscheme
" colorscheme nova
set background=dark " Setting dark mode
colorscheme PaperColor
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
" let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=1
let g:ale_list_window_size = 5
let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['php'] = ['phpcbf', 'remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['vim'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['markdown'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['notes.markdown'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['go'] = ['gofmt', 'goimports']
let g:ale_fixers['json'] = ['fixjson', 'prettier']
" let g:ale_fix_on_save = 1
" let g:ale_php_phpcs_use_global = 1
let g:ale_php_phpcs_standard='.php_cs.dist'

"-------------------COC----------------------------
" Required for operations modifying multiple buffers like rename.
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-html', 'coc-sh', 'coc-markdownlint', 'coc-yaml', 'coc-tsserver', 'coc-pyright', 'coc-spell-checker']
set hidden
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for goto(s)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename) 
xmap <silent> gf  <Plug>(coc-format-selected)
nmap <silent> gf  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Using CocList
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
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

"-------------------neoterm----------------------------
let g:neoterm_autoscroll = 1

