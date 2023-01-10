vim.g.mapleader = ';'
vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.autoread = true
vim.o.termguicolors = true
vim.opt.list = true
vim.opt.listchars:append "eol:↴"

vim.o.scrolloff = 8

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smarttab = true

vim.wo.number = true

vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.hlsearch = true

vim.o.lazyredraw = true
vim.o.ttimeoutlen = 10

vim.wo.wrap = false
vim.o.history = 10000
vim.o.updatetime = 300

vim.o.completeopt = 'menuone,preview,noinsert'
vim.o.hidden = true
vim.o.ls = 0
vim.o.ch = 0

vim.cmd [[
  colorscheme nightfox
  set encoding=utf-8
  set fileencoding=utf-8
  set noshowmode
  set noshowcmd
  set shortmess+=F
  set cmdheight=1
  set splitbelow
  set splitright
  set inccommand=split
  set laststatus=3
  let g:neovide_input_macos_alt_is_meta=v:true
  let g:better_escape_shortcut = 'jj'
]]
