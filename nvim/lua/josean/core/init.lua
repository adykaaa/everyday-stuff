require("josean.core.options")
require("josean.core.keymaps")

-- Set the normal line numbers to white
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bg = "NONE" })

-- Set the cursor line number to white
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bg = "NONE", bold = true })
