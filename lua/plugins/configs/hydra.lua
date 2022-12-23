local Hydra = require('hydra')

Hydra({
  name = "Modes",
  mode = 'n',
  body = '<leader>l',
  heads = {
    { 'j', ':TSJToggle<cr>', { silent = true } },
    { 'o', '<cmd>lua require("maximize").toggle()<CR>', { silent = true } },
    { 'z', ':ZenMode<cr>', { silent = true } }
  },
})

Hydra({
  name = "Movements",
  mode = 'n',
  body = '<leader>j',
  heads = {
    { 'y', '<cmd>lua require("smart-splits").resize_left()<cr>', { silent = true } },
    { 'u', '<cmd>lua require("smart-splits").resize_down()<cr>', { silent = true } },
    { 'i', '<cmd>lua require("smart-splits").resize_up()<cr>', { silent = true } },
    { 'o', '<cmd>lua require("smart-splits").resize_right()<cr>', { silent = true } },
    { 'h', '<cmd>lua require("smart-splits").move_cursor_left()<cr>', { silent = true } },
    { 'j', '<cmd>lua require("smart-splits").move_cursor_down()<cr>', { silent = true } },
    { 'k', '<cmd>lua require("smart-splits").move_cursor_up()<cr>', { silent = true } },
    { 'l', '<cmd>lua require("smart-splits").move_cursor_right()<cr>', { silent = true } },
  },
})
