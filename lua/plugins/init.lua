local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local status_ok, _ = pcall(require, "packer")
if not status_ok then
  return
end

local packer_bootstrap = ensure_packer()

local packer = require('packer').startup({ function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "lewis6991/impatient.nvim" })
  use({ "psliwka/vim-smoothie" })
  use({ "nathom/filetype.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "rainbowhxch/accelerated-jk.nvim" })
  use({ "jdhao/better-escape.vim" })
  use({ "farmergreg/vim-lastplace" })
  use({ "christoomey/vim-system-copy" })
  use({ "tpope/vim-repeat" })
  use({
    "b0o/incline.nvim",
    config = function()
      require("incline").setup()
    end
  })

  -- Treesitter
  use({ "David-Kunz/markid" })
  use({ "andymass/vim-matchup" })
  use "kiyoon/treesitter-indent-object.nvim"
  use({
    'Wansmer/sibling-swap.nvim',
    requires = { 'nvim-treesitter' },
  })
  use({ "m-demare/hlargs.nvim" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

  -- Telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = 'make' })
  use({ "danielvolchek/tailiscope.nvim" })
  use({ "MaximilianLloyd/adjacent.nvim" })
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } }
  })

  -- Git
  use({ "almo7aya/openingh.nvim" })
  use({ "lewis6991/gitsigns.nvim" })

  -- Snippets
  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = "./snippets" })

      require("luasnip").filetype_extend("typescriptreact", { "ts" })
      require("luasnip").filetype_extend("typescript", { "ts" })
    end
  })
  use({ "neovim/nvim-lspconfig" })
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use({
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "williamboman/mason.nvim"
    }
  })

  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
  use({ "saadparwaiz1/cmp_luasnip" })

  use({ "RRethy/vim-illuminate" })
  use({ "j-hui/fidget.nvim" })
  use({ "windwp/nvim-ts-autotag" })

  -- Tests
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      'haydenmeade/neotest-jest',
    }
  }

  use({
    "utilyre/barbecue.nvim",
    branch = "dev", -- omit this if you only want stable updates
    requires = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "kyazdani42/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })

  use({
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  })

  -- Jumps
  use({ "ThePrimeagen/harpoon" })
  use({
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_keymaps()
    end
  })
  use({
    "ggandor/leap-spooky.nvim",
    config = function()
      require("leap-spooky").setup({
        paste_on_remote_yank = true,
      })
    end
  })

  -- Splits
  use({
    "mrjones2014/smart-splits.nvim",
    config = function()
      require('smart-splits').setup({
        resize_mode = {
          hooks = {
            on_leave = require('bufresize').register
          }
        }
      })

    end
  })
  use {
    "kwkarlwang/bufresize.nvim",
    config = function()
      require("bufresize").setup()
    end
  }

  use({
    "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup()
    end
  })
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  })
  use({
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        handlers = {
          gitsigns = true,
        },
        marks = {
          GitAdd = { color = "#266d6a" },
          GitChange = { color = "#536c9e" },
          GitDelete = { color = "#b2555b" },
        }
      })
    end
  })
  use({
    "chentoast/marks.nvim",
    config = function()
      require("marks").setup()
    end
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require('lualine').setup {}
    end
  })
  use({
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup({
        window = {
          width = 80,
          options = {
            number = true,
          }
        },
      })
    end
  })
  use({
    'Wansmer/treesj',
    requires = { 'nvim-treesitter' },
    config = function()
      require('treesj').setup()
    end,
  })
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  })
  use({
    "declancm/maximize.nvim",
    config = function()
      require("maximize").setup({
        default_keymaps = false
      })
    end
  })

  use {
  "nvim-telescope/telescope-frecency.nvim",
  config = function()
    require"telescope".load_extension("frecency")
  end,
  requires = {"kkharji/sqlite.lua"}
}
  use({ "ofirgall/cmp-lspkind-priority" })
  use({ "onsails/lspkind.nvim", config=function ()
    require("lspkind").setup()
  end })
  use({
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("diffview").setup({
        view = {
          default = {
            layout = "diff2_vertical",
          },
          merge_tool = {
            layout = "diff3_vertical",
            disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
          },
          file_history = {
            -- Config for changed files in file history views.
            layout = "diff2_vertical",
          },
        }
      })
    end
  })

  -- UI
  use({ "sam4llis/nvim-tundra" })
  use({ "EdenEast/nightfox.nvim" })
  use({ "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        on_highlights = function(hl, c)
          local prompt = "#2d3149"
          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
      })
    end })
  use({ "nyoom-engineering/oxocarbon.nvim" })
  use({ "pantharshit00/vim-prisma" })
  use { 'stevearc/dressing.nvim' }
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true
        }
      })
    end
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  })

  -- Buffers
  use({
    "kwkarlwang/bufjump.nvim",
    config = function()
      require("bufjump").setup({
        forward = "]j",
        backward = "[j",
        on_success = nil
      })
    end
  })
  use({ "p00f/nvim-ts-rainbow" })

  -- Quickfix
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }
  use { 'junegunn/fzf', run = function()
    vim.fn['fzf#install']()
  end
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  } })

require("plugins.configs.tundra")
require("plugins.configs.treesitter")
require("plugins.configs.telescope")
require("plugins.configs.lspconfig")
require("plugins.configs.snippets")
require("plugins.configs.neotest")
require("plugins.configs.gitsigns")

return packer
