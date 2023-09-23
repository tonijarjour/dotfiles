require("settings")
require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  {"catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },

  {"nvim-lualine/lualine.nvim",
    opts = {
      options = {
        icons_enabled = false,
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  {"akinsho/bufferline.nvim",
    opts = {
      options = {
        show_buffer_icons = false,
        show_buffer_close_icons  = false,
        show_close_icon  = false,
      },
    },
  },

  {"windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },

  {"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = { enable = true },
      ensure_installed = {
        "comment",
        "markdown",
        "markdown_inline",
        "latex",
        "bash",
        "lua",
        "html",
        "css",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "rust",
        "toml",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {"nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/cmp-vsnip'},
  {'hrsh7th/vim-vsnip'},
  {'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {},
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'buffer' },
        }),
      })
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },

  {"neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        underline = false,
      })
      local defaults = require('cmp_nvim_lsp').default_capabilities()
      require("lspconfig").rust_analyzer.setup {
        capabilities = defaults
      }
      require("lspconfig").tsserver.setup {
        cmd = { 'npx', 'typescript-language-server', '--stdio' },
        capabilities = defaults
      }
    end
  },

})
