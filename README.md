# dots


## My setup

Using [Gnu Stow](https://www.gnu.org/software/stow/) to manage dotfiles.

---

### desktop

+ **window manager** - pretty heavily patched version of dwm which you can find [here](https://github.com/jiji606/dwm)  
+ **notification daemon** - [dunst](https://dunst-project.org)  
+ **network management** - NetworkManager used with nmcli command (zsh autocompletion makes it pretty easy)  
+ **password management** - keepassxc wich has builtin keepasshttp daemon for integration with firefox  
+ **web browser** - firefox-nightly with vimium and qutebrowser  
+ **shell** - zsh with grml config - lightweight and easy to use  
+ **launcher** - rofi  

---

### neovim

I like to keep my vim config simple but it still has grown quite a lot.  
Plugins used:

+ [vim-gitgutter *by* airblade](https://github.com/airblade/vim-gitgutter) - shows git line changes in gutter  
+ [vim-rooter *by* airblade](https://github.com/airblade/vim-rooter) - change the working directory to project root  
+ [nord-vim *by* arcticicestudio](https://github.com/arcticicestudio/nord-vim)  
+ [base16-vim *by* chriskempson](https://github.com/chriskempson/base16-vim)  
+ [jedi-vim *by* davidhalter](https://github.com/davidhalter/jedi-vim) - for python programming  
+ [tabular *by* godlygeek](https://github.com/godlygeek/tabular) - great plugin to alignment  
+ [fzf *by* junegunn](https://github.com/junegunn/fzf) - awesome fuzzy search plugin  
+ [fzf.vim *by* junegunn](https://github.com/junegunn/fzf.vim)  
+ [tmux.vim *by* keith](https://github.com/keith/tmux.vim) - syntax highlighting for tmux files  
+ [vim-minisnip *by* KeyboardFire](https://github.com/KeyboardFire/vim-minisnip) - simple snippet manager  
+ [colorizer *by* lilydjwg](https://github.com/lilydjwg/colorizer) - colorize text  
+ [vim-gutentags *by* ludovicchabant](https://github.com/ludovicchabant/vim-gutentags) - tags management  
+ [tagbar *by* majutsushi](https://github.com/majutsushi/tagbar) - show tags in a sidebar  
+ [jellybeans.vim *by* nanotech](https://github.com/nanotech/jellybeans.vim)  
+ [vim-sol *by* notpratheek](https://github.com/notpratheek/vim-sol)  
+ [vim-puppet *by* rodjek](https://github.com/rodjek/vim-puppet) - puppet files handling  
+ [vim-eunuch *by* tpope](https://github.com/tpope/vim-eunuch) - UNIX helper commands  
+ [vim-fugitive *by* tpope](https://github.com/tpope/vim-fugitive) - git wrapper  
+ [vim-surround *by* tpope](https://github.com/tpope/vim-surround) - nice mappings  
+ [vim-vinegar *by* tpope](https://github.com/tpope/vim-vinegar) - better file browser  
+ [targets.vim *by* wellle](https://github.com/wellle/targets.vim) - additional text objects  
+ [vim-gotham *by* whatyouhide](https://github.com/whatyouhide/vim-gotham)  
+ [deoplete-jedi *by* zchee](https://github.com/zchee/deoplete-jedi) - python completion  

Config is pretty easy to understand and is divided in sensible sections.
I am not using any heavy statusline plugins as I find them to be overkill.
Weird parts in the config are commented, rest should be pretty self-explanatory.

#### nice settings

+ `set listchars=tab:\│\ ,trail:¬,extends:>,precedes:<,nbsp:+` - show indentlines in vim  
+ `set inccommand=split` - show realtime changes with substitute commands - neovim only  
+ `set virtualedit=inser,block` - allows you to position the cursor where there is no actual character  
+ `tnoremap <Esc> <C-\><C-n>` - Lets you exit from neovim terminal with ESC - neovim only  

---

### tmux

I use a prefix-less tmux config.
Splitting and moving between panes is done with the alt modifier.

+ `alt+w` - new window  
+ `alt+n` - move to the n-th window  
+ `alt+q` - kill current window  
+ `alt+{h,j,k,l}` - move between panes {left,down,up,right}  
+ `alt+shift+{h,j,k,l}` - resize current pane {left,down,up,right}  
+ `alt+m` - maximize current pane  
+ `alt+v` - split window vertically  
+ `alt+h` - split window horizontally  

### konsole

I am using konsole mostly because of ligature support and hassle-free config (both gui and config file).
It mostly just works and that's great.

I start konsole with `/usr/bin/tmux new-session -t konsolesession; new-window` as the starting shell making it automatically connect to the current tmux session and open new window in it.
This way all my opened terminals are connected to the same session.
With agressive resize turned off tmux windows are not automatically resized when viewed from different terminals.
