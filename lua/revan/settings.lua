-- Show relative line numbers to where the cursor is for easy jumping
vim.o.number = true
vim.o.relativenumber = true

-- Customize line numbers, in insert mode use absolute, use relative everywhere else
local numberToggleGroup = vim.api.nvim_create_augroup('numberToggle', { clear = true })
vim.api.nvim_create_autocmd(
  { 'BufEnter', 'FocusGained', 'InsertLeave' },
  {
    callback = function(ev)
      vim.o.relativenumber = true
    end,
    group = numberToggleGroup,
  }
)
vim.api.nvim_create_autocmd(
  { 'BufLeave', 'FocusLost', 'InsertEnter' },
  {
    callback = function(ev)
      vim.o.relativenumber = false
    end,
    group = numberToggleGroup,
  }
)

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Reset the tab value
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

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

-- Set true/24-bit color
vim.o.termguicolors = true

-- Prevent the cursor going back one character when leaving insert
local CursorColumnInsert = 1
-- get the current position of the cursor and store it in the var above
vim.api.nvim_create_autocmd(
  { 'InsertEnter', 'CursorMovedI' },
  {
    callback = function(ev)
      CursorColumnInsert = vim.fn.col('.') 
    end,
  }
)
-- restore the cursor position when leaving insert
vim.api.nvim_create_autocmd(
  'InsertLeave',
  {
    callback = function(ev)
      if vim.fn.col('.') ~= CursorColumnInsert then
        vim.api.nvim_win_set_cursor(0, { vim.fn.line('.'), vim.fn.col('.') })
      end
    end,
  }
)
