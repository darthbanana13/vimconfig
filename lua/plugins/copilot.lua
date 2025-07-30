return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    build = 'make tiktoken',
    config = function()
      require('telescope').load_extension('ui-select')
      require('CopilotChat').setup({
        highlight_headers = false,
        separator = '---',
        error_header = '> [!ERROR] Error',
      })
    end,
  },
}
