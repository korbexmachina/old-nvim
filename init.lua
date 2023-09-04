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

-- [[ KEYBINDS ]]
-- Oil
vim.keymap.set("n", "<C-o>", vim.cmd.Oil, { desc = 'Oil' })

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

-- Undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Fugitive
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
