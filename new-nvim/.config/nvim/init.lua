vim.mapleader = ' '
vim.loader.enable()

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

plugins = {
    { 'loctvl842/monokai-pro.nvim' },
    { 'mg979/vim-visual-multi' },
    {
        "hrsh7th/nvim-cmp",
        name = "cmp",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        event = { "LspAttach", "InsertCharPre" },
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = vim.opt.sessionoptions:get() },
        -- stylua: ignore
        keys = {
            { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
        },
    },
    { "nvim-lua/plenary.nvim", lazy = true },    -- library used by other plugins
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {
        "windwp/nvim-ts-autotag",
        opts = {},
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- { 'echasnovski/mini.completion', version = false },
    { 'echasnovski/mini.align', version = false },
    { 'echasnovski/mini.pairs', version = false },
    { 'echasnovski/mini.surround', version = false },
    { 'echasnovski/mini.tabline', version = false },
    {
        'nvim-treesitter/nvim-treesitter',
        buid = {
            "TSUpdate"
        }
    },
    'folke/trouble.nvim', -- LSP Diagnostics in a split
    'folke/tokyonight.nvim',
    'rebelot/kanagawa.nvim',
    'neovim/nvim-lspconfig',
    'wbthomason/packer.nvim',
    -- 'airblade/vim-gitgutter',
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            on_attach = function(bufnr)
                local gitsigns = require 'gitsigns'

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal { ']c', bang = true }
                    else
                        gitsigns.nav_hunk 'next'
                    end
                end, { desc = 'Jump to next git [c]hange' })

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal { '[c', bang = true }
                    else
                        gitsigns.nav_hunk 'prev'
                    end
                end, { desc = 'Jump to previous git [c]hange' })

                -- Actions
                -- visual mode
                map('v', '<leader>hs', function()
                    gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end, { desc = 'stage git hunk' })
                map('v', '<leader>hr', function()
                    gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
                end, { desc = 'reset git hunk' })
                -- normal mode
                map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
                map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
                map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
                map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
                map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
                map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
                map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
                map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
                map('n', '<leader>hD', function()
                    gitsigns.diffthis '@'
                end, { desc = 'git [D]iff against last commit' })
                -- Toggles
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
                map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
            end,
        },
    },
    'rodjek/vim-puppet',
    'momota/cisco.vim',
    'lilydjwg/colorizer',
    'romainl/vim-qlist',
    'wellle/targets.vim',
    'joereynolds/vim-minisnip',
    'dhruvasagar/vim-table-mode',
    'nightsense/shoji',
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            scope = {
                show_start = true,
                show_end = false,
            },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        },
        main = "ibl",
    },
    'majutsushi/tagbar',
    'RRethy/vim-illuminate',
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    'tpope/vim-obsession',
    'fatih/vim-go',
    'romainl/vim-qf',
    'NLKNguyen/papercolor-theme',
    'andreypopp/vim-colors-plain',
    'zainin/vim-mikrotik',
    'junegunn/fzf',
    'nvim-lua/plenary.nvim',
    'projekt0n/github-nvim-theme',
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-tree.lua',
    'bluz71/vim-moonfly-colors',
    'rockerBOO/boo-colorscheme-nvim',
    'rktjmp/lush.nvim',
    'mcchrish/zenbones.nvim',
    'ayu-theme/ayu-vim',
    'morhetz/gruvbox',
    'lambdalisue/vim-suda',
}

