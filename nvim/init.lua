--Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Preferences
vim.o.backup = false
vim.o.breakindent = true
vim.o.completeopt = 'menuone,noselect'
vim.o.expandtab = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.mouse = 'a'
vim.o.nu = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftwidth = 2
vim.o.showcmd = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.timeoutlen = 300
vim.o.title = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.wildignorecase = true
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'
vim.o.wrap = false
vim.wo.number = true
vim.wo.signcolumn = 'yes'
vim.o.syntax = 'on' --for vimwiki
vim.o.filetype = 'on' --for vimwiki
vim.o.filetypeplugin = 'on' --for vimwiki

--Keybind Removals below
vim.keymap.set('n', '<C-h>', '<Nop>', {silent = true})
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({'n', 'v'}, 'C-j', '<Nop>', {silent = true})
vim.keymap.set({'n', 'v'}, 'C-k', '<Nop>', {silent = true})
vim.keymap.set({'n', 'v'}, 'U', '<Nop>', {silent = true})
vim.keymap.set({'n', 'v'}, 's', '<Nop>', {silent = true})
vim.keymap.set({'n', 'v'}, 'ss', '<Nop>', {silent = true})
vim.keymap.set({'n', 't'}, '<C-w>[', '<Nop>', {silent = true})
vim.keymap.set({'n', 't'}, '<C-w>]', '<Nop>', {silent = true})

--STANDARD NAV KEYBINDS 
vim.keymap.set('n', '<C-h>', 'vaBozz0', {noremap = true, silent = true}) --visually selects an entire function/class
vim.keymap.set("n", "<C-d>", "<C-d>zz", {noremap = true, silent = true}) --keeps half page jumps centered 
vim.keymap.set("n", "<C-u>", "<C-u>zz", {noremap = true, silent = true})  --keeps half page jumps centered
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = '[Y]ank to clipboard'}) --yank to clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = '[p] paste from clipboard' }) --paste from clipboard
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'make e[x]ecutable'}) --make executable
vim.keymap.set("n", "N", "Nzzzv", {noremap = true, silent = true}) --keeps next in the middgle of the page 
vim.keymap.set("n", "n", "nzzzv", {noremap = true, silent = true}) --keeps next in the middle of the page
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) --move highlighted lines 
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) --move highlighted lines 
vim.keymap.set("v", "<leader>y", [["+y]], {desc = '[y]ank to clipboard'}) --yank highlighted items to clipboard
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true }) --faster escapes
vim.keymap.set('n', '*', '*zzz', { noremap = true, silent = true }) -- keeps word search in middle of page
vim.keymap.set('n', '<Tab>f', '<C-w>_<C-w>|', { noremap = true }) --fullsize. ctr-w = to equalize
vim.keymap.set('n', '<leader>B', ':bd<CR>', {desc = 'delete [B]uffer'})
vim.keymap.set('n', '<leader>N', ':enew<CR>', {desc = '[N]ew buffer'})
vim.keymap.set('n', '<leader>a', ':%y"+<CR>', {desc = 'copy [a]ll to sys clipboard'})
vim.keymap.set('n', '<leader>b', ':buffers<CR>', {desc = '[b]uffers'})
vim.keymap.set('n', '<leader>e', ':Ex<CR>', {desc = '[e]xplore current directory'})
vim.keymap.set('n', '<leader>h', ':cd %:p:h<CR>:pwd<CR>', {desc = 'cd [h]ere'})
vim.keymap.set('n', '<leader>n', ':bn<CR>', {desc = '[n]ext buffer'})
vim.keymap.set('n', '<leader>o', 'q:', {desc = '[o]ld commands'})
vim.keymap.set('n', '<leader>t', ':cd %:p:h<CR>:pwd<CR>:term<CR>a', {desc = '[t]erminal'})
vim.keymap.set('n', '<leader>c', ':! g++ -g -std=c++14 -o %:r %<CR>', {desc = 'c++ compiler'})
vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true }) --redo mapped to U
vim.keymap.set('n', '<Tab>', '<C-w>', { noremap = true }) --enables window management by tab
vim.keymap.set('t', '<Tab>', '<C-\\><C-n><C-w>', { noremap = true }) -- enables window managemennt in vim terminal
vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true }) -- enables window managemennt in vim terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true }) --easier terminal escapes
vim.keymap.set('t', 'jj', '<C-\\><C-n>', { noremap = true }) --easier terminal escapes
vim.keymap.set({"n", 'v'}, "x", '"_x', {noremap = true, silent = true}) -- using x deletes into abyss register, no character swaps but able to delete & retain yank register
vim.keymap.set({'n', 't'}, '<Tab>[', '<C-w>20<', { noremap = true }) --resizing panes
vim.keymap.set({'n', 't'}, '<Tab>]', '<C-w>20>', { noremap = true }) --resizing panes
vim.keymap.set('c', '<C-j>', '<C-n>', { noremap = true, silent = true }) --scroll command suggestions
vim.keymap.set('c', '<C-k>', '<C-p>', { noremap = true, silent = true }) --scroll command suggestions

