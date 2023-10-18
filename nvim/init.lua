vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
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

  --undotree 
  'mbbill/undotree',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    --below 2 lines are new
    event = { 'BufReadPre', 'BufNewFile' },
    autostart = 'true',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
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
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },

  {
    'sainnhe/gruvbox-material',
      config = function()
        vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        --theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

-- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
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



--MY KEYBINDS 

vim.o.nu = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/Desktop/code/undodir"
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



--vim.keymap.set('n', '<leader>w', ':wincmd w<CR>', {desc = ''})
--vim.keymap.set('n', '<leader>d', '<Esc>', {desc = ''})

vim.keymap.set("n", "H", "B") --segment jumps
vim.keymap.set('n', 'L', 'W') --segment jumps
vim.keymap.set("n", "n", "nzzzv") --keeps next in the middle of the page
vim.keymap.set("n", "N", "Nzzzv") --keeps next in the middgle of the page 
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', '<S-Tab>', '<<', { noremap = true, silent = true }) --shift tab works
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) --move highlighted lines 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) --move highlighted lines 
vim.keymap.set('n', 'ff', '<C-w>w', { noremap = true, silent = true }) --into/out of undotree
vim.keymap.set("n", "J", "<C-d>zz", { noremap = true, silent = true }) --half page jumps
vim.keymap.set('n', 'K', '<C-u>zz', { noremap = true, silent = true }) --half page jumps

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {desc = 'yank to clipboard'})
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex) --exit to umbrella directory
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = '[U]ndoTree' }) --toggle undotree
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = 'yank to clipboard'})
vim.keymap.set("n", "<leader>p", '"+p', { desc = 'paste from clipboard' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'make executable'})
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').oldfiles, { desc = '[ ] Recent Files' })
vim.keymap.set("n", "<leader>si", [[/<C-r><C-w>]], {desc = '[S]earch [I]nstance'})
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = '[S]earch [R]eplace'})
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch [G]rep' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').grep_string, { desc = '[S]earch [S]tring' })
vim.keymap.set('n', '<leader>sb', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[S]earch [B]uffer' })

vim.keymap.set('n', '<leader>ga', ':G add ',{ desc = '[G]it [A]dd' })
vim.keymap.set('n', '<leader>gc', ":G commit -m  ",{ desc = '[G]it [C]ommit' })
vim.keymap.set('n', '<leader>gp', ':G push ',{ desc = '[G]it [P]ush' })
vim.keymap.set('n', '<leader>gl', ':G log ',{ desc = '[G]it [L]og' })
vim.keymap.set('n', '<leader>gs', ':G status',{ desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gh', ':G checkout',{ desc = '[G]it c[H]eckout'})

--add maps for split window navigation

require('which-key').register {
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
}

-- [[ Sets these keymaps after buffer attaches ]]
--local on_attach = function()
--  vim.keymap.set('n', '<leader>sd', require('telescope.builtin').lsp_definitions, {desc = '[S]earch [D]efinition'})
--  vim.keymap.set('n', '<leader>sr', '<cmd>Telescope lsp_references', {desc = '[S]earch [R]eferences'})
--end



-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    previewer = false,
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


-- [[ Configure Treesitter ]]
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript',
    'typescript', 'vimdoc', 'vim', 'bash' },
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  }
end, 0)


--[[ Configure Lsp ]]
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed={
    'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx',
    'javascript','typescript', 'vimdoc', 'vim', 'bash'
  }
})

local lspconfig = require('lspconfig')

local servers = {

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

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
