return {
    -- 1. Install the VS Code colorscheme plugin
    {
        "mofiqul/vscode.nvim",
        lazy = false, -- Load immediately during startup
        priority = 1000, -- Load before other UI plugins
        config = function()
            -- Optional configuration adjustments
            require("vscode").setup({
                style = "dark", -- Choose 'dark' or 'light'
                transparent = true, -- Enable transparent background if true
                italic_comments = true, -- Use italics for code comments
                disable_nvimtree_bg = true,
            })
        end,
    },

    -- 2. Tell LazyVim to use it as the main system colorscheme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "vscode", -- Sets vim.cmd.colorscheme("vscode")
        },
    },
}
-- return {
--   "navarasu/onedark.nvim",
--   config = function()
--     require("onedark").setup({
--       style = "warmer",
--       transparent = true,
--     })
--     require("onedark").load()
--   end,
-- }
-- return {
--   -- add gruvbox
--   {
--     "ellisonleao/gruvbox.nvim",
--     opts = {
--       contrast = "hard", -- Options: "hard", "soft", or ""
--     },
--   },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }
