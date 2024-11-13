return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup()

    local builtin = require('telescope.builtin')
    local map = vim.keymap.set
    local cmd = vim.api.nvim_create_user_command

    map('n', '<C-p>', builtin.find_files, {})
    map('n', '<C-e>', builtin.buffers, {})
    map('n', '<leader>gr', builtin.grep_string, {})
    map('n', '<leader>rg', builtin.live_grep, {})

    cmd('Cmd', builtin.commands, {})
    cmd('CmdH', builtin.command_history, {})
    cmd('Reg', builtin.registers, {})
  end
}
