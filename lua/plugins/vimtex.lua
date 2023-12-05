return {
  'lervag/vimtex',
  ft = {'tex', 'md'},
  setup = function()
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_conceal = 1
    vim.g.tex_conceal = 'abdmg'
  end,
}