--Setting up terminal nav for vim splits
vim.cmd[[
  autocmd BufEnter * if &buftype == 'terminal' | setlocal bufhidden= nobuflisted nolist nonumber norelativenumber | startinsert | endif
  autocmd BufLeave * if &buftype == 'terminal' | setlocal bufhidden= | endif
]]

--plugin based remaps
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { desc = '[u]ndotree', noremap = true, silent = true }) --toggle undotree
vim.keymap.set('n', '<leader>m', ':Mason<CR>', { desc = '[m]ason plugin manager'})
vim.keymap.set('n', '<leader>l', ':Lazy check<CR>', { desc = '[l]azy package manager'})
vim.g["sneak#label"] = true --label mode for vim-sneak


-- Package Manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  --MY ADDITIONS---------------------------------
  -- Undotree
  'mbbill/undotree',

  --Editing enclosing characters
  'tpope/vim-surround',

  --show vim marks, set bookmarks (marks with 0-9), access via '
  'chentoast/marks.nvim',

  --preview substitutions
  'markonm/traces.vim',

  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  {
    --fzf integration into vim for larger searches
    'junegunn/fzf',
    'junegunn/fzf.vim',
    vim.keymap.set('n', 'sc', ':Commands<CR>' ,{ desc = '[s]earch [f]iles' }),
    vim.keymap.set('n', 'sf', ':Files<CR>' ,{ desc = '[s]earch [f]iles' }),
    vim.keymap.set('n', 'sg', ':RG<CR>' ,{ desc = '[s]earch [g]rep' }),
    vim.keymap.set('n', 'so', ':History<CR>' ,{ desc = '[s]earch old [f]iles' }),
  },

  'tpope/vim-repeat',

  {
  'justinmk/vim-sneak',
    --two character searches
    vim.keymap.set('n', 'f', '<Plug>Sneak_s', { noremap = true }),
    vim.keymap.set('n', 'F', '<Plug>Sneak_S', { noremap = true }),
    --one character searches are 'til mode
    -- vim.keymap.set('n', 't', '<Plug>Sneak_t', { noremap = true }),
    -- vim.keymap.set('n', 'T', '<Plug>Sneak_T', { noremap = true }),
  },

  {
    --Copilot, needs setup for first time on new machine
    'github/copilot.vim',
    vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-word)'),
    vim.keymap.set('n', '<leader>Cd', ':Copilot disable<CR>', {desc = 'copilot [d]isable'}),
    vim.keymap.set('n', '<leader>Ce', ':Copilot enable<CR>', {desc = 'copilot [e]nable'}),
    vim.keymap.set('n', '<leader>Cs', ':Copilot setup<CR>', {desc = 'copilot [s]etup'}),
  },

  -- DAP
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      { "mfussenegger/nvim-dap" },
      { "mfussenegger/nvim-dap-python" },
      { "jay-babu/mason-nvim-dap.nvim" },
      { "williamboman/mason.nvim" },
    },
  },

  --Notetaking
  {
  'vimwiki/vimwiki',
    vim.keymap.set('n', '<Tab>n', '<Plug>VimwikiNextLink', {silent = true}), -- doesn't override nvim tab config
    path = '~/Documents/vimwiki/',
    filetypes = {'markdown'},
    syntax = 'markdown',
    ext = '.md',
  },


  --DEFAULTS-----------------------------------
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    -- LSP Configuration 
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {
          --put your most used langagues below
          ensure_installed = {
            'lua-language-server',
            'clangd',
            'clang-format',
            'marksman',
            'pyright',
          }
        }
      },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '/' },
      },
      on_attach = function(bufnr)
        vim.keymap.set({'n', 'v'}, 'gl', '<Nop>', {silent = true}) --unmaps
        vim.keymap.set({'n', 'v'}, 'gn', '<Nop>', {silent = true}) --unmaps

        vim.keymap.set('n', 'ghp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[g]it [h]unk [p]review' })
        vim.keymap.set({ 'n', 'v' }, 'ghs', require("gitsigns").stage_hunk, {buffer = bufnr, desc = '[g]it [h]unk [s]tage' })
        vim.keymap.set({ 'n', 'v' }, 'ghr', require("gitsigns").reset_hunk, {buffer = bufnr, desc = '[g]it [h]unk [r]eset' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, 'gn', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = '[g]it [n]ext hunk' })
        vim.keymap.set({ 'n', 'v' }, 'gl', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = '[g]it [l]ast hunk' })
      end,
    },
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = {{'filename', path = 2}},
        lualine_x = {'branch', 'diff', 'diagnostics'},
        lualine_y = {'filetype'},
        lualine_z = {'location'}
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },

  -- keybind comments, gcc for lines gb for blocks (visual mode helps)
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },


}, {})


