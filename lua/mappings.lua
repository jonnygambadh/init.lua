local keymap = vim.api.nvim_set_keymap
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
keymap("n", "<leader>tm", ":Telescope marks<cr>", opts)
keymap("n", "<leader>tg", ":Telescope grep_string<cr>", opts)
keymap("n", "<leader>tl", ":Telescope live_grep<cr>", opts)
keymap("n", "<C-p>", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>tc", ":Telescope git_commits<cr>", opts)
keymap("n", "<leader>ti", ":Telescope git_bcommits<cr>", opts)
keymap("n", "<leader>ts", ":Telescope git_status<cr>", opts)
keymap("n", "<leader>to", ":Telescope command_history<cr>", opts)
keymap("n", "<leader>tj", ":Telescope jumplist theme=dropdown<cr>", opts)

-- Telescope plugins
keymap("n", "<C-a>", ":Telescope harpoon marks<cr>", opts)
keymap("n", "<leader>ta", ":Telescope adjacent theme=dropdown<cr>", opts)
keymap("n", "<leader>tz", ":Telescope tailiscope<cr>", opts)
keymap("n", "<leader>tt", "::Telescope command_palette<cr>", opts)

-- Telescope custom
keymap("n", "<leader>tb", ":MB<cr>", opts)

-- LSP
vim.keymap.set('n', '<leader>ge', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>gq', vim.diagnostic.setloclist, opts)
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
    bufmap("n", "<leader>gn", vim.lsp.buf.rename)
    bufmap('n', '<leader>gk', vim.lsp.buf.hover)
    bufmap('n', '<leader>ga', "<cmd>CodeActionMenu<cr>")
    bufmap('n', '<leader>gF', function() vim.lsp.buf.format { async = true } end)
  end
})

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
vim.keymap.set('n', '<Leader>zm', "<Cmd>lua require('maximize').toggle()<CR>")

keymap("n", "<leader>of", ":Neotree toggle filesystem reveal right<cr>", opts)
keymap("n", "<leader>ob", ":Neotree toggle buffers reveal float<cr>", opts)
keymap("n", "<leader>oh", ":Neotree toggle git_status reveal float<cr>", opts)
keymap("n", "<leader>op", ":Neotree toggle git_status reveal float git_base=master<cr>", opts)

keymap("n", "[q", ":cprevious<cr>", opts)
keymap("n", "]q", ":cnext<cr>", opts)
keymap("n", "[b", ":bprevious<cr>", opts)
keymap("n", "]b", ":bnext<cr>", opts)

-- select context-aware indent
vim.keymap.set({"x", "o"}, "ai", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>")
-- ensure selecting entire line (or just use Vai)
vim.keymap.set({"x", "o"}, "aI", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>")
-- select inner block (only if block, only else block, etc.)
vim.keymap.set({"x", "o"}, "ii", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>")
-- select entire inner range (including if, else, etc.)
vim.keymap.set({"x", "o"}, "iI", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>")
vim.api.nvim_set_keymap('n',"<leader>g?","<cmd>InspectTwoslashQueries<CR>",{})
vim.api.nvim_set_keymap('n',"<leader>g/","<cmd>RemoveTwoslashQueries<CR>",{})

--- go to preview
keymap("n", "<leader>gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
keymap("n", "<leader>gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)
keymap("n", "<leader>gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)
keymap("n", "<leader>gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
keymap("n", "<leader>gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)

vim.keymap.set({ "n" }, "K", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
