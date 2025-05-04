return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
    end
    require('nvim-tree').setup {
      actions = {
        open_file = {
          window_picker = { enable = false },
        },
      },
      view = {
        side = 'right',
      },
      filters = {
        dotfiles = false,
      },
      on_attach = my_on_attach,
    }
  end,
}
