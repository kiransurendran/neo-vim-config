-- return {
--   {
--
--     "neovim/nvim-lspconfig",
--
--     opts = {
--
--       servers = {
--
--         ts_ls = {},
--
--         pyright = {},
--
--         bashls = {},
--
--         yamcollectgarbagells = {},
--
--         jsonls = {},
--
--         terraformls = {},
--
--         clangd = {},
--       },
--     },
--   },
-- }

return {
  -- 1. Automate Mason installations for portability
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP Servers
        "typescript-language-server",
        "pyright",
        "bash-language-server",
        "yaml-language-server",
        "json-lsp",
        "terraform-ls",
        "clangd",
      },
    },
  },

  -- 2. Pass settings and structures to your LSPs
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- TypeScript / JavaScript
        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
                includeInlayVariableTypeHints = true,
              },
            },
          },
        },

        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace", -- Analyzes the whole project, not just open files
                typeCheckingMode = "basic", -- options: off, basic, strict
              },
            },
          },
        },

        -- Bash script configurations
        bashls = {
          filetypes = { "sh", "bash", "zsh" },
        },

        -- YAML configurations (corrected from 'yamcollectgarbagells')
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://schemastore.org"] = "/.github/workflows/*",
                ["https://schemastore.org"] = "k8s/**",
              },
            },
          },
        },

        -- JSON configurations
        jsonls = {
          settings = {
            json = {
              validate = { enable = true },
            },
          },
        },

        -- Terraform / HCL configurations
        terraformls = {}, -- Will cleanly load with system defaults without being an empty object contextually

        -- C / C++ configurations
        clangd = {
          keys = {
            -- { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C++)" },
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "dependencies.m4",
              "configure",
              "build.ninja",
              "compile_commands.json",
              "objcpp.compile_commands.json"
            )(fname)
          end,
          capabilities = {
            offsetEncoding = { "utf-16" }, -- Prevents warning prompts concerning multiple offset encodings
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
      },
    },
  },
}
