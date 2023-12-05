-- Plugins using default options

return {
	-- Tmux integration
	{
		'christoomey/vim-tmux-navigator',
		lazy = false,
	},

	-- Directory manager
	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		setup = function() require("oil").setup() {} end,
	},

	-- Git
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',

	-- Tabstop & shiftwidth
	'tpope/vim-sleuth',

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},

	-- GitHub Copilot
	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
				expr = true,
				replace_keycodes = false
			})
			vim.g.copilot_no_tab_map = true
		end
	},

	-- Keybinds
	{
		'folke/which-key.nvim',
		opts = {}
	},

	-- Comment lines with gcc
	{
		'numToStr/Comment.nvim',
		opts = {}
	},

	-- Undotree
	{
		'mbbill/undotree'
	},

	-- LaTeX
	-- {
		-- 'jbyuki/nabla.nvim',
		-- keys = {
		-- 	{ '<leader>nv', ':lua require"nabla".toggle_virt()<cr>', { desc = 'toggle equations' } },
		-- 	{ '<leader>p', ':lua require"nabla".popup()<cr>', { desc = 'hover equation' } },
		-- }
	-- },

	-- TODO Comments
	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	},

	-- Rust
	{
		'rust-lang/rust.vim',
	ft = { 'rust' },
		init = function()
			vim.g.rustfmt_autosave = 1
			vim.g.rustfmt_fail_silently = 1
		end
	},

	-- Completion and Snippets
	{
		'hrsh7th/nvim-cmp',

		-- LSP completion source:
		'hrsh7th/cmp-nvim-lsp',

		-- Useful completion sources:
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
		'hrsh7th/vim-vsnip',
	},

	-- Toggleterm
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = true,
		setup = function() require('toggleterm').setup{} end,
		vim.keymap.set('n', '<leader>t', ':Toggleterm direction=float<CR>')
	},

	-- Debugging
	{
		'mfussenegger/nvim-dap',
		{
			'rcarriga/nvim-dap-ui',
			requires = {'mfussenegger/nvim-dap'}
		},
		'theHamsta/nvim-dap-virtual-text'
	},

	-- Notifications
	{
		'rcarriga/nvim-notify',
		config = function ()
			vim.notify = require("notify").setup{
				background_colour = "#0e0e0e",
			}
		end
	},

	-- gen.nvim
	{
		'David-Kunz/gen.nvim',
		vim.keymap.set('v', '<leader>]', ':Gen<CR>'),
		vim.keymap.set('n', '<leader>]', ':Gen<CR>')
	},

	-- NUI
	{
		'MunifTanjim/nui.nvim',
	},
}
