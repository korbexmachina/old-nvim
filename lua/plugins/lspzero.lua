return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {
      'neovim/nvim-lspconfig',
      -- Rust setup
      config = function()
        -- Require lspconfig file
        require 'lspconfig'
      end
    },
    -- Rust support
    {'simrat39/rust-tools.nvim'},
    {
      'williamboman/mason.nvim',
      config = function()
        require("mason").setup({
          ui = {
            icons = {
              package_installed = "",
              package_pending = "",
              package_uninstalled = "",
            },
          }
        })
      end
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'L3MON4D3/LuaSnip'},     -- Required
  },

  config = function ()
    local lsp = require("lsp-zero")

    lsp.preset("recommended")

    lsp.ensure_installed({
      'gopls',
      'rust_analyzer',
    })

    -- Fix Undefined global 'vim'
    lsp.nvim_workspace()

    -- Completion Plugin Setup
    local cmp = require'cmp'
    cmp.setup({
      -- Enable LSP snippets
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Remove tab bindings
        ['<S-Tab>'] = nil,
        ['<Tab>'] = nil,
        -- Scroll documentation
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        })
      },
      -- Installed sources:
      sources = {
        { name = 'path' },                              -- file paths
        { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
        { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
        { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer', keyword_length = 2 },        -- source current buffer
        { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
        { name = 'calc'},                               -- source for math calculation
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
          local menu_icon ={
            nvim_lsp = 'λ',
            vsnip = '⋗',
            buffer = 'Ω',
            path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
    })

    lsp.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end)

    lsp.setup()
  end,
}
