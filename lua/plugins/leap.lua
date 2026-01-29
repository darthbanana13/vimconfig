return {
  url = "https://codeberg.org/andyg/leap.nvim",
  dependencies = {
    'tpope/vim-repeat',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local map = vim.keymap.set

    -- Replacement for native mappings
    -- Normal mode:
    -- s = cl (or xi)
    -- S = CC
    --
    -- Visual mode:
    -- s = c
    -- S = Vc or c if already in linewise mode
    -- For more :h leap-custom-mappings
    map('n',        's', '<Plug>(leap)', { desc='Leap to next two typed letter location' })
    map('n',        'S', '<Plug>(leap-from-window)', { desc='Leap to next other window\'s two type letter' })
    map({'x', 'o'}, 's', '<Plug>(leap-forward)', { desc='Leap to the next group' })
    map({'x', 'o'}, 'S', '<Plug>(leap-backward)', { desc='Leap to the previous group' })

    local opt = require('leap').opts
    -- Define equivalence classes for brackets and quotes, in addition to
    -- the default whitespace group.
    opt.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
    -- Disable auto-jumping to the first match
    opt.safe_labels = {}

    -- Use the traversal keys to repeat the previous motion without explicitly
    -- invoking Leap.
    require('leap.user').set_repeat_keys('<enter>', '<backspace>')

    map({'n', 'x', 'o'}, 'ga',  function ()
      local sk = vim.deepcopy(opt.special_keys)
      -- The items in `special_keys` can be both strings or tables - the
      -- shortest workaround might be the below one:
      sk.next_target = vim.fn.flatten(vim.list_extend({'a'}, {sk.next_target}))
      sk.prev_target = vim.fn.flatten(vim.list_extend({'A'}, {sk.prev_target}))

      require('leap.treesitter').select { opts = { special_keys = sk } }
    end)
  end,
}
