-- return {
--   "Shatur/neovim-ayu",
--   priority = 1000,
--   config = function()
--     require("ayu").setup({
--       mirage = false,
--       terminal = true, -- Set to `false` to let terminal manage its own colors.
--       overrides = {
--         Normal = { bg = "#171c28" }, -- Editor background
--         NonText = { bg = "#171c28" }, -- Workbench background
--         Visual = { bg = "#555555" }, -- Adjust this to your desired visual selection color
--         CursorLine = { bg = "#232a3a" },
--         WinSeparator = { bg = "#232a3a", fg = "#171c28" }, -- Removes separator lines
--         VertSplit = { bg = "#171c28", fg = "#171c28" }, -- Removes vertical split lines
--         LineNr = { bg = "#171c28" }, -- Background for line numbers
--         EndOfBuffer = { bg = "#171c28" }, -- Background beyond the last line
--         StatusLine = { bg = "#171c28" }, -- Background for the status line
--         StatusLineNC = { bg = "#171c28" }, -- Background for inactive status line
--         CursorColumn = { bg = "#171c28" }, -- Background for inactive status line
--         SignColumn = { bg = "#171c28" }, -- Background for inactive status line
--       },
--     })
--     vim.cmd("colorscheme ayu")
--   end,
-- }

return {
  "catppuccin/nvim",
  priority = 1000,
  name = "catppucin",
  config = function()
    require("catppuccin").setup({
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
