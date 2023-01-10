require("impatient")
require("settings")
require("mappings")
require("plugins")

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    vim.o.ls = 0
    vim.o.ch = 0
  end,
})
