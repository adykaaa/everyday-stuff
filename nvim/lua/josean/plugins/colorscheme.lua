return {
  "Shatur/neovim-ayu",
  priority = 1000,
  config = function()
    require("ayu").setup({
      mirage = false,
      terminal = true, -- Set to `false` to let terminal manage its own colors.
      overrides = {
        Normal = { bg = "#171c28" }, -- Editor background
        NonText = { bg = "#171c28" }, -- Workbench background
        Visual = { bg = "#555555" }, -- Adjust this to your desired visual selection color
        CursorLine = { bg = "#232a3a" },
        WinSeparator = { bg = "#232a3a", fg = "#171c28" }, -- Removes separator lines
        VertSplit = { bg = "#171c28", fg = "#171c28" }, -- Removes vertical split lines
        LineNr = { bg = "#171c28" }, -- Background for line numbers
        EndOfBuffer = { bg = "#171c28" }, -- Background beyond the last line
        StatusLine = { bg = "#171c28" }, -- Background for the status line
        StatusLineNC = { bg = "#171c28" }, -- Background for inactive status line
        CursorColumn = { bg = "#171c28" }, -- Background for inactive status line
        SignColumn = { bg = "#171c28" }, -- Background for inactive status line
      },
    })
    vim.cmd("colorscheme ayu")
  end,
}

--[[ Default was this:
return {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
        local transparent = true -- set to true if you would like to enable transparency
 
        require("tokyonight").setup({
            style = "storm",
            transparent = transparent,
            styles = {
                sidebars = transparent and "transparent" or "dark",
                floats = transparent and "transparent" or "dark",
                comments = {},
                keywords = {},
                functions = {},
                variables = {},
            },
        })
 
        vim.cmd("colorscheme tokyonight")
    end,
} ]]
