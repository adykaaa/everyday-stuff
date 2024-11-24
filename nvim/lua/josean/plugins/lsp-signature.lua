return {
  "ray-x/lsp_signature.nvim",
  config = function()
    require("lsp_signature").setup({
      bind = true, -- This is mandatory, otherwise border config won't work
      handler_opts = {
        border = "rounded", -- Rounded border for signature help popup
      },
      floating_window = true, -- Use a floating window for signature help
      hint_enable = true, -- Enable inline hints
      hint_prefix = "🔍 ", -- Prefix for inline hints
      transparency = 10, -- Transparency for the floating window
    })
  end,
}
