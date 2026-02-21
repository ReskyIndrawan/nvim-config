return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",

    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- 🔥 penting: pakai treesitter
      })

      -- 🔥 Integrasi dengan nvim-cmp (biar enter tetap smooth)
      local cmp = require("cmp")
      local autopairs = require("nvim-autopairs.completion.cmp")

      cmp.event:on(
        "confirm_done",
        autopairs.on_confirm_done()
      )
    end,
  },
}
