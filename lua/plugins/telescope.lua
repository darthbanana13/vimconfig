return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescopeConfig = require("telescope.config")

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- Search in hidden/dot files
    table.insert(vimgrep_arguments, "--hidden")
    -- Don't search in the `.git` directory
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")
    require('telescope').setup({
      defaults = {
        -- `hidden = true` is not supported in text grep commands (rg is the executable used)
        vimgrep_arguments = vimgrep_arguments,
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d
          -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          find_command = {
            "fd",
            "--hidden",
            "--type",
            "f",
            "--exclude",
            ".git",
            "--exclude",
            "node_modules",
            "--strip-cwd-prefix"
          },
        },
      },
    })

    local builtin = require('telescope.builtin')
    local map = vim.keymap.set
    local cmd = vim.api.nvim_create_user_command

    map('n', '<C-p>', builtin.find_files, { desc = 'Find file name' })
    map('n', '<C-e>', builtin.buffers, { desc = 'Filter open files' })
    map('n', '<leader>gr', builtin.grep_string, { desc = 'Grep for string in unnamed register' })
    map('n', '<leader>rg', builtin.live_grep, { desc = 'Live search for string' })

    cmd('Cmd', builtin.commands, { desc = 'Filter commands' })
    cmd('CmdH', builtin.command_history, { desc = 'Filter command history' })
    -- cmd('Reg', builtin.registers, { desc = 'Filter through registers' }) -- We have which-key for this, and yanky for history search
  end,
}
