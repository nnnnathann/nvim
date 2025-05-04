local plugins = {}
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath 'config' .. '/lua/plugins')) do
  if file:match '%.lua$' and file ~= 'init.lua' then
    local name = file:sub(1, -5) -- drop “.lua”
    local ok, spec = pcall(require, 'plugins.' .. name)
    if ok and type(spec) == 'table' then
      vim.list_extend(plugins, spec)
    end
  end
end

local inline = {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'rescript-lang/vim-rescript',
  'github/copilot.vim',
  'nanotee/sqls.nvim',
}

return vim.list_extend(plugins, inline)
