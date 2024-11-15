return {
  "chaoren/vim-wordmotion",
  init = function()
    local map = vim.keymap.set
    local remap = { silent = true, noremap = true }
    local global = vim.g

    map({'n', 'v', 's'}, '<leader>w', 'W', remap)
    map({'n', 'v', 's'}, '<leader>b', 'B', remap)
    map({'n', 'v', 's'}, '<leader>e', 'E', remap)
    map({'n', 'v', 's'}, 'g<leader>e', 'gE', remap)

    map({'o', 'x'}, 'i<leader>w', 'iW', remap)
    map({'o', 'x'}, 'i<leader>b', 'iB', remap)
    map({'o', 'x'}, 'i<leader>e', 'iE', remap)
    map({'o', 'x'}, 'gi<leader>e', 'giE', remap)

    map({'n', 'v', 's'}, 'W', 'w', remap)
    map({'n', 'v', 's'}, 'B', 'b', remap)
    map({'n', 'v', 's'}, 'E', 'e', remap)
    map({'n', 'v', 's'}, 'gE', 'ge', remap)

    map({'o', 'x'}, 'iW', 'iw', remap)
    map({'o', 'x'}, 'iB', 'ib', remap)
    map({'o', 'x'}, 'iE', 'ie', remap)
    map({'o', 'x'}, 'giE', 'gie', remap)

    global.wordmotion_mappings = {
      w = 'w',
      b = 'b',
      e = 'e',
      ge = 'ge',
      aw = 'aw',
      iw = 'iw',
    }
    global.wordmotion_mappings['<C-R><C-W>'] = '<C-R><C-w>'
    global.wordmotion_spaces = '_-.'

  end,
}
