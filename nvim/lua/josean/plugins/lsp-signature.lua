return {
  "ray-x/lsp_signature.nvim",
  config = function()
    require("lsp_signature").setup({
      bind = true, -- This is mandatory, otherwise border config won't work
      wrap = true,
      close_timeout = 1500,
      handler_opts = {
        border = "rounded", -- Rounded border for signature help popup
      },
      timer_interval = 50,
      floating_window = true, -- Use a floating window for signature help
      hint_enable = true, -- Enable inline hints
      hint_prefix = {
        above = "↙ ", -- when the hint is on the line above the current line
        current = "← ", -- when the hint is on the same line
        below = "↖ ", -- when the hint is on the line below the current line
      },
      transparency = 7, -- Transparency for the floating window
    })
  end,
}
