" vim: foldmethod=marker

" PLUGINS: {{{

call plug#begin()

	" COLORSCHEMES: {{{

	Plug 'metalelf0/base16-black-metal-scheme'
	Plug 'arcticicestudio/nord-vim'
	Plug 'notpratheek/vim-sol'
	Plug 'nanotech/jellybeans.vim'
	Plug 'fxn/vim-monochrome'
	Plug 'whatyouhide/vim-gotham'
	" }}}
	" GIT: {{{

	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	" }}}
	" COMPLETION LINTING COMPILING: {{{

	Plug 'davidhalter/jedi-vim'
	Plug 'jsfaint/gen_tags.vim'
	Plug 'tenfyzhong/CompleteParameter.vim'
	Plug 'roxma/nvim-completion-manager'
	Plug 'roxma/ncm-clang'
	Plug 'Shougo/neoinclude.vim'
	Plug 'Valodim/vim-zsh-completion'
	Plug 'majutsushi/tagbar'
	Plug 'vim-syntastic/syntastic'
	Plug 'jmcantrell/vim-virtualenv'
	" }}}
	" SNIPPETS: {{{

	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	" }}}
	" FORMATTING: {{{

	Plug 'dhruvasagar/vim-table-mode'
	Plug 'godlygeek/tabular'
	" }}}
	" SYNTAX: {{{

	Plug 'keith/tmux.vim'
	Plug 'PProvost/vim-ps1'
	Plug 'rodjek/vim-puppet'
	Plug 'momota/cisco.vim'
	Plug 'arakashic/chromatica.nvim'
	" }}}
	" PROJECT MANAGEMENT: {{{

	Plug 'airblade/vim-rooter'
	Plug 'mhinz/vim-startify'
	Plug 'tpope/vim-obsession'
	" }}}
	" INTERFACE: {{{

	Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'lilydjwg/colorizer'
	Plug 'tpope/vim-vinegar'
	" }}}
	" MOVING: {{{

	Plug 'tpope/vim-eunuch'
	Plug 'tpope/vim-surround'
	Plug 'wellle/targets.vim'
	" }}}

call plug#end()

" }}}
" SETTINGS: {{{
" PYTHON: {{{

let PYTHON_VIRTUAL_ENV=$VIRTUAL_ENV

augroup python_files
	autocmd!
	autocmd FileType python setlocal expandtab
	autocmd FileType python set tabstop=4
	autocmd FileType python set shiftwidth=4
	autocmd FileType python set softtabstop=4
	if exists("PYTHON_VIRTUAL_ENV")
		autocmd FileType python set makeprg=PYTHON_VIRTUAL_ENV/bin/pylint\ --output-format=parseable\ --reports=n\ --init-import=y\ %
	else
		autocmd FileType python set makeprg=pylint3\ --output-format=parseable\ --reports=n\ --init-import=y\ %
	endif
augroup END
" }}}
" SHELL: {{{

augroup shell_files
	autocmd!
	autocmd FileType bash set omnifunc=zsh_completion#Complete
	autocmd FileType sh set omnifunc=zsh_completion#Complete
	autocmd FileType sh setlocal iskeyword+=$
augroup END
" }}}
" C: {{{

augroup c_files
	autocmd!
	autocmd FileType c set cscopetag
	autocmd FileType c set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
	autocmd FileType c GenGTAGS
	autocmd FileType c ChromaticaStart
augroup END
" }}}
" CPP: {{{

augroup cpp_files
	autocmd!
	autocmd FileType cpp set cscopetag
	autocmd FileType cpp set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
	autocmd FileType cpp GenGTAGS
	autocmd FileType cpp ChromaticaStart
augroup END
" }}}
" PUPPET: {{{

" fix puppet files syntax highlighting
augroup puppet_files
	autocmd!
	autocmd BufEnter *.pp :syntax sync fromstart
augroup END
" }}}

filetype plugin indent on

set formatoptions+=jqlcro
set wildignore+=tags
set colorcolumn=80
set background=dark
set clipboard=unnamed
set complete=.,w,b,u,U,i,d,t
set completeopt=longest,menuone,preview,noinsert,noselect
set cursorline
set fillchars+=vert:│,fold:-
set foldmethod=indent
set helplang=pl
set hidden
set hlsearch
set inccommand=split
set laststatus=2
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
set dir=~/.cache/nvim/
set virtualedit=insert,block

" showcmd and ruler may slow nvim down
set noshowcmd
set noruler

" show sign column
augroup sign_column
	autocmd!
	autocmd BufEnter * sign define dummy
	autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END

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
map <F4> :make<CR>

let mapleader=" "
nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>w :Windows<CR>
nmap <Leader>h :History<CR>
nmap <Leader>m :Marks<CR>
nmap <Leader>c :BCommits<CR>
nmap <Leader>[ :tabp<CR>
nmap <Leader>] :tabn<CR>

" disable highlighting after search
nmap <silent> <C-c> :nohlsearch<CR>

" toggle relative mode
nmap <silent> <Leader>r :set relativenumber!<CR>

" search for current word with vimgrep. noautocmd makes the search faster
nmap <Leader>v :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" brackets autoexpansion
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

" check highlight group under cursor
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
set statusline+=\ [%{virtualenv#statusline()}]
set statusline+=\ [%{ObsessionStatus()}]
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
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = ""
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = ""
let g:virtualenv_auto_activate = 1
" }}}
" TABLEMODE: {{{

let g:table_mode_corner='|'
" }}}
" }}}

colorscheme jellybeans