--MY CONFIGS----------------------------------
require('marks').setup {}

--fugitive keybinds for git
vim.keymap.set('n', '<leader>gs', ':Git<CR><C-w>H<C-w>60<', { desc = '[g]it [s]tatus' })
vim.keymap.set('n', '<leader>gB', ':GBrowse<CR>', { desc = '[g]it [B]rowser' })
vim.keymap.set('n', '<leader>gb', ':Git branch ', { desc = '[g]it [b]ranch [s]witch' })
vim.keymap.set('n', '<leader>gS', ':Git stash ', { desc = '[g]it [S]tash' })
vim.keymap.set('n', '<leader>gl', ':Git log<CR><C-w>H<C-w>20<', { desc = '[g]it [l]og' })
vim.keymap.set('n', '<leader>gd', ':Gvdiff ', { desc = '[g]it [d]iff (hash/branch needed)'})
vim.keymap.set('n', '<leader>gk', ':G checkout ', { desc = '[g]it chec[k]out' })
vim.keymap.set('n', '<leader>ga', ':Gwrite<CR>', { desc = '[g]it [a]dd file' })
vim.keymap.set('n', '<leader>gR', ':Gread<CR>', { desc = '[g]it [R]eset file' })
vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { desc = '[g]it [p]ush' })
vim.keymap.set('n', '<leader>gcm', ":Git commit -m '", { desc = '[g]it [c]ommit [m]essage' })
vim.keymap.set('n', '<leader>gcs', ":Git commit -m 'standard commit message'<CR>", { desc = '[g]it [c]ommit [s]tandard' })
vim.keymap.set('n', '<leader>gro', ':Git rebase origin/main<CR>', { desc = '[g]it [r]ebase [o]rigin/main' })
vim.keymap.set('n', '<leader>grr', ':Git rebase ', { desc = '[g]it [r]ebase ' })
vim.keymap.set('n', '<leader>gfo', ':Git fetch origin<CR>', { desc = '[g]it [f]etch [o]rigin' })
vim.keymap.set('n', '<leader>gff', ':Git fetch ', { desc = '[g]it [f]etch' })


--prefix labels
require('which-key').register {
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>gc'] = { name = '[c]ommit', _ = 'which_key_ignore' },
  ['<leader>gr'] = { name = '[r]ebase', _ = 'which_key_ignore' },
  ['<leader>gf'] = { name = '[f]etch', _ = 'which_key_ignore' },
  ['gh'] = { name = '[h]unk', _ = 'which_key_ignore' },
  ['s'] = { name = '[s]earch', _ = 'which_key_ignore' },
  ['<leader>C'] = { name = '[C]opilot', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[w]iki', _ = 'which_key_ignore' },
}

--DEFAULT CONFIGS----------------------------------
-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
require('telescope').setup {
  defaults = {},
}


-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

--putting the telescope keymaps after telescope configures
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').oldfiles, { desc = '[ ] recent files' })
vim.keymap.set('n', 'si', require('telescope.builtin').git_files , { desc = '[s]earch g[i]t Files' })
vim.keymap.set('n', 'sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })
vim.keymap.set({'n', 'v'}, 'sr', require('telescope.builtin').lsp_references, { desc = '[s]earch [r]eferences'})
vim.keymap.set('n', 'sb', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[s]earch [b]uffer' })
vim.keymap.set('n', 'sC', require('telescope.builtin').git_bcommits, { desc = '[s]earch [C]ommits' })
vim.keymap.set('n', 'sk', require('telescope.builtin').keymaps, { desc = '[s]earch [k]eymaps' })
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[g]o to [d]efinition'})
vim.keymap.set('n', 'ss', require('telescope.builtin').lsp_document_symbols, { desc = '[s]earch [s]ymbols'})
vim.keymap.set('n', 'sm', require('telescope.builtin').marks, { desc = '[s]earch [m]arks'})
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'open [d]iagnostic message' })

-- [[ Configure Treesitter ]]
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    modules = {},
    sync_install = false,
    ignore_install = {},
  }
end, 0)

-- [[ Configure LSP ]]
require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  vim.keymap.set("n", "cd", vim.lsp.buf.rename, {desc = '[c]hange lsp [d]efinition', noremap = true, silent = true}),
  vim.keymap.set("n", "<leader>H", vim.lsp.buf.hover , {desc = '[H]over definition', noremap = true, silent = true}),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false, --doesn't mess with your indents when nothings selected
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
