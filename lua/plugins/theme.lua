return {
      {
    -- catppuccin theme
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        integrations = {
          treesitter = true,
          gitsigns = true,
          telescope = true,
          which_key = true,
          markdown = true,
          alpha = true,
        },
      })
      vim.cmd.colorscheme 'catppuccin'
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
}
