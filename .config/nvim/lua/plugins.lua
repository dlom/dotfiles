return require("packer").startup(function()
	use "wbthomason/packer.nvim"

	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				context_commentstring = {
					enable = true
				}
			}
		end
	}

	use {
		"nvim-telescope/telescope.nvim",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
			}
		end
	}

	use "romgrk/nvim-treesitter-context"

	use "b3nj5m1n/kommentary"

	use "JoosepAlviste/nvim-ts-context-commentstring"

	use "neovim/nvim-lspconfig"

	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
				plugins = {
					spelling = {
						enabled = true,
						suggestions = 20,
					},
				},
			}
		end
	}
end)
