vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<C-t>", "<cmd>ToggleTerm<CR>")
keymap.set("n", "<C-f>", "<cmd>ToggleTerm direction=float<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Nvim DAP keybindings
keymap.set("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Debugger continue" })
keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Debugger step over" })
keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Debugger step into" })
keymap.set("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "Debugger step out" })
keymap.set("n", "<F4>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debugger toggle breakpoint" })
keymap.set("n", "<Leader>B", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debugger set conditional breakpoint" })
keymap.set("n", "<Leader>dq", function()
  require("dap").terminate()
end, { desc = "Debugger reset" })

-- Rust-specific debugger extension
keymap.set("n", "<Leader>t", function()
  vim.cmd("RustLsp testables")
end, { desc = "Debugger testables" })
