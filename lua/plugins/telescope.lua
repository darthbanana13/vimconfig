return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup()

    local builtin = require('telescope.builtin')
    local map = vim.keymap.set

    map('n', '<C-p>', builtin.find_files, {})
    map('n', '<C-e>', builtin.buffers, {})
    map('n', '<leader>rg', builtin.grep_string, {})
    map('n', '<leader>gr', builtin.live_grep, {})
  end
}
