return {
  'mrcjkb/haskell-tools.nvim',
  version = '^5',
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
