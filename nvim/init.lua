--Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Preferences
vim.o.nu = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/Desktop/code/undodir" --set where you want undodir
vim.o.undofile = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.scrolloff = 8
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.wo.number = true
vim.o.smartindent = true
vim.o.smarttab = true
-- vim.o.autochdir = true
vim.o.showcmd = true
vim.o.title = true

--Keybind Removals below
--Keybind Sets will be at EOF
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v'}, 'C-k', '<Nop>', {silent = true})
vim.keymap.set({ 'n'}, 'K', '<Nop>', {silent = true})
vim.keymap.set({ 'n'}, 'H', '<Nop>', {silent = true})
vim.keymap.set({ 'n', 'v'}, 's', '<Nop>', {silent = true})
vim.keymap.set({ 'n', 'v'}, 'ss', '<Nop>', {silent = true})
vim.keymap.set({ 'n', 'v'}, 'gn', '<Nop>', {silent = true})
vim.keymap.set({ 'n', 'v'}, 'gl', '<Nop>', {silent = true})

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
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', 'gh', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[g]it [h]unk' })

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


  --My Additions
  -- Undotree
  'mbbill/undotree',

  --Editing enclosing characters
  --in visual mode use S then the enclosing character ' " { [ (
  --or use ys (motion like iw iW 5w t) t; etc) then enclosing character ' " { [ (
  'tpope/vim-surround',

  --show vim marks, set bookmarks (marks with 0-9), access via '
  'chentoast/marks.nvim',

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
  }

}, {})

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

-- [[ Configure Treesitter ]]
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
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

--Marks config for vim marks and bookmarks/psuedo harpoon
require'marks'.setup {
  default_mappings = true,
  builtin_marks = {},
  cyclic = true,
  force_write_shada = false,
  refresh_interval = 250,
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  excluded_filetypes = {},
  mappings = {}
}

--NAV KEYBINDS 
-- vim.keymap.set({'n', 'v'}, "H", "_", {noremap = true, silent = true}) --start of line
-- vim.keymap.set({'n', 'v'}, 'L', '$', {noremap = true, silent = true}) --end of line
vim.keymap.set({'n', 'v'}, "H", "7h", {noremap = true, silent = true}) --start of line
vim.keymap.set({'n', 'v'}, 'L', '7l', {noremap = true, silent = true}) --end of line
vim.keymap.set("n", "n", "nzzzv", {noremap = true, silent = true}) --keeps next in the middle of the page
vim.keymap.set("n", "N", "Nzzzv", {noremap = true, silent = true}) --keeps next in the middgle of the page 
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true }) --faster escapes
vim.keymap.set("n", "J", "<C-d>zz", { noremap = true, silent = true }) --half page jumps
vim.keymap.set('n', 'K', '<C-u>zz', { noremap = true, silent = true }) --half page jumps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) --move highlighted lines 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) --move highlighted lines 
vim.keymap.set('n', 'sh', '<C-w>h', { noremap = true, silent = true }) --nvim pane switches
vim.keymap.set('n', 'sj', '<C-w>j', { noremap = true, silent = true }) --nvim pane switches
vim.keymap.set('n', 'sk', '<C-w>k', { noremap = true, silent = true }) --nvim pane switches
vim.keymap.set('n', 'sl', '<C-w>l', { noremap = true, silent = true }) --nvim pane switches
vim.keymap.set('n', '<leader>m', ':Mason<CR>', { desc = '[m]ason plugin manager'})
vim.keymap.set('n', '<leader>l', ':Lazy check<CR>', { desc = '[l]azy package manager'})
vim.keymap.set("v", "<leader>y", [["+y]], {desc = '[y]ank to clipboard'})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = '[Y]ank to clipboard'})
vim.keymap.set("n", "<leader>p", '"+p', { desc = '[p] paste from clipboard' })
vim.keymap.set("n", "<leader>P", '"0p', { desc = '[P]aste from last yank' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'make e[x]ecutable'})
vim.keymap.set('n', '<leader>e', ':Ex<CR>', {desc = '[e]xplore current directory'}) --exit to umbrella directory
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { desc = '[u]ndotree', noremap = true, silent = true }) --toggle undotree
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'open [d]iagnostic message' })
vim.keymap.set('n', '<leader>q', ':!mdpdf -o %:r.pdf %<CR>', {desc = '[q] md to pdf converter'}) --requires 'pip install mdpdf'
vim.keymap.set('n', '<leader>w', ':term g++ -o %:r %<CR>', {desc = 'c++ compiler'}) --requires 'pip install mdpdf'
vim.keymap.set('n', '<leader>t', ':cd %:p:h<CR>:pwd<CR>:term<CR>a', {desc = '[t]erminal'}) --requires 'pip install mdpdf'
vim.keymap.set('n', 'szf', ':Files<CR>' ,{ desc = '[s]earch f[z]f [f]iles' })
vim.keymap.set('n', 'szg', ':RG<CR>' ,{ desc = '[s]earch f[z]f [g]rep' })
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').oldfiles, { desc = '[ ] recent files' })
vim.keymap.set('n', 'sf', require('telescope.builtin').find_files, { desc = '[s]earch [f]iles' })
vim.keymap.set('n', 'si', require('telescope.builtin').git_files , { desc = '[s]earch g[i]t Files' })
vim.keymap.set('n', 'sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })
vim.keymap.set('n', 'sg', require('telescope.builtin').live_grep, { desc = '[s]earch [g]rep' })
vim.keymap.set('n', 'sb', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[s]earch [b]uffer' })
vim.keymap.set('n', 'sc', require('telescope.builtin').git_bcommits, { desc = '[s]earch [c]ommits' })
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = '[g]o to [d]efinition'})
vim.keymap.set('n', 'sr', require('telescope.builtin').lsp_references, { desc = '[s]earch [r]eferences'})
vim.keymap.set('n', 'ss', require('telescope.builtin').lsp_document_symbols, { desc = '[s]earch [s]ymbols'})
vim.keymap.set('n', 'sm', require('telescope.builtin').marks, { desc = '[s]earch [m]arks'})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
