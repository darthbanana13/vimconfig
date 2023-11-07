-- Show relative line numbers to where the cursor is for easy jumping
vim.o.relativenumber = true

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Set tab top 4 spaces like a normal person 
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Enable the mose everywhere
 vim.o.mouse = 'a'

-- Alaways store undos, even if the file is closed
vim.o.undofile = true

-- Automatically write the file when switching buffers.
vim.o.autowriteall = true

-- Live preview of search/replace
vim.o.inccommand = 'split'

-- Do case insensitive search unless a capital letter is added to the search term
vim.o.smartcase = true
-- print(vim.o.relativenumber)
