return {
    "ggandor/leap.nvim",
    lazy = false,
    opts = {
        case_sensitive = false,
        safe_labels = {}, -- disable auto-jumping to the first match; doesn't work on one unique target
        max_phase_one_targets = 0, -- first char won't show possible matches
        max_highlighted_traversal_targets = 10,
    },

    config = function(_, opts)
        local leap = require("leap")
        leap.setup(opts)
        leap.set_default_keymaps(true)

        -- Bidirectional search
        vim.keymap.set("n", "s", function()
            leap.leap({ target_windows = { vim.api.nvim_get_current_win() } })
        end)
        vim.keymap.set("x", "s", function()
            leap.leap({ target_windows = { vim.api.nvim_get_current_win() } })
        end)

        -- mark cursor location before jumping
        vim.api.nvim_create_autocmd("User", {
            pattern = "LeapEnter",
            callback = function()
                vim.cmd("normal m'")
            end,
        })
        -- center cursor after jumping
        vim.api.nvim_create_autocmd("User", {
            pattern = "LeapLeave",
            callback = function()
                vim.cmd("normal zz")
            end,
        })
    end,
}
