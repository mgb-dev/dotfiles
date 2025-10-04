-- [[ Global Settings ]] --

-- Set <Space> as global leader key
vim.g.mapleader = " "

-- Disable netrw banner
vim.g.netrw_banner = 0

local opt = vim.opt

-- [[ Setting options ]]
-- See `:help vim.o`

opt.number = true -- Make line numbers default
opt.relativenumber = true -- Relative line numbers

-- Enable break indent
opt.breakindent = true

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

opt.wrap = false

-- Decrease update time
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- note: You should make sure your terminal supports this
opt.termguicolors = true

opt.background = "dark"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8

opt.updatetime = 250

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- open new split panes to right and below

opt.splitright = true
opt.splitbelow = true

-- cursor-line
opt.cursorline = true

opt.backspace = "indent,eol,start"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
