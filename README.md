# dots


## My setup

Using [Gnu Stow](https://www.gnu.org/software/stow/) to manage dotfiles.

---

### desktop

window manager - pretty heavily patched version of dwm which you can find [here](https://github.com/jiji606/dwm)  
notification daemon - [dunst](https://dunst-project.org)  
network management - NetworkManager used with nmcli command (zsh autocompletion makes it pretty easy)  
password management - keepassxc wich has builtin keepasshttp daemon for integration with firefox  
web browser - firefox-nightly with vimium and qutebrowser  
shell - zsh with grml config - lightweight and easy to use  
launcher - rofi  

---

### neovim

I like to keep my vim config simple but it still has grown quite a lot.  
Plugins used:

1. [vim-gitgutter *by* airblade](https://github.com/airblade/vim-gitgutter) - shows git line changes in gutter  
1. [vim-rooter *by* airblade](https://github.com/airblade/vim-rooter) - change the working directory to project root  
1. [nord-vim *by* arcticicestudio](https://github.com/arcticicestudio/nord-vim)  
1. [base16-vim *by* chriskempson](https://github.com/chriskempson/base16-vim)  
1. [jedi-vim *by* davidhalter](https://github.com/davidhalter/jedi-vim) - for python programming  
1. [tabular *by* godlygeek](https://github.com/godlygeek/tabular) - great plugin to alignment  
1. [fzf *by* junegunn](https://github.com/junegunn/fzf) - awesome fuzzy search plugin  
1. [fzf.vim *by* junegunn](https://github.com/junegunn/fzf.vim)  
1. [tmux.vim *by* keith](https://github.com/keith/tmux.vim) - syntax highlighting for tmux files  
1. [vim-minisnip *by* KeyboardFire](https://github.com/KeyboardFire/vim-minisnip) - simple snippet manager  
1. [colorizer *by* lilydjwg](https://github.com/lilydjwg/colorizer) - colorize text  
1. [vim-gutentags *by* ludovicchabant](https://github.com/ludovicchabant/vim-gutentags) - tags management  
1. [tagbar *by* majutsushi](https://github.com/majutsushi/tagbar) - show tags in a sidebar  
1. [jellybeans.vim *by* nanotech](https://github.com/nanotech/jellybeans.vim)  
1. [vim-sol *by* notpratheek](https://github.com/notpratheek/vim-sol)  
1. [vim-puppet *by* rodjek](https://github.com/rodjek/vim-puppet) - puppet files handling  
1. [vim-eunuch *by* tpope](https://github.com/tpope/vim-eunuch) - UNIX helper commands  
1. [vim-fugitive *by* tpope](https://github.com/tpope/vim-fugitive) - git wrapper  
1. [vim-surround *by* tpope](https://github.com/tpope/vim-surround) - nice mappings  
1. [vim-vinegar *by* tpope](https://github.com/tpope/vim-vinegar) - better file browser  
1. [targets.vim *by* wellle](https://github.com/wellle/targets.vim) - additional text objects  
1. [vim-gotham *by* whatyouhide](https://github.com/whatyouhide/vim-gotham)  
1. [deoplete-jedi *by* zchee](https://github.com/zchee/deoplete-jedi) - python completion  

Config is pretty easy to understand and is divided in sensible sections. I am not using any heavy statusline plugins as I find them to be overkill. Weird parts in the config are commented, rest should be pretty self-explanatory.

#### nice settings

+ `set listchars=tab:\│\ ,trail:¬,extends:>,precedes:<,nbsp:+` - show indentlines in vim  
+ `set inccommand=split` - show realtime changes with substitute commands - neovim only  
+ `set virtualedit=inser,block` - allows you to position the cursor where there is no actual character  
+ `tnoremap <Esc> <C-\><C-n>` - Lets you exit from neovim terminal with ESC - neovim only  

---

### konsole

I am using konsole mostly because of ligature support and hassle-free config (both gui and config file). It mostly just works and that's great.