require("lazy").setup(plugins, opts)
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '120'
vim.opt.complete = { '.', 'w', 'b', 'u', 'U', 'kspell', 'i', 'd', 't' }
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.cursorline = true
USER = os.getenv("USER")
SWAPDIR = "/home/" .. USER .. "/.cache/nvim/swap"
UNDODIR = "/home/" .. USER .. "/.cache/nvim/undo"
vim.opt.dir = SWAPDIR
vim.opt.undodir = UNDODIR
vim.opt.undofile = true
vim.opt.fillchars = { vert = '│', fold = '-', eob = '\\' }
vim.opt.foldmethod = 'indent'
vim.opt.foldlevelstart = 20
vim.opt.formatoptions:append('crqnbl1j')
vim.opt.hlsearch = true
vim.opt.inccommand = 'split'
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = { tab = '│ ', trail = '¬', extends = '…', precedes = '<', nbsp = '+' }
vim.opt.modeline = true
vim.opt.mouse = 'a'
vim.opt.expandtab = true
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.numberwidth = 5
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.spelllang = { 'en_us', 'pl' }
vim.opt.tabstop = 4
-- vim.opt.termguicolors = true
vim.opt.tildeop = true
vim.opt.virtualedit = { 'insert', 'block' }
vim.opt.report = 0
vim.opt.cpo:append('$')
vim.opt.splitright = true
vim.opt.splitbelow = false
vim.opt.linebreak = true
vim.opt.shortmess:append('c')
vim.opt.sessionoptions:remove('localoptions')
vim.opt.showtabline = 2
vim.opt.signcolumn = 'yes'
vim.opt.wrap = false
vim.opt.showmode = false

vim.cmd 'syntax sync fromstart'

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
    pattern = '[^l]*',
    nested = true,
    command = 'cwindow'
})

vim.api.nvim_create_autocmd('QuickFixCmdPost', {
    pattern = 'l*',
    nested = true,
    command = 'lwindow'
})

vim.api.nvim_create_augroup('terminal', { clear = true })

vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    group = 'terminal',
    pattern = '*',
    command = 'set nonumber'
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'WinEnter' }, {
    group = 'terminal',
    pattern = 'term://*',
    command = 'startinsert'
})

vim.api.nvim_create_autocmd('BufLeave', {
    group = 'terminal',
    pattern = 'term://*',
    command = 'stopinsert'
})

local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
    callback = function()
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
        if ok and stats and (stats.size > 1000000) then
            vim.b.large_buf = true
            vim.cmd("syntax off")
            vim.cmd("IlluminatePauseBuf") -- disable vim-illuminate
            vim.cmd("IndentBlanklineDisable") -- disable indent-blankline.nvim
            vim.opt_local.foldmethod = "manual"
            vim.opt_local.spell = false
        else
            vim.b.large_buf = false
        end
    end,
    group = aug,
    pattern = "*",
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'sh',
    callback = function()
        vim.lsp.start({
            name = 'bash-language-server',
            cmd = { 'bash-language-server', 'start' },
        })
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'terraform',
    callback = function()
        vim.opt.commentstring = "# %s"
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
        vim.opt.formatprg = "terraform fmt"
        vim.opt.equalprg = "terraform fmt"
    end,
})



-- function StatuslineMode() --
--   local mode = vim.fn.mode()
--   if mode == 'n' then
--     vim.api.nvim_command('highlight User2 guibg=#505050')
--     return "NORMAL"
--   elseif mode == 'v' then
--     vim.api.nvim_command('highlight User2 guibg=#775050')
--     return "VISUAL"
--   elseif mode == 'i' then
--     vim.api.nvim_command('highlight User2 guibg=#507750')
--     return "INSERT"
--   elseif mode == 'R' then
--     vim.api.nvim_command('highlight User2 guibg=#507777')
--     return "REPLACE"
--   elseif mode == 's' then
--     return "SELECT"
--   elseif mode == 't' then
--     vim.api.nvim_command('highlight User2 guibg=#775077')
--     return "TERMINAL"
--   elseif mode == 'c' then
--     return "COMMAND"
--   elseif mode == '!' then
--     return "SHELL"
--   elseif mode == '<C-V>' then
--     vim.api.nvim_command('highlight User2 guibg=#505077')
--     return "VISUAL BLOCK"
--   end
-- end

--- function GetTailCWD()
--   return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
-- end

-- vim.opt.statusline = ''
-- vim.opt.statusline:append('%2*%{StatuslineMode()}%1*%3*%(%{GetTailCWD()}%)/%f%h%m%r%y%=%c,%l/%L')

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Normal mode mappings

