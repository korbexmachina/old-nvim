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

		vim.keymap.set("n", "<C-o>", vim.cmd.Oil, { desc = 'Oil' })
	},

	-- LSP
	{
		'williamboman/mason-lspconfig.nvim'
	}, -- Optional

	-- Git
	{
		'tpope/vim-fugitive',

		vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
	},

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
		'mbbill/undotree',

		vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = '[U]ndotree' })
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
		setup = function() require('toggleterm').setup {} end,

		vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
	},

	-- Debugging
	{
		'mfussenegger/nvim-dap',
		{
			'rcarriga/nvim-dap-ui',
			requires = { 'mfussenegger/nvim-dap' }
		},
		'theHamsta/nvim-dap-virtual-text'
	},

	-- Notifications
	{
		'rcarriga/nvim-notify',
		config = function()
			vim.notify = require("notify").setup {
				background_colour = "#0e0e0e",
				top_down = false,
			}
		end
	},

	-- gen.nvim
	{
		'David-Kunz/gen.nvim',
		opts = {
			model = "mixtral:instruct", -- The default model to use.
		},
		vim.keymap.set('v', '<leader>]', ':Gen<CR>'),
		vim.keymap.set('n', '<leader>]', ':Gen<CR>')
	},

	-- NUI
	{
		'MunifTanjim/nui.nvim',
	},

	-- Tabular
	-- {
	-- 	'godlygeek/tabular',
	-- 	lazy = true,
	-- 	ft = { 'md', 'markdown' }
	-- },

	-- Markdown
	-- {
	-- 	'preservim/vim-markdown',
	-- 	lazy = true,
	-- 	ft = { 'md', 'markdown' },
	-- },

	-- File manager integration
	{
		'is0n/fm-nvim',

		-- File manager keybinds
		vim.keymap.set('n', '<leader>x', ':Xplr<CR>', { desc = '[X]plr' }),
		vim.keymap.set('n', '<leader>tw', ':TaskWarriorTUI<CR>', { desc = '[T]ask [W]arrior' }),
		vim.keymap.set('n', '<leader>lg', ':Lazygit<CR>', { desc = '[L]azy[G]it' }),
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

	-- Neoformat
	{
		'sbdchd/neoformat',

		-- Run neoformat on web files
		prettier = {
			config = function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		}
	},

	-- Pencil
	{
		'preservim/vim-pencil',
	},

	-- Gleam
	{
		'gleam-lang/gleam.vim',
	},

	-- AsciiDoc
	{
		'habamax/vim-asciidoctor',
	}
}
