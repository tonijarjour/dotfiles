return require('packer').startup(function(use)
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
end)
