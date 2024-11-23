return {
  'gbprod/yanky.nvim',
  dependencies = {
    'kkharji/sqlite.lua',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('yanky').setup({
      ring = {
        storage = 'sqlite',
      },
      highlight = {
        on_put = false,
        on_yank = false,
      },
    })

    local cmd = vim.api.nvim_create_user_command
    local map = vim.keymap.set
    local remap = { noremap = true }

    map({'n','x'}, 'y', '<Plug>(YankyYank)')
    map({'n','x'}, 'p', '<Plug>(YankyPutAfter)', remap)
    map({'n','x'}, 'P', '<Plug>(YankyPutBefore)', remap)
    map({'n','x'}, 'gp', '<Plug>(YankyGPutAfter)')
    map({'n','x'}, 'gP', '<Plug>(YankyGPutBefore)')
    map({'n','x'}, 'gP', '<Plug>(YankyGPutBefore)')
    map({'n','x'}, 'gP', '<Plug>(YankyGPutBefore)')
    map('n', '<C-n>', '<Plug>(YankyPreviousEntry)', remap)
    map('n', '<C-g>', '<Plug>(YankyNextEntry)', remap)

    map('n', ']p', '<Plug>(YankyPutIndentAfterLinewise)')
    map('n', '[p', '<Plug>(YankyPutIndentBeforeLinewise)')
    map('n', ']P', '<Plug>(YankyPutIndentAfterLinewise)')
    map('n', '[P', '<Plug>(YankyPutIndentBeforeLinewise)')

    map('n', '>p', '<Plug>(YankyPutIndentAfterShiftRight)')
    map('n', '<p', '<Plug>(YankyPutIndentAfterShiftLeft)')
    map('n', '>P', '<Plug>(YankyPutIndentBeforeShiftRight)')
    map('n', '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)')

    map('n', '=p', '<Plug>(YankyPutAfterFilter)')
    map('n', '=P', '<Plug>(YankyPutBeforeFilter)')
    -- require('telescope').load_extension('yank_history')
    cmd('Reg', require('telescope').extensions.yank_history.yank_history, { desc = 'Filter through registers' })
  end,
}