map('n', 'Y', 'y$', { noremap = true })
map('n', 'Q', '@q', { noremap = true })
map('n', 'gf', ':vsplit <cfile><CR>', { noremap = true })
map('n', 'j', 'gj', { noremap = true })
map('n', 'k', 'gk', { noremap = true })
map('n', 'gj', 'j', { noremap = true })
map('n', 'gk', 'k', { noremap = true })
map('n', '<S-Tab>', ':b#<CR>', opts)
map('n', '<F4>', ':silent make<CR>', { noremap = true })
map('n', '<C-c>', ':nohlsearch<CR>', opts)

-- Visual mode mappings
map('v', '>', '>gv', { noremap = true })
map('v', '<', '<gv', { noremap = true })
-- map('v', '*', [[:<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>]], { noremap = true })
-- map('v', '#', [[:<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>]], { noremap = true })
map('v', 'if', [[:<C-U>silent!normal![zjV]zk<CR>]], { noremap = true })
map('v', 'af', [[:<C-U>silent!normal![zV]z<CR>]], { noremap = true })

-- Operator-pending mode mappings
map('o', 'if', ':normal Vif<CR>', { noremap = true })
map('o', 'af', ':normal Vaf<CR>', { noremap = true })

-- Leader key mappings
vim.g.mapleader = ' '
map('n', '<Leader>[', ':tabp<CR>', opts)
map('n', '<Leader>]', ':tabn<CR>', opts)
map('n', '<Leader>b', ':ls<CR>:b ', opts)
map('n', '<Leader>w', ':tabs<CR>:Tab ', opts)
map('n', '<Leader>y', '"+', { noremap = true })
map('n', '<Leader>d', '"_d', { noremap = true })
map('n', '<Leader>s', [[:s/\(<c-r>=expand("<cword>")<CR>\)//g<Left><Left>]], { noremap = true })
map('n', '<Leader>e', ':Neotree<CR>', opts)
map('n', '<Leader>f', ':Files<CR>', opts)
map('n', '<Leader>g', ':DiffviewOpen<CR>', opts)
map('n', '<Leader>r', ':set relativenumber!<CR>', opts)
map('n', '<Leader>l', ':GitGutterLineHighlightsToggle<CR>', opts)
map('n', '<Leader>o', ':grep TODO -I -r .<CR><CR>', opts)

-- Normal mode window navigation
map('n', '<A-h>', ':wincmd h<CR>', opts)
map('n', '<A-j>', ':wincmd j<CR>', opts)
map('n', '<A-k>', ':wincmd k<CR>', opts)
map('n', '<A-l>', ':wincmd l<CR>', opts)

-- Terminal mode window navigation
map('t', '<A-h>', '<C-\\><C-n>:wincmd h<CR>', opts)
map('t', '<A-j>', '<C-\\><C-n>:wincmd j<CR>', opts)
map('t', '<A-k>', '<C-\\><C-n>:wincmd k<CR>', opts)
map('t', '<A-l>', '<C-\\><C-n>:wincmd l<CR>', opts)

-- Tab navigation in normal mode
map('n', '<A-1>', ':Tab 1<CR>', opts)
map('n', '<A-2>', ':Tab 2<CR>', opts)
map('n', '<A-3>', ':Tab 3<CR>', opts)
map('n', '<A-4>', ':Tab 4<CR>', opts)
map('n', '<A-5>', ':Tab 5<CR>', opts)
map('n', '<A-6>', ':Tab 6<CR>', opts)
map('n', '<A-7>', ':Tab 7<CR>', opts)
map('n', '<A-8>', ':Tab 8<CR>', opts)
map('n', '<A-9>', ':Tab 9<CR>', opts)

-- Tab navigation in terminal mode
map('t', '<A-1>', '<C-\\><C-n>:Tab 1<CR>', opts)
map('t', '<A-2>', '<C-\\><C-n>:Tab 2<CR>', opts)
map('t', '<A-3>', '<C-\\><C-n>:Tab 3<CR>', opts)
map('t', '<A-4>', '<C-\\><C-n>:Tab 4<CR>', opts)
map('t', '<A-5>', '<C-\\><C-n>:Tab 5<CR>', opts)
map('t', '<A-6>', '<C-\\><C-n>:Tab 6<CR>', opts)
map('t', '<A-7>', '<C-\\><C-n>:Tab 7<CR>', opts)
map('t', '<A-8>', '<C-\\><C-n>:Tab 8<CR>', opts)
map('t', '<A-9>', '<C-\\><C-n>:Tab 9<CR>', opts)

-- -- Insert mode mappings
-- map('i', '(<CR>', '(<CR>)<Esc>O', { noremap = true })
-- map('i', '{<CR>', '{<CR>}<Esc>O', { noremap = true })
-- map('i', '{;', '{<CR>};<Esc>O', { noremap = true })
-- map('i', '{,', '{<CR>},<Esc>O', { noremap = true })
-- map('i', '[<CR>', '[<CR>]<Esc>O', { noremap = true })
-- map('i', '[;', '[<CR>];<Esc>O', { noremap = true })
-- map('i', '[,', '[<CR>],<Esc>O', { noremap = true })
-- map('i', "''", "''<Esc>ha", { noremap = true })
-- map('i', '""', '""<Esc>ha', { noremap = true })
-- map('i', '((', '()<Esc>ha', { noremap = true })
-- map('i', '[[', '[]<Esc>ha', { noremap = true })
-- map('i', '{{', '{}<Esc>ha', { noremap = true })
-- map('i', '<<', '<><Esc>ha', { noremap = true })


require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
        "c",
        "lua",
        "luap",
        "toml",
        "jsonc",
        "diff",
        "regex",
        "printf",
        "markdown",
        "markdown_inline",
        "luadoc",
        "jsdoc",
        "vim",
        "vimdoc",
        "query",
        "json",
        "yaml",
        "javascript",
        "python",
        "ruby",
        "typescript",
        "go",
        "gomod",
        "gotmpl",
        "git_config",
        "gitcommit",
        "gitignore",
        "bash",
        "terraform",
        "hcl",
        "puppet",
        "xml",
        "sxhkdrc",
        "sql",
        "ssh_config",
        "passwd",
        "perl",
        "json5",
        "jsonnet",
        "http",
        "html",
        "css",
        "helm",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (or "all")
    -- ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    indent = {
        enable = true,
    },

    folding = {
        enable = true,
    },

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

require'lspconfig'.bashls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.terraformls.setup{}

-- require'lspconfig'.luals.setup{}
-- require'lspconfig'.vimls.setup{}


require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
    },
})

