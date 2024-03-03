local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup({

-- Mason Registry Manager 
{ "williamboman/mason.nvim",
run = ":MasonUpdate" -- Update registry contents
},
{"neovim/nvim-lspconfig"},

-- lsp status
-- {"nvim-lua/lsp-status.nvim"},
{ "kyazdani42/nvim-web-devicons"},
{
  "NTBBloodbath/galaxyline.nvim",
  -- your statusline
  config = function()
    require("galaxyline.themes.eviline")
  end,
  -- some optional icons
  requires = { "kyazdani42/nvim-web-devicons", opt = true }
},

-- Alpha Menu
{
    "goolord/alpha-nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
},

-- nvim-cmp 
-- Full support for LSP completion with minimal dependancies
{"hrsh7th/cmp-nvim-lsp"},
{"hrsh7th/cmp-buffer"},
{"hrsh7th/cmp-path"},
{"hrsh7th/cmp-cmdline"},
{"hrsh7th/nvim-cmp"},

-- minimap
-- requires github.com/wfxr/code-minimap
{"wfxr/minimap.vim"},
{"rcarriga/nvim-notify"},
-- Calendar
{
    "aPeoplesCalendar/apc.nvim",
    dependencies = {
        "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    config = function ()
        require("apeoplescalendar").setup() -- configuration options are described below
    end,
},

-- nvim-web-devicons
{"nvim-tree/nvim-web-devicons"},

-- Tetris
{"alec-gibson/nvim-tetris"},

-- Cellular Automation
{
    "eandrju/cellular-automaton.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    }
},

})

-- Setup language servers.
local lspconfig = require('lspconfig')

-- Configure the C/C++/Objective-C language server
 lspconfig.clangd.setup{
 }

 lspconfig.cpptools.setup{
     settings= {
     	cmd = "~/.local/share/nvim/mason/packages/cpptools/extension/bin/cpptools"
     }
 }
-- setup hdl_checker
 lspconfig.hdl_checker.setup{}
-- setup mason
require("mason").setup()

-- setup minimap
-- setup cmp
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
   require('lspconfig')['clangd'].setup {
   capabilities = capabilities
   }

-- Source init.vim
vim.cmd('source ~/.config/nvim/classic.vim')
