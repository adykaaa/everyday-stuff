return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    autochdir = "true",
    config = function()
      require("toggleterm").setup({
        size = 20, -- Adjust this value for the terminal size
        open_mapping = [[<C-t>]], -- Keybinding to toggle the terminal
        direction = "horizontal", -- Options: 'horizontal', 'vertical', 'float'
        autochdir = true, -- Change directory to the current buffer's directory
        float_opts = {
          border = "curved", -- Border style for float: 'single', 'double', 'shadow', etc.
        },
      })
      vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
      vim.keymap.set("n", "<C-f>", "<cmd>ToggleTerm direction=float<CR>")
    end,
  },
}
