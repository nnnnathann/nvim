vim.g.haskell_tools = {
  ---@type haskell-tools.tools.Opts
  tools = {
    -- ...
  },
  ---@type haskell-tools.lsp.ClientOpts
  ---You can also configure these via `:h vim.lsp.config`,
  --- with the "haskell-tools" key.
  hls = {
    ---@param client number The LSP client ID.
    ---@param bufnr number The buffer number
    ---@param ht HaskellTools = require('haskell-tools')
    on_attach = function(client, bufnr, ht)
      -- Set keybindings, etc. here.
    end,
    settings = {
      haskell = {
        plugin = {
          eval = {
            globalOn = false,
          },
        },
      },
    },
    -- ...
  },
  ---@type haskell-tools.dap.Opts
  dap = {
    -- ...
  },
}

return {
  'mrcjkb/haskell-tools.nvim',
  version = '^6',
  lazy = false,
  setup = {
    hls = {
      filetypes = { 'haskell', 'lhaskell' },
      on_attach = function(client, bufnr)
        if vim.bo[bufnr].filetype == 'cabal' then
          print 'Cabal file detected, disabling document highlight'
          client.server_capabilities.documentHighlightProvider = false
          client.handlers['textDocument/documentHighlight'] = function() end
        end
      end,
    },
  },
}
