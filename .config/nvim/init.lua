
-- Require files from other directory 
require("config.remap")
require("plugin.packer")

-- Enable the line numbers
vim.opt.number = true
vim.opt.relativenumber = true


-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


-- Intelligently match indentation of the previous line
vim.opt.smartindent = true



-- Enable 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- Highlight the line where the cursor is currently sitting
vim.opt.cursorline = true


--   Activate the Retrobox colorscheme
vim.cmd("colorscheme retrobox")
vim.o.background="light"

