return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        direction = "horizontal",
      })

      vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>")
	    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
    end,
  },
}
