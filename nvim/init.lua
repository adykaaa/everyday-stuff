require("josean.core")
require("josean.lazy")

-- Set line numbers to Ayu's yellow
vim.api.nvim_set_hl(0, "LineNr", { fg = "#FFCC66", bg = "NONE" })

-- Set the cursor line number to Ayu's yellow (with bold for emphasis)
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFCC66", bg = "NONE", bold = true })
