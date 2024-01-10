return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>cF",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "format buffer using conform.nvim",
    },
    {
      "<leader>cf",
      function()
        require("conform").format({ formatters = { "injected" }, lsp_fallback = true, timeout_ms = 2000 })
      end,
      mode = { "n", "v" },
      desc = "format injected langs with conform.nvim",
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      r = { "joeform" },
    },
    log_level = vim.log.levels.OFF,
    formatters = {
      injected = { options = { ignore_errors = true, lsp_fallback = true } },
      joeform = {
        inherit = false,
        command = "Rscript",
        args = { "/Users/joelewis/.config/nvim/style.R", "$FILENAME" },
        stdin = false
      }
    },   -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },
}
