local opt = vim.opt
local api = vim.api
local autocmd = vim.api.nvim_create_autocmd

-- Show relative line numbers to where the cursor is for easy jumping
opt.number = true
opt.relativenumber = true

-- Customize line numbers, in insert mode use absolute, use relative everywhere else
local numberToggleGroup = api.nvim_create_augroup('numberToggle', { clear = true })
autocmd(
  { 'BufEnter', 'FocusGained', 'InsertLeave' },
  {
    callback = function(ev)
      opt.relativenumber = true
    end,
    group = numberToggleGroup,
  }
)
autocmd(
  { 'BufLeave', 'FocusLost', 'InsertEnter' },
  {
    callback = function(ev)
      opt.relativenumber = false
    end,
    group = numberToggleGroup,
  }
)

-- Use spaces instead of tabs
opt.expandtab = true

-- Reset the tab value
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2

-- Enable the mose everywhere
opt.mouse = 'a'

-- Alaways store undos, even if the file is closed
opt.undofile = true

-- Automatically write the file when switching buffers.
opt.autowriteall = true

-- Live preview of search/replace
opt.inccommand = 'split'

-- Do case insensitive search unless a capital letter is added to the search term
opt.ignorecase = true
opt.smartcase = true

-- Always split to the right & bottom
opt.splitright = true
opt.splitbelow = true

-- Set true/24-bit color
opt.termguicolors = true

-- Prevent the cursor going back one character when leaving insert
local CursorColumnInsert = 1
-- get the current position of the cursor and store it in the var above
autocmd(
  { 'InsertEnter', 'CursorMovedI' },
  {
    callback = function(ev)
      CursorColumnInsert = vim.fn.col('.')
    end,
  }
)
-- restore the cursor position when leaving insert
autocmd(
  'InsertLeave',
  {
    callback = function(ev)
      if vim.fn.col('.') ~= CursorColumnInsert then
        api.nvim_win_set_cursor(0, { vim.fn.line('.'), vim.fn.col('.') })
      end
    end,
  }
)
