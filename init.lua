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
vim.opt.autoread = true
-- Auto reload file jika berubah dari luar (cargo add, dll)
vim.api.nvim_create_autocmd(
  { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },
  {
    pattern = "*",
    command = "checktime",
  }
)
