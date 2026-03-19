---@module "lazy"
---@type LazySpec
return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'BufReadPost', -- Load ufo after opening a buffer
  opts = {
    -- Optional: Customize provider selector
    provider_selector = function(bufnr, filetype, buftype) return { 'treesitter', 'indent' } end,
  },
  init = function()
    -- Set folding options before nvim-ufo loads
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider needs a large value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function(_, opts)
    -- Keymaps for nvim-ufo
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    require('ufo').setup(opts)
  end,
}
