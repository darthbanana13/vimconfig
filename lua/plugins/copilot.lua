return {
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
    },
    config = function ()
      require('copilot_cmp').setup()
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { "nvim-lua/plenary.nvim"},
    },
    build = "make tiktoken",
    opts = {
    },
  },
}
