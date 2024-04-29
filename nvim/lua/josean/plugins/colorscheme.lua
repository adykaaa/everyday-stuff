return {
    "Shatur/neovim-ayu",
    priority = 1000,
    config = function()
        require("ayu").setup({
            mirage = false,
            terminal = false, -- Set to `false` to let terminal manage its own colors.
            overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
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
