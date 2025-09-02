return {
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", },
      { "nvimtools/none-ls.nvim", },
      { "davidmh/cspell.nvim" },
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "codespell", "cspell" },
        automatic_installation = true,
        handlers = {},
      })
      local cspell = require("cspell")
      local null_ls = require("null-ls")
      local b = null_ls.builtins
      require("null-ls").setup({
        sources = {
          b.diagnostics.codespell,
          cspell.diagnostics.with({
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity.HINT
            end,
          }),
          cspell.code_actions,
          b.completion.spell,
        }
      })
    end,
  },
}
