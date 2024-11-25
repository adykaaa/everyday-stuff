local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  { import = "josean.plugins" },
  { import = "josean.plugins.lsp" },
  {
    "LazyVim/LazyVim",
    import = "lazyvim.plugins",
    opts = {
      -- add LazyVim options here
      defaults = {
        -- disable LazyVim's neo-tree
        neo_tree = false,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false, -- Disable the plugin
  },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
