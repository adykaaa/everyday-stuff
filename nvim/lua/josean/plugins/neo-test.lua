return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-go",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
        ["neotest-jest"] = {},
        ["neotest-go"] = {
          extra_args = { "-race" },
        },
      },
    },
    config = function(_, opts)
      local neotest = require("neotest")

      -- Set up the keymaps inside the config function
      local function setup_neotest_keymaps()
        -- Run the nearest test
        vim.keymap.set("n", "<leader>tt", function()
          neotest.run.run()
        end, { desc = "Run Nearest Test" })

        -- Run all tests in the current file
        vim.keymap.set("n", "<leader>tf", function()
          neotest.run.run(vim.fn.expand("%"))
        end, { desc = "Run Tests in File" })

        -- Toggle the test summary window
        vim.keymap.set("n", "<leader>ts", function()
          neotest.summary.toggle()
        end, { desc = "Toggle Test Summary" })
      end

      -- Configure neotest
      neotest.setup(opts)

      -- Set up the keymaps
      setup_neotest_keymaps()
    end,
  },
}
