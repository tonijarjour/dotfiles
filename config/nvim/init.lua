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

  {"goolord/alpha-nvim",
    config = function()
      local startify = require("alpha.themes.startify");
      startify.nvim_web_devicons.enabled = false
      require("alpha").setup(startify.config)
    end
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

  {"folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  {"windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  },

  {"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = { enable = true },
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "latex",
        "bash",
        "lua",
        "tsx",
        "typescript",
        "rust",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {"nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("toni-telescope-theme")
      require("toni-telescope-keymaps")
    end,
  },

  {"phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require"hop".setup { keys = "etovxqpdygfblzhckisuran" }
      vim.keymap.set({"n", "v"}, "F", "<cmd>HopWord<cr>", {})
    end
  }
})
