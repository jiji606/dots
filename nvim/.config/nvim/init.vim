" vim: foldmethod=marker

" PLUGINS: {{{

call plug#begin()
	Plug 'airblade/vim-gitgutter'
	Plug 'airblade/vim-rooter'
	Plug 'arcticicestudio/nord-vim'
	Plug 'chriskempson/base16-vim'
	Plug 'davidhalter/jedi-vim'
	Plug 'dhruvasagar/vim-table-mode'
	Plug 'godlygeek/tabular'
	Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'keith/tmux.vim'
	Plug 'KeyboardFire/vim-minisnip'
	Plug 'lilydjwg/colorizer'
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'majutsushi/tagbar'
	Plug 'nanotech/jellybeans.vim'
	Plug 'notpratheek/vim-sol'
	Plug 'rodjek/vim-puppet'
	Plug 'tpope/vim-eunuch'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-vinegar'
	Plug 'wellle/targets.vim'
	Plug 'whatyouhide/vim-gotham'
	Plug 'zchee/deoplete-jedi'
call plug#end()

" }}}
" SETTINGS: {{{
" PYTHON: {{{

augroup python_files
autocmd!
autocmd FileType python setlocal expandtab
autocmd FileType python set tabstop=4
autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4
autocmd FileType python set makeprg=pylint\ --output-format=parseable\ --reports=n\ --init-import=y\ %
autocmd FileType python set efm
augroup END

" }}}

filetype plugin indent on

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set background=dark
set clipboard=unnamed
set completeopt=longest,menuone,noinsert,noselect
set cursorline
set fillchars+=vert:│,fold:―
set foldmethod=indent
set helplang=pl
set hidden
set hlsearch
set inccommand=split
set laststatus=0
set linebreak
set linespace=2
set list
set listchars=tab:\│\ ,trail:¬,extends:>,precedes:<,nbsp:+
set modeline
set modelines=5
set mouse=a
set noexpandtab
set number
set numberwidth=5
set omnifunc=syntaxcomplete#Complete
set path+=**
set scrolloff=10
set shiftwidth=4
set showtabline=2
set syntax=on
syn sync fromstart
set tabstop=4
set termencoding=utf-8
set termguicolors
set tildeop
set undodir=~/.config/nvim/undodir
set undofile
set virtualedit=insert,block

" show sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
" fix puppet files syntax highlighting
autocmd BufEnter *.pp :syntax sync fromstart

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" }}}
" KEYMAPS: {{{

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
map Y y$
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nmap <C-Right> : bnext!<cr>
nmap <C-Left> : bprev!<cr>
nmap <silent> <Up> : wincmd k<cr>
nmap <silent> <Down> : wincmd j<cr>
nmap <silent> <Right> : wincmd l<cr>
nmap <silent> <Left> : wincmd h<cr>
nmap <silent> <s-right> : tabn<cr>
nmap <silent> <s-left> : tabn<cr>
tnoremap <Esc> <C-\><C-n>
xnoremap > >gv
xnoremap < <gv

let mapleader=" "
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>w :Windows<CR>
nmap <Leader>h :History<CR>
nmap <Leader>c :BCommits<CR>
nmap <Leader>[ :tabp<CR>
nmap <Leader>] :tabn<CR>

"check highlight group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" }}}
" STATUSLINE: {{{
" HELPERS: {{{

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0? ''.l:branchname.'':''
endfunction

" }}}
" STATUS: {{{

set statusline=
set statusline+=\ [%{StatuslineGit()}]
set statusline+=\ %t       "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file<Paste>

" }}}
" }}}
" PLUGIN SETTINGS: {{{
" MINISNIP: {{{

let g:minisnip_dir = $HOME . '/.config/nvim/minisnip'
let g:minisnip_trigger = '<C-S>'

" }}}
" FZFSETTINGS: {{{

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" }}}
" GITGUTTER: {{{

set updatetime=250
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '≃'
let g:gitgutter_sign_modified_removed = '≅'
let g:gitgutter_highlight_lines = 0

" }}}
" JELLYBEANS: {{{

let g:jellybeans_overrides = { 'background': { 'guibg': '101010' }, }

" }}}
" JEDI: {{{
let g:jedi#use_splits_not_buffers = "bottom"
let g:jedi#show_call_signatures = "2"
let g:jedi#completions_enabled = 0
" deoplete jedi
let g:deoplete#sources#jedi#show_docstring = "1"
" }}}
" TABLEMODE: {{{
let g:table_mode_corner='|'
" }}}
" }}}

colorscheme jellybeans
