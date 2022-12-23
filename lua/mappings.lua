local keymap = vim.api.nvim_set_keymap
local api = vim.api
local opts = { noremap = true, silent = true }

keymap('n', '<leader>ev', '<cmd>tabe $MYVIMRC<cr>', opts)

keymap("n", "<leader>w", "<cmd>update<cr>", opts)
keymap("n", "<leader>x", "<cmd>x<cr>", opts)
keymap("n", "<leader>q", "<cmd>q!<cr>", opts)
keymap("n", "<leader>Q", "<cmd>qa!<cr>", opts)

-- Delete a buffer, without closing the window
keymap("n", [[\d]], "<cmd>bprevious <bar> bdelete #<cr>", opts)

-- Accelerated jk
keymap('n', 'j', '<plug>(accelerated_jk_gj)', {})

-- Opening GH
keymap("n", "<leader>ho", ":OpenInGHRepo <cr>", opts)
keymap("n", "<leader>hf", ":OpenInGHFile <cr>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>tm", ":Telescope marks<cr>", opts)
keymap("n", "<leader>tg", ":Telescope grep_string<cr>", opts)
keymap("n", "<leader>tl", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>tf", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<leader>tc", ":Telescope git_commits<cr>", opts)
keymap("n", "<leader>ti", ":Telescope git_bcommits<cr>", opts)
keymap("n", "<leader>ts", ":Telescope git_status<cr>", opts)
keymap("n", "<leader>to", ":Telescope command_history<cr>", opts)
keymap("n", "<leader>tb", ":Telescope buffers theme=dropdown<cr>", opts)
keymap("n", "<leader>tj", ":Telescope jumplist theme=dropdown<cr>", opts)

-- Telescope plugins
keymap("n", "<leader>th", ":Telescope harpoon marks theme=dropdown<cr>", opts)
keymap("n", "<leader>ta", ":Telescope adjacent theme=dropdown<cr>", opts)
keymap("n", "<leader>tt", ":Telescope tailiscope<cr>", opts)

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = true })
    end

    bufmap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    bufmap("n", "<leader>gv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>")
    bufmap("n", "<leader>gx", "<cmd>belowright split | lua vim.lsp.buf.definition()<cr>")
    bufmap("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    bufmap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    bufmap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>")
  end
})

-- LSP Saga
keymap("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<cr>", opts)
keymap("n", "<leader>gp", "<cmd>Lspsaga peek_definition<cr>", opts)
keymap("n", "<leader>ga", "<cmd>Lspsaga code_action<cr>", opts)
keymap("n", "<leader>gn", "<cmd>Lspsaga rename<cr>", opts)

keymap("n", "<leader>go", "<cmd>LSoutlineToggle<cr>", opts)
keymap("n", "<leader>gk", "<cmd>Lspsaga hover_doc<cr>", opts)

keymap("n", "<A-t>", "<cmd>Lspsaga open_floaterm<cr>", opts)
keymap("t", "<A-t>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<cr>]], opts)

keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

-- Harpoon
keymap("n", "<leader>aa", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)
keymap("n", "<leader>ar", "<cmd>lua require('harpoon.mark').rm_file()<cr>", opts)
keymap("n", "<leader>ac", "<cmd>lua require('harpoon.mark').clear_all()<cr>", opts)
keymap("n", "[a", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts)
keymap("n", "]a", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)

-- Neotest
keymap("n", "<leader>t1", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", opts)
keymap("n", "<leader>t2", "<cmd>lua require('neotest').run.run()<cr>", opts)
keymap("n", "<leader>t3", "<cmd>lua require('neotest').summary.toggle()<cr>", opts)
keymap("n", "<leader>t4", "<cmd>lua require('neotest').output.open()<cr>", opts)
keymap("n", "<leader>t5", "<cmd>lua require('neotest').run.stop()<cr>", opts)

-- Smart Splits
keymap("n", "<A-y>", "<cmd>lua require('smart-splits').resize_left()<cr>", opts)
keymap("n", "<A-u>", "<cmd>lua require('smart-splits').resize_down()<cr>", opts)
keymap("n", "<A-i>", "<cmd>lua require('smart-splits').resize_up()<cr>", opts)
keymap("n", "<A-o>", "<cmd>lua require('smart-splits').resize_right()<cr>", opts)

keymap("n", "<A-h>", "<cmd>lua require('smart-splits').move_cursor_left()<cr>", opts)
keymap("n", "<A-j>", "<cmd>lua require('smart-splits').move_cursor_down()<cr>", opts)
keymap("n", "<A-k>", "<cmd>lua require('smart-splits').move_cursor_up()<cr>", opts)
keymap("n", "<A-l>", "<cmd>lua require('smart-splits').move_cursor_right()<cr>", opts)

-- Marks
keymap("n", "m<", ":MarksQFListBuf<cr>", opts)
keymap("n", "m>", ":MarksQFListGlobal<cr>", opts)
keymap("n", "m_", ":MarksQFListAll<cr>", opts)

-- Zen Mode
keymap("n", "<leader>zz", ":ZenMode<cr>", opts)
keymap("n", "<leader>of", ":Neotree toggle filesystem reveal right <cr>", opts)
keymap("n", "<leader>ob", ":Neotree toggle buffers reveal float <cr>", opts)
keymap("n", "<leader>oh", ":Neotree toggle git_status reveal float <cr>", opts)

keymap("n", "[q", ":cprevious<cr>", opts)
keymap("n", "]q", ":cnext<cr>", opts)
keymap("n", "[b", ":bprevious<cr>", opts)
keymap("n", "]b", ":bnext<cr>", opts)

-- select context-aware indent
vim.keymap.set("x", "ai", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>")
-- ensure selecting entire line (or just use Vai)
vim.keymap.set("x", "aI", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>")
-- select inner block (only if block, only else block, etc.)
vim.keymap.set("x", "ii", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>")
-- select entire inner range (including if, else, etc.)
vim.keymap.set("x", "iI", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>")
