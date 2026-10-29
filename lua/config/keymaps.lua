-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- :wvim.keymap.set("n", "<leader>sx", require("telescope").resume, { noremap = true, silent = true, desc = "Resume" })
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- Select completion with Tab

keymap.set("i", "<Tab>", function()
    if vim.fn.pumvisible() == 1 then
        return "<C-n>"
    end
    return "<Tab>"
end, {
    expr = true,
    silent = true,
    desc = "Select next completion or insert Tab",
})
keymap.set("i", "jj", "<Esc>", { noremap = false })
-- vim.keymap.set()
keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- keymap.set("n", "<leader>cv", "<cmd>lsp enable<cr>", { desc = "LSP Enable" })
keymap.set("n", "<leader>cv", function()
    vim.cmd("lsp enable") -- Or use vim.lsp.enable()
end, { desc = "LSP Enable" })

-- Terminal in a horizontal split window
vim.keymap.set("n", "<leader>ts", function()
    vim.cmd("split | terminal")
end, { desc = "Terminal (Horizontal Split)" })

-- Terminal in a vertical split window
vim.keymap.set("n", "<leader>tv", function()
    vim.cmd("vsplit | terminal")
end, { desc = "Terminal (Vertical Split)" })

-- Terminal in the current active window window
vim.keymap.set("n", "<leader>to", function()
    vim.cmd("terminal")
end, { desc = "Terminal (Current Window)" })

-- Select all
-- keymap.set("n", "<C-z>", "gg<S-v>G")

keymap.set("n", "go", "o<Esc>", { desc = "Open line below and stay in normal mode" })
keymap.set("n", "gO", "O<Esc>", { desc = "Open line above and stay in normal mode" })

-- Delete the mark under the current cursor line
keymap.set("n", "dm", function()
    local current_line = vim.api.nvim_win_get_cursor(0)[1]
    local current_buf = vim.api.nvim_get_current_buf()
    local deleted = {}

    -- Delete lowercase local marks (a-z).
    for _, mark in ipairs(vim.fn.getmarklist(current_buf)) do
        local name = mark.mark:match("'([a-z])$")

        if name and mark.pos[2] == current_line then
            vim.cmd("delmarks " .. name)
            table.insert(deleted, name)
        end
    end

    -- Delete uppercase global marks (A-Z).
    for _, mark in ipairs(vim.fn.getmarklist()) do
        local name = mark.mark:match("'([A-Z])$")

        if name and mark.pos[1] == current_buf and mark.pos[2] == current_line then
            vim.cmd("delmarks " .. name)
            table.insert(deleted, name)
        end
    end

    if #deleted > 0 then
        vim.notify("Deleted marks: " .. table.concat(deleted, ", "), vim.log.levels.INFO)
    else
        vim.notify("No alphabetic marks found on this line", vim.log.levels.INFO)
    end
end, { desc = "Delete marks on current line" }) -- keymap.set("n", "<tab>", ":tabnext<Return>", opts)

keymap.set("v", "<leader>r", '"hy:%s/<C-r>h//g<Left><Left>', {
    desc = "Find and replace visual selection globally",
    silent = false,
})

-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- keymap.set("n", "te", ":tabedit")

-- Do things without affecting the registers
-- keymap.set("n", "x", '"_x')
-- keymap.set("n", "<Leader>p", '"0p')
-- keymap.set("n", "<Leader>P", '"0P')
-- keymap.set("v", "<Leader>p", '"0p')
-- keymap.set("n", "<Leader>c", '"_c')
-- keymap.set("n", "<Leader>C", '"_C')
-- keymap.set("v", "<Leader>c", '"_c')
-- keymap.set("v", "<Leader>C", '"_C')
-- keymap.set("n", "<Leader>d", '"_d')
-- keymap.set("n", "<Leader>D", '"_D')
-- keymap.set("v", "<Leader>d", '"_d')
-- keymap.set("v", "<Leader>D", '"_D')
--
-- -- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
--
-- -- Delete a word backwards
-- keymap.set("n", "dw", 'vb"_d')
--
-- -- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G")
--
-- -- Save with root permission (not working for now)
-- --vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})
--
-- -- Disable continuations
-- keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
-- keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)
--
-- -- Jumplist
-- keymap.set("n", "<C-m>", "<C-i>", opts)
--
-- -- New tab
-- keymap.set("n", "te", ":tabedit")
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- -- Split window
-- keymap.set("n", "ss", ":split<Return>", opts)
-- keymap.set("n", "sv", ":vsplit<Return>", opts)
-- -- Move window
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sl", "<C-w>l")
--
-- -- Resize window
-- keymap.set("n", "<C-w><left>", "<C-w><")
-- keymap.set("n", "<C-w><right>", "<C-w>>")
-- keymap.set("n", "<C-w><up>", "<C-w>+")
-- keymap.set("n", "<C-w><down>", "<C-w>-")
--
-- -- Diagnostics
-- keymap.set("n", "<C-j>", function()
-- 	vim.diagnostic.goto_next()
-- end, opts)
--
-- keymap.set("n", "<leader>r", function()
-- 	require("craftzdog.hsl").replaceHexWithHSL()
-- end)
--
-- keymap.set("n", "<leader>i", function()
-- 	require("craftzdog.lsp").toggleInlayHints()
-- end)
--
-- vim.api.nvim_create_user_command("ToggleAutoformat", function()
-- 	require("craftzdog.lsp").toggleAutoformat()
-- end, {})
