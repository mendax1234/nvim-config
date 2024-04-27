vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus")
vim.g.mapleader = " "

-- Set line numbers
vim.cmd("set number")

-- Copilot Settings
vim.g.copilot_filetypes = {
  xml = false,
  markdown = false,
  c = false,
}

