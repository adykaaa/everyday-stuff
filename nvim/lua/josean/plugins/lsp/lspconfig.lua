return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- Explicitly disable tsserver
    vim.g.typescript_server = "vtsls"

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Disable tsserver and ts_ls
    for _, server in ipairs({ "tsserver", "ts_ls" }) do
      lspconfig[server].setup({
        autostart = false,
      })
    end

    -- vtsls setup
    lspconfig["vtsls"].setup({
      capabilities = capabilities,
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
      single_file_support = true,
      settings = {
        typescript = {
          updateImportsOnFileMove = { enabled = "always" },
          suggest = {
            completeFunctionCalls = true,
          },
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = false },
          },
        },
        javascript = {
          updateImportsOnFileMove = { enabled = "always" },
          suggest = { completeFunctionCalls = true },
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = false },
          },
        },
        completions = {
          completeFunctionCalls = true,
        },
      },
      on_attach = function(client, buffer)
        -- Keybindings
        local keymap = vim.keymap

        -- TypeScript specific commands
        keymap.set("n", "<leader>co", function()
          vim.lsp.buf.execute_command({
            command = "_typescript.organizeImports",
            arguments = { vim.uri_from_bufnr(0) },
          })
        end, { buffer = buffer, desc = "Organize Imports" })

        keymap.set("n", "<leader>cM", function()
          vim.lsp.buf.execute_command({
            command = "_typescript.addMissingImports",
            arguments = { vim.uri_from_bufnr(0) },
          })
        end, { buffer = buffer, desc = "Add Missing Imports" })

        keymap.set("n", "<leader>cu", function()
          vim.lsp.buf.execute_command({
            command = "_typescript.removeUnused",
            arguments = { vim.uri_from_bufnr(0) },
          })
        end, { buffer = buffer, desc = "Remove Unused" })

        keymap.set("n", "<leader>cD", function()
          vim.lsp.buf.execute_command({
            command = "_typescript.fixAll",
            arguments = { vim.uri_from_bufnr(0) },
          })
        end, { buffer = buffer, desc = "Fix All" })

        keymap.set("n", "gD", function()
          local params = vim.lsp.util.make_position_params()
          client.request("workspace/executeCommand", {
            command = "typescript.goToSourceDefinition",
            arguments = { params.textDocument.uri, params.position },
          }, nil, 0)
        end, { buffer = buffer, desc = "Go to Source Definition" })

        keymap.set("n", "gR", function()
          client.request("workspace/executeCommand", {
            command = "typescript.findAllFileReferences",
            arguments = { vim.uri_from_bufnr(0) },
          }, nil, 0)
        end, { buffer = buffer, desc = "Find File References" })

        -- Move to file refactoring
        client.commands["_typescript.moveToFileRefactoring"] = function(command, ctx)
          local action, uri, range = unpack(command.arguments)

          local function move(newf)
            client.request("workspace/executeCommand", {
              command = command.command,
              arguments = { action, uri, range, newf },
            })
          end

          local fname = vim.uri_to_fname(uri)
          client.request("workspace/executeCommand", {
            command = "typescript.tsserverRequest",
            arguments = {
              "getMoveToRefactoringFileSuggestions",
              {
                file = fname,
                startLine = range.start.line + 1,
                startOffset = range.start.character + 1,
                endLine = range["end"].line + 1,
                endOffset = range["end"].character + 1,
              },
            },
          }, function(_, result)
            if not result or not result.body then
              return
            end
            local files = result.body.files
            table.insert(files, 1, "Enter new path...")
            vim.ui.select(files, {
              prompt = "Select move destination:",
              format_item = function(f)
                return vim.fn.fnamemodify(f, ":~:.")
              end,
            }, function(f)
              if f and f:find("^Enter new path") then
                vim.ui.input({
                  prompt = "Enter move destination:",
                  default = vim.fn.fnamemodify(fname, ":h") .. "/",
                  completion = "file",
                }, function(newf)
                  return newf and move(newf)
                end)
              elseif f then
                move(f)
              end
            end)
          end)
        end
      end,
    })

    -- Mason configuration
    mason_lspconfig.setup({
      ensure_installed = {
        "vtsls",
      },
    })
  end,
}
