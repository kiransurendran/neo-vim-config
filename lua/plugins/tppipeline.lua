return {
    {
        "vimpostor/vim-tpipeline",
        -- Only load the plugin if we are actually inside a tmux session
        enabled = vim.env.TMUX ~= nil,
        lazy = false,
        config = function()
            vim.g.tpipeline_auto_group = 1
            vim.g.tpipeline_restore = 1
            -- Enforce hiding the statusline every time a window or buffer changes
            local hide_status_grp = vim.api.nvim_create_augroup("HideStatusLine", { clear = true })
            vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufEnter", "BufWinEnter" }, {
                group = hide_status_grp,
                callback = function()
                    vim.opt.laststatus = 0
                    vim.opt.cmdheight = 0 -- Optional: Hides the command line gap below it
                end,
            })
        end,
    },
}
