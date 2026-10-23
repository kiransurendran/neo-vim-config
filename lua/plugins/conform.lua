return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      ["clang-format"] = {
        -- Appends a fallback style configuration forcing a 4-space indent
        prepend_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4}" },
      },
    },
    -- formatters_by_ft = {
    --   lua = { "stylua" },
    --   c = { "clang_format" },
    --   cpp = { "clang_format" },
    -- },
  },
}
