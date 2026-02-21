-- Set Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load core settings
require("core.options")
require("core.keymaps")

-- Load config settings
require('config.lazy')

-- Other utils settings
vim.opt.clipboard = "unnamedplus"
