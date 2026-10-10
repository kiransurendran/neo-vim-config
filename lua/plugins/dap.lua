-- lua/plugins/dap.lua
return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    ----------------------------------------------------------------------------
    -- 1. ADAPTER MAPPING ALIAS (Fixes the missing 'docker' error)
    ----------------------------------------------------------------------------
    dap.adapters.docker = dap.adapters["pwa-node"]

    ----------------------------------------------------------------------------
    -- 2. NODE.JS & TYPESCRIPT CONFIGURATIONS
    ----------------------------------------------------------------------------
    local js_languages = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

    for _, lang in ipairs(js_languages) do
      dap.configurations[lang] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch Current File (Local Node)",
          program = "${file}",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Process ID",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach to Docker (Node/TS)",
          address = "127.0.0.1",
          port = 9229,
          cwd = "${workspaceFolder}",
          localRoot = "${workspaceFolder}",
          remoteRoot = "/app",
          sourceMaps = true,
        },
      }
    end

    ----------------------------------------------------------------------------
    -- 3. PYTHON CONFIGURATIONS
    ----------------------------------------------------------------------------
    dap.configurations.python = {
      {
        type = "debugpy",
        request = "launch",
        name = "Launch File (Local Python)",
        program = "${file}",
        pythonPath = function()
          local venv_path = os.getenv("VIRTUAL_ENV")
          if venv_path then
            return venv_path .. "/bin/python"
          end
          return "python3"
        end,
      },
      {
        type = "debugpy",
        request = "attach",
        name = "Attach to Docker (Python debugpy)",
        connect = {
          host = "127.0.0.1",
          port = 5678,
        },
        pathMappings = {
          {
            localRoot = "${workspaceFolder}",
            remoteRoot = "/app",
          },
        },
        justMyCode = true,
      },
    }
  end,
}
