return require('packer').startup(function()
    use 'folke/tokyonight.nvim'
    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'
    use {'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}}
    use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'glepnir/dashboard-nvim'
end)