-- vim.cmd 'colorscheme kanagawa'

require('mini.align').setup()
-- require('mini.completion').setup({
--   lsp_completion = {
--     source_func = 'omnifunc',
--   }
-- })
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.tabline').setup()
require('lualine').setup {
    options = {
        theme = 'monokai-pro',
        icons_enabled = false,
        section_separators = '',
        component_separators = '',
    },
}

require('ibl').setup()

local cmp = require "cmp"
local luasnip = require "luasnip"

local icons = {}

icons.layout = {
    list = "•",
    tab = "→",
    wrap = "↪",
    installed = "✓",
    pending = "➜",
    uninstalled = "✗",
}

icons.diagnostics = {
    message = "󱏚 ",
    hint = "󱐮 ",
    error = "✘",
    info = "◉",
    warn = "",
}

icons.widget = {
    active = "",
    command = "",
    config = "",
    event = "",
    filetype = "",
    import = "",
    inactive = "",
    keymap = "",
    lazy = "",
    nesting = "",
    plugin = "",
    runtime = "",
    source = "",
    start = "",
    task = "",
    telescope = "",
}

icons.kind = {
    Array = "",
    Boolean = "",
    Class = "",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = " ",
    Folder = "",
    Function = "󰆧",
    Interface = "",
    Key = "",
    Keyword = "",
    Method = "",
    Module = "",
    Namespace = "",
    Null = "",
    Number = "",
    Object = "",
    Operator = "",
    Package = "",
    Property = "",
    Reference = "",
    Snippet = "",
    String = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
}

