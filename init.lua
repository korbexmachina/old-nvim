-- Korben Tompkin (korbexmachina)

-- Set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager (Lazy)
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
		{ import = 'plugins' },
	},
	{})

-- Awesome Remaps
vim.api.nvim_set_keymap("n", "<C-U>", "<C-U>zz<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-D>", "<C-D>zz<CR>", { noremap = true, silent = true })

-- [[ Options ]]
vim.opt.guifont = 'FiraCode Nerd Font Mono:h12'
vim.o.hlsearch = false
vim.o.relativenumber = true
vim.o.number = true
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

-- Treesitter folding
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
vim.opt.conceallevel = 2
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
	end,
})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sr', builtin.oldfiles, { desc = '[S]earch [R]ecent files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]ile' })
vim.keymap.set('n', '<leader>?', builtin.help_tags, { desc = '[?] Search Help' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>/', function()
	builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

-- Colors

local colors = require("catppuccin.palettes").get_palette()
local TelescopeColor = {
	TelescopeMatching = { fg = colors.flamingo, bg = 'none' },
	TelescopeSelection = { fg = colors.mauve, bg = 'none', bold = true },
	TelescopeNormal = { bg = 'none', fg = 'none' },

	TelescopePromptPrefix = { bg = 'none' },
	TelescopePromptNormal = { bg = 'none' },
	TelescopeResultsNormal = { bg = 'none' },
	TelescopePreviewNormal = { bg = 'none' },
	TelescopePromptBorder = { bg = 'none', fg = colors.pink },
	TelescopeResultsBorder = { bg = 'none', fg = colors.lavender },
	TelescopePreviewBorder = { bg = 'none', fg = colors.blue },
	TelescopePromptTitle = { bg = 'none', fg = 'none', italic = true },
	TelescopeResultsTitle = { fg = 'none', italic = true },
	TelescopePreviewTitle = { bg = 'none', fg = 'none', italic = true },
}

for hl, col in pairs(TelescopeColor) do
	vim.api.nvim_set_hl(0, hl, col)
end

-- Zen
vim.keymap.set("n", "<leader>z", vim.cmd.ZenMode, { desc = '[Z]en Mode' })

-- Pencil
vim.keymap.set("n", "<leader>p", vim.cmd.Pencil, { desc = '[P]encil' })
vim.g.Pencil = {
	conceallevel = 1,
}
