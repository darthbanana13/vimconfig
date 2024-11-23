return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add          = { text = '+' },
      change       = { text = '~' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~_' },
      untracked    = { text = '┆' },
    },
    signcolumn = false,         -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true,          -- Toggle with `:Gitsigns toggle_numhl`
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    -- There's a bug now with hunk selection based on lines, until this is fixed use fugitive
    -- on_attach = function(bufnr)
    --   local gitsigns = require('gitsigns')
    --
    --   local function map(mode, l, r, descr)
    --     descr = descr or ''
    --     local opts = {
    --       buffer = bufnr,
    --       desc = descr,
    --     }
    --     vim.keymap.set(mode, l, r, opts)
    --   end
    --
    --   map('n', '<leader>hs', gitsigns.stage_hunk, 'Stage hunk')
    --   map('n', '<leader>hr', gitsigns.reset_hunk, 'Reset hunk')
    --   map('v', '<leader>hs', function() gitsigns.stage_hunk({vim.fn.line('.'), vim.fn.line('v')}, { greedy = false }) end, 'Stage hunk')
    --   map('v', '<leader>hr', function() gitsigns.reset_hunk({vim.fn.line('.'), vim.fn.line('v')}, { greedy = false }) end, 'Reset hunk')
    --   map('n', '<leader>hS', gitsigns.stage_buffer, 'Stage buffer')
    --   map('n', '<leader>hu', gitsigns.undo_stage_hunk, 'Undo stage buffer')
    --   map('n', '<leader>hR', gitsigns.reset_buffer, 'Reset buffer')
    --   map('n', '<leader>hp', gitsigns.preview_hunk, 'Preview hunk')
    -- end,
  },
}
