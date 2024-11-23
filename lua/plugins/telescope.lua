return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup()

    local builtin = require('telescope.builtin')
    local map = vim.keymap.set
    local cmd = vim.api.nvim_create_user_command

    map('n', '<C-p>', builtin.find_files, { desc = 'Find file name' })
    map('n', '<C-e>', builtin.buffers, { desc = 'Filter open files' })
    map('n', '<leader>gr', builtin.grep_string, { desc = 'Grep for string in unnamed register' })
    map('n', '<leader>rg', builtin.live_grep, { desc = 'Live search for string' })

    cmd('Cmd', builtin.commands, { desc = 'Filter commands' })
    cmd('CmdH', builtin.command_history, { desc = 'Filter command history' })
    -- cmd('Reg', builtin.registers, { desc = 'Filter through registers' }) -- We have which-key for this, and yanky for history search
  end,
}