cmp.setup {
    snippet = {
        expand = function(opts)
            luasnip.lsp_expand(opts.body)
        end,
    },
    experimental = {
        ghost_text = true,
    },
    window = {
        completion = {
            scrolloff = vim.go.scrolloff,
            border = "rounded",
        },
        documentation = {
            border = "rounded",
        },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, item)
            local kind = item.kind
            item.kind = icons.kind[kind]
            item.menu = kind:gsub("(%l)(%u)", "%1 %2"):lower()

            return item
        end,
    },
    sources = {
        { name = "path", max_item_count = 20 },
        {
            name = "nvim_lsp",
            max_item_count = 80,
        },
        {
            name = "buffer",
            max_item_count = 20,
            option = {
                get_bufnrs = function()
                    return vim.tbl_map(function(win)
                        return vim.api.nvim_win_get_buf(win)
                    end, vim.api.nvim_list_wins())
                end,
            },
        },
    },
    mapping = {
        ["<c-space>"] = cmp.mapping(function()
            if not cmp.visible() then
                cmp.complete()
            end
            cmp.abort()
        end, { "i", "s" }),
        ["<c-y>"] = cmp.mapping(function(fallback)
            if not cmp.visible() then
                fallback()
            end
            cmp.scroll_docs(-1)
        end, { "i", "s" }),
        ["<c-e>"] = cmp.mapping(function(fallback)
            if not cmp.visible() then
                fallback()
            end
            cmp.scroll_docs(1)
        end, { "i", "s" }),
        ["<c-p>"] = cmp.mapping(function(fallback)
            if not cmp.visible() then
                fallback()
            end
            cmp.select_prev_item()
        end, { "i", "s" }),
        ["<c-n>"] = cmp.mapping(function(fallback)
            if not cmp.visible() then
                fallback()
            end
            cmp.select_next_item()
        end, { "i", "s" }),
        ["<cr>"] = cmp.mapping(function(fallback)
            if cmp.get_selected_entry() == nil then
                fallback()
            end
            cmp.confirm()
        end, { "i", "s" }),
        ["<s-tab>"] = cmp.mapping(function(fallback)
            if not luasnip.jumpable(-1) then
                fallback()
            end
            luasnip.jump(-1)
        end, { "i", "s" }),
        ["<tab>"] = cmp.mapping(function(fallback)
            if not luasnip.jumpable(1) then
                fallback()
            end
            luasnip.jump(1)
        end, { "i", "s" }),
    },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').clangd.setup {
    capabilities = capabilities
}

require("monokai-pro").setup({
    transparent_background = false,
    terminal_colors = true,
    devicons = true, -- highlight the icons of `nvim-web-devicons`
    styles = {
        comment = { italic = true },
        keyword = { italic = true }, -- any other keyword
        type = { italic = true }, -- (preferred) int, long, char, etc
        storageclass = { italic = true }, -- static, register, volatile, etc
        structure = { italic = true }, -- struct, union, enum, etc
        parameter = { italic = true }, -- parameter pass in function
        annotation = { italic = true },
        tag_attribute = { italic = true }, -- attribute of tag in reactjs
    },
    filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
    -- Enable this will disable filter option
    day_night = {
        enable = false, -- turn off by default
        day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
    },
    inc_search = "background", -- underline | background
    background_clear = {
        -- "float_win",
        "toggleterm",
        "telescope",
        -- "which-key",
        "renamer",
        "notify",
        -- "nvim-tree",
        -- "neo-tree",
        -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
    },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
    plugins = {
        bufferline = {
            underline_selected = false,
            underline_visible = false,
        },
        indent_blankline = {
            context_highlight = "default", -- default | pro
            context_start_underline = false,
        },

    },
})

vim.cmd 'MonokaiPro classic'
vim.cmd 'colorscheme monokai-pro'


