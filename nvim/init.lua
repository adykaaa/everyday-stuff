require("josean.core")
require("josean.lazy")

-- Set line numbers to a faint yellowish tone for better visibility on a dark background
vim.api.nvim_set_hl(0, "LineNr", { fg = "#4B473A", bg = "NONE" })

-- Set the cursor line number to a slightly brighter yellow for emphasis
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#6B6654", bg = "NONE", bold = true })

vim.opt.fillchars = { eob = " " }
