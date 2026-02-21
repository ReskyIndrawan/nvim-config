return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },

    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      -- ========== BASIC KEYMAPS ==========
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "Harpoon Add File" })

      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon Menu" })

      vim.keymap.set("n", "<C-p>", function()
        harpoon:list():prev()
      end, { desc = "Harpoon Previous" })

      vim.keymap.set("n", "<C-n>", function()
        harpoon:list():next()
      end, { desc = "Harpoon Next" })

      -- ========== TELESCOPE INTEGRATION ==========
      vim.keymap.set("n", "<leader>fl", function()
        local telescope = require("telescope")
        local conf = require("telescope.config").values
        local themes = require("telescope.themes")

        local file_paths = {}
        for _, item in ipairs(harpoon:list().items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new(
          themes.get_ivy({ prompt_title = "Harpoon Files" }),
          {
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          }
        ):find()
      end, { desc = "Harpoon Telescope List" })
    end,
  },
}
