local map = vim.keymap.set
local remap = { noremap = true }
local cmd = vim.api.nvim_create_user_command

-- Map the leader
vim.g.mapleader = ','

-- Easier interaction with the clipboard that does not mess the registers
map({'n', 'v'}, '<leader>d', '"_d', remap)
map({'n', 'v'}, '<leader>p', '"+p', remap)
map({'n', 'v'}, '<leader>P', '"+P', remap)
map({'n', 'v'}, '<leader>l', '"0p', remap)
map({'n', 'v'}, '<leader>L', '"0P', remap)
map({'n', 'v'}, '<leader>y', '"+y', remap)
map({'n', 'v'}, '<leader>c', '"+d', remap)

-- Move lines easily with Shift+Up/Down
map({'n', 'i'}, '<S-Up>', ':m-2<CR>', remap)
map({'n', 'i'}, '<S-Down>', ':m+<CR>', remap)

-- Press // to search for the highlighted text
map('v', '//', [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], remap)

-- Make it easy to edit vim config
map('n', '<leader>ev', ':tabedit $MYVIMRC<CR>', remap)
map('n', '<leader>es', ':tabedit', remap)

-- Possible fix for sudo writing, alternative to lambdalisue/vim-suda. Should be fixed when https://github.com/neovim/neovim/issues/1496#issuecomment-63695965 is closed
map('c', 'w!!', "<esc>:lua require'utils'.sudo_write()<CR>", { silent = true })

map('n', ';', ':', remap)
cmd('Wq', 'wq', {})
cmd('WQ', 'wq', {})
cmd('W', 'w', {})
cmd('Qa', 'qa', {})
cmd('QA', 'qa', {})
cmd('Q', 'q', {})
