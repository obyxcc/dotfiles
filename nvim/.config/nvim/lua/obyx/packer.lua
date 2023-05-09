-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  use { 'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use { 'nvim-treesitter/nvim-treesitter', run = { ':TSUpdate' } }

  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {'romgrk/barbar.nvim', requires = {
  'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
  'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  }}

  use { 'TimUntersberger/neogit', requires =
  'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim'
  }

  use { 'lewis6991/gitsigns.nvim' }

  use { 'tpope/vim-commentary' }

  use { "windwp/nvim-autopairs" }

  use { 'christoomey/vim-tmux-navigator' }

  use { 'norcalli/nvim-colorizer.lua' }

  use { 'lukas-reineke/indent-blankline.nvim' }

  use { 'vimwiki/vimwiki',
    config = function()
      local l = {}
      l.path = '$XDG_DATA_HOME/vimwiki'
      l.syntax = 'markdown'
      l.ext = '.md'
      vim.g.vimwiki_list = {
        l
      }
    end
  }

  use { "kylechui/nvim-surround" }

end)
