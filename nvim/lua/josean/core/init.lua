require("josean.core.options")
require("josean.core.keymaps")

-- Set line numbers to a barely visible muted yellow for extreme transparency
vim.api.nvim_set_hl(0, "LineNr", { fg = "#F5F0E8", bg = "NONE" })

-- Set the cursor line number to a slightly more visible muted yellow with bold for subtle emphasis
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FAF4EB", bg = "NONE", bold = true })
