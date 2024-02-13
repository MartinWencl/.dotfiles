-- Load options
require("opts")

-- Bootstrapping lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Loads some basic plugins
local plugins = require("init_plugins")

-- Treesitter
local treesitter = require("treesitter_conf")
table.insert(plugins, treesitter)

-- Telescope
local telescope = require("telescope_conf")
table.insert(plugins, telescope)

-- LSP config
local lspconf = require("lspconf_conf")
table.insert(plugins, lspconf)

-- Set the lua/plugins/ as the import dir for additional plugins
table.insert(plugins, { import = "plugins" })

require("lazy").setup(plugins, {})

-- Load basic keymaps not related to specific plugins
require("keymaps")

-- Load custom files
require("custom.dek")
require("custom.terminals")