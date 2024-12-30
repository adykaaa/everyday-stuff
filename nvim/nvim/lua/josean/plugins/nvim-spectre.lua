return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      live_update = true,
      is_insert_mode = false,
      highlight = {
        search = "Search", -- Highlight search results with a bright color
        replace = "WarningMsg", -- Highlight replacements with a warning color
      },
    },
    config = function(_, opts)
      -- Configure Spectre
      require("spectre").setup(opts)

      -- Keymaps
      vim.keymap.set("n", "<leader>FF", function()
        require("spectre").open()
      end, { desc = "Open Spectre" })

      vim.keymap.set("n", "<leader>FW", function()
        require("spectre").open_visual({ select_word = true })
      end, { desc = "Search Current Word" })

      vim.keymap.set("n", "<leader>FC", function()
        require("spectre").open_file_search({ select_word = true })
      end, { desc = "Search Current File" })
    end,
  },
}
