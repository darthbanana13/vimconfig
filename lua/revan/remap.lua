-- Map the leader
vim.g.mapleader = ','

-- Easier interaction with the clipboard that does not mess the registers
vim.keymap.set({'n', 'v'}, '<Leader>d', '"_d', { remap = true })
vim.keymap.set({'n', 'v'}, '<Leader>p', '"+p', { remap = true })
vim.keymap.set({'n', 'v'}, '<Leader>P', '"+P', { remap = true })
vim.keymap.set({'n', 'v'}, '<Leader>l', '"0p', { remap = true })
vim.keymap.set({'n', 'v'}, '<Leader>L', '"0P', { remap = true })
vim.keymap.set({'n', 'v'}, '<Leader>y', '"+y', { remap = true })
vim.keymap.set({'n', 'v'}, '<Leader>c', '"+d', { remap = true })

-- Move lines easily with Shift+Up/Down
vim.keymap.set({'n', 'i'}, '<S-Up>', ':m-2<CR>', { remap = true })
vim.keymap.set({'n', 'i'}, '<S-Down>', ':m+<CR>', { remap = true })
