-- ~/.config/nvim/lua/config/autocmds.lua

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "c",
        "cpp", -- C and C++
        "python", -- Python
        "typescript", -- TypeScript
        "javascript", -- JavaScript
        "sh",
        "bash", -- Shell scripts
        "terraform",
        "hcl", -- Terraform config files
        "yaml", -- YAML
        "json", -- JSON
        "go", -- Go (Note: Go standard style prefers hard tabs, but this sets it to 4 spaces)
    },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        local transparent_groups = {
            "Normal",
            "NormalNC",
            "LineNr",
            "SignColumn",
            "EndOfBuffer",
            "NormalFloat",
            "NvimTreeNormal",
            "NeoTreeNormal",
            "NeoTreeNormalNC",
            "NormalFloat", -- Floating windows
            "FloatBorder", -- Floating window borders
            "WinBar", -- Window bar at the top
            "WinBarNC", -- Window bar (non-current window)
            "SignColumn", -- Column where git signs/diagnostics appear
            "LineNr", -- Line numbers
            "CursorLineNr", -- Current line number
            "StatusLine", -- Main status bar at the bottom
            "StatusLineNC", -- Non-current status bar
        }
        for _, group in ipairs(transparent_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
        end
    end,
})

local augroup = vim.api.nvim_create_augroup("toggle_relativenumber", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    group = augroup,
    callback = function()
        if vim.o.relativenumber then
            vim.opt.relativenumber = false
        end
    end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    group = augroup,
    callback = function()
        if vim.wo.number then
            vim.opt.relativenumber = true
        end
    end,
})
