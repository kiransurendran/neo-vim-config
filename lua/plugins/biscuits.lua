return {
    "code-biscuits/nvim-biscuits",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    event = "BufReadPost",
    config = function()
        require("nvim-biscuits").setup({
            show_on_start = true,
            toggle_keymap = "<leader>cb",
            clear_on_insert = true,

            -- FIX 2: Re-evaluate biscuits instantly as the cursor moves or enters insert mode
            cursor_line_only = true,
            on_events = { "CursorMoved", "CursorMovedI", "InsertEnter" },

            -- FIX 1 & 3: Place core text configurations and nesting rules inside default_config
            default_config = {
                prefix_string = " 🍪 ", -- Your custom icon/emoji prefix
                max_length = 80, -- Max characters to show in the hint
                min_distance = 3, -- Only show hints if the block is at least 3 lines tall
            },
        })
    end,
}
