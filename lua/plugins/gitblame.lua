-- return {
--     {
--         "lewis6991/gitsigns.nvim",
--         -- event = { "BufReadPre", "BufNewFile" },
--         event = "VeryLazy",
--         opts = {
--             signs = {
--                 add = { text = "┃" },
--                 change = { text = "┃" },
--                 delete = { text = "_" },
--                 topdelete = { text = "‾" },
--                 changedelete = { text = "~" },
--                 untracked = { text = "┆" },
--             },
--             current_line_blame = true,
--             current_line_blame_opts = {
--                 virt_text = true,
--                 virt_text_pos = "eol",
--                 delay = 100,
--             },
--         },
--     },
-- }

return {
    "f-person/git-blame.nvim",
    event = "VeryLazy", -- Loads the plugin lazily on startup
    opts = {
        enabled = true, -- Enable git blame immediately upon opening a file
        message_template = "  • <summary> • <date> • <author> • <<sha>>",
        date_format = "%r", -- "%r" displays relative time (e.g., "3 days ago")
        virtual_text_column = 1, -- Starts virtual text at column 1 instead of EOL
    },
    keys = {
        { "<leader>gbt", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame Inline" },
        { "<leader>gbo", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open Commit in Browser" },
    },
}
