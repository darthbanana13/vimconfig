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
        ensure_installed = { "codespell", "cspell", },
        automatic_installation = true,
        handlers = {},
      })
      local null_ls = require("null-ls")
      local cspell = require("cspell")
      local builtins = null_ls.builtins
      local methods = null_ls.methods

      -- Run only on open and save (not on every change)
      local codespell_on_open = builtins.diagnostics.codespell.with({
        method = methods.DIAGNOSTICS_ON_OPEN,
      })
      local codespell_on_save = builtins.diagnostics.codespell.with({
        method = methods.DIAGNOSTICS_ON_SAVE,
      })

      local cspell_on_open = cspell.diagnostics.with({
        method = methods.DIAGNOSTICS_ON_OPEN,
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity.HINT
        end,
      })
      local cspell_on_save = cspell.diagnostics.with({
        method = methods.DIAGNOSTICS_ON_SAVE,
        diagnostics_postprocess = function(diagnostic)
          diagnostic.severity = vim.diagnostic.severity.HINT
        end,
      })

      null_ls.setup({
        sources = {
          codespell_on_open,
            codespell_on_save,
            cspell_on_open,
            cspell_on_save,
            cspell.code_actions,
            builtins.completion.spell,
        },
      })
    end,
  },
}

