" vim: foldmethod=marker

execute pathogen#infect()

" SETTINGS: {{{
" PYTHON: {{{

let PYTHON_VIRTUAL_ENV=$VIRTUAL_ENV

augroup python_files
	autocmd!
	autocmd FileType python setlocal expandtab
	autocmd FileType python setlocal tabstop=4
	autocmd FileType python setlocal shiftwidth=4
	autocmd FileType python setlocal softtabstop=4
	if exists("PYTHON_VIRTUAL_ENV")
		autocmd FileType python setlocal makeprg=PYTHON_VIRTUAL_ENV/bin/pylint\ --output-format=parseable\ --reports=n\ --init-import=y\ %
	else
		autocmd FileType python setlocal makeprg=pylint3\ --output-format=parseable\ --reports=n\ --init-import=y\ %
	endif
augroup END
" }}}
" SHELL: {{{

augroup shell_files
	autocmd!
	autocmd FileType sh setlocal iskeyword+=$
	autocmd FileType sh setlocal makeprg=shellcheck\ --color=never\ --format=gcc\ %
augroup END
" }}}
" C: {{{

augroup c_files
	autocmd!
	autocmd FileType c setlocal cscopeprg=gtags-cscope
	autocmd FileType c cscope add GTAGS
	autocmd FileType c setlocal cscopetag
	autocmd FileType c setlocal cscopequickfix=s-,c-,d-,i-,t-,e-,a-
	autocmd FileType c GenGTAGS
	autocmd FileType c setlocal equalprg=astyle\ -A2\ --indent=force-tab=8\ -C\ -xG\ -S\ -Y\ -m0\ -f\ -H\ -U\ -xe\ -E\ -j\ -xL\ -q\ --lineend=linux
augroup END
" }}}
" CPP: {{{

augroup cpp_files
	autocmd!
	autocmd FileType cpp setlocal cscopetag
	autocmd FileType cpp setlocal cscopequickfix=s-,c-,d-,i-,t-,e-,a-
	autocmd FileType cpp GenGTAGS
	autocmd FileType cpp setlocal equalprg=astyle\ -A2\ --indent=force-tab=8\ -C\ -xG\ -S\ -Y\ -m0\ -f\ -H\ -U\ -xe\ -E\ -j\ -xL\ -q\ --lineend=linux
augroup END
" }}}
" PUPPET: {{{

" fix puppet files syntax highlighting
augroup puppet_files
	autocmd!
	autocmd FileType puppet :syntax sync fromstart
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
set mouse=
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
set backspace=indent,eol,start
set spelllang=en_us,pl

" showcmd and ruler may slow nvim down
set noshowcmd
set noruler

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
tnoremap <Esc> <C-\><C-n>
xnoremap > >gv
xnoremap < <gv
map <F4> :silent make<CR>
nmap <silent> <C-c> :nohlsearch<CR>

let mapleader=" "

nmap <Leader>wh :wincmd h<cr>
nmap <Leader>wj :wincmd j<cr>
nmap <Leader>wk :wincmd k<cr>
nmap <Leader>wl :wincmd l<cr>
nmap <Leader>[ :tabp<CR>
nmap <Leader>] :tabn<CR>

nmap <Leader>b :ls<CR>:b

nmap <Leader>y "+
nmap <Leader>d "_

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
" ERRORMARKER: {{{

let errormarker_errortext = "E "
let errormarker_warningtext = "W "
" }}}
" MINISNIP: {{{

let g:minisnip_dir = $HOME . '/.config/nvim/minisnip'
let g:minisnip_trigger = '<C-S>'
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
" TAGBAR: {{{

let g:tagbar_compact = 1
let g:tagbar_show_visibility = 1
let g:tagbar_singleclick = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autoshowtag = 1
" }}}
" }}}

colorscheme typo
