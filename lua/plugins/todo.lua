return {
  {
    'folke/todo-comments.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'folke/trouble.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    opts = {
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
        TODO = { icon = " ", color = "info", signs = false, },
        HACK = { icon = " ", color = "warning", },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", }, },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", }, },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" }, signs = false, },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" }, },
      },
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "todo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
      },
      gui_style = {
        fg = 'NONE',
        bg = 'NONE',
      },
    },
  },
}
