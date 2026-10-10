return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          -- ── CUSTOM MENU BUTTONS ──────────────────────────────────────────
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", action = ":lua Snacks.dashboard.resume()" },
            { icon = "   ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
          -- ── CUSTOM ASCII ART HEADER ──────────────────────────────────────
          header = [[

⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⣶⣶⣶⣶⣆⢰⣦⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣠⣶⣿⣿⣿⣿⣿⡿⢿⣿⣿⠀⣿⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⠃⠀⣿⠿⠛⠀⠻⢿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀
⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠃⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀
⠀⢠⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀
⠀⣾⣿⣿⣿⣿⣿⠿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢹⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀
⢸⣿⣿⣿⣿⣛⡉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⢠⡈⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
⢸⣿⣿⣿⣿⣟⣉⣁⠀⠀⠀⠀⠀⠀⠀⠀⣻⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀⣠⣴⣿⣿⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠙⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇
⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠈⠁⠀⢨⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀
⠀⠈⢿⣿⣿⣿⣿⣿⠿⢿⣿⡇⠀⠀⠀⠀⠀⣤⠀⢸⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀
⠀⠀⠈⢿⣿⣿⣿⠁⣴⣾⡿⠁⠀⠀⠀⠀⠀⠘⡇⢸⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀
⠀⠀⠀⠀⠙⢿⣿⡀⠿⣿⡧⠀⠀⠀⠀⠀⠀⢠⡄⢸⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠙⠻⢶⣤⣤⣾⠀⠀⠀⠀⢠⣼⡇⢸⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠃⠀⠀⠀⠠⠿⠟⠃⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
   @kirankumar
          ]],
        },
        -- ── DASHBOARD LAYOUT SECTIONS ────────────────────────────────────
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
