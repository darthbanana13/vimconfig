return {
  "ggandor/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local map = vim.keymap.set

    map('n',        's', '<Plug>(leap)')
    map('n',        'S', '<Plug>(leap-from-window)')
    map({'x', 'o'}, 's', '<Plug>(leap-forward)')
    map({'x', 'o'}, 'S', '<Plug>(leap-backward)')

    local opts = require('leap').opts
    -- Define equivalence classes for brackets and quotes, in addition to
    -- the default whitespace group.
    opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
    -- Disable auto-jumping to the first match
    opts.safe_labels = {}

    -- Use the traversal keys to repeat the previous motion without explicitly
    -- invoking Leap.
    require('leap.user').set_repeat_keys('<enter>', '<backspace>')

    map({'n', 'x', 'o'}, 'ga',  function ()
      local sk = vim.deepcopy(require('leap').opts.special_keys)
      -- The items in `special_keys` can be both strings or tables - the
      -- shortest workaround might be the below one:
      sk.next_target = vim.fn.flatten(vim.list_extend({'a'}, {sk.next_target}))
      sk.prev_target = vim.fn.flatten(vim.list_extend({'A'}, {sk.prev_target}))

      require('leap.treesitter').select { opts = { special_keys = sk } }
    end)

    -- Linewise.
    map({'n', 'x', 'o'}, 'gA',
      'V<cmd>lua require("leap.treesitter").select()<cr>'
    )
  end,
}
