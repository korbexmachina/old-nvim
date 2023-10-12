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
	{
		'jbyuki/nabla.nvim',
		keys = {
			{ '<leader>nv', ':lua require"nabla".toggle_virt()<cr>', 'toggle equations' },
			{ '<leader>p', ':lua require"nabla".popup()<cr>', 'hover equation' },
		}
	},

	-- TODO Comments
	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	},

	-- GitHub Copilot
	{
		"github/copilot.vim",
		lazy = false
	}
}
