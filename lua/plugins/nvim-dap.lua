return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio'
    },
    config = function()
      local map, dap, dapui = vim.keymap.set, require('dap'), require('dapui')

      map('n', '<F6>', dap.continue, { desc = 'Continue DAP' })
      map('n', '<F7>', dap.step_over, { desc = 'Step Over DAP' })
      map('n', '<F8>', dap.step_into, { desc = 'Step Into DAP' })
      map('n', '<F9>', dap.step_out, { desc = 'Step Out DAP' })
      map('n', '<F10>', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint DAP' })

      dapui.setup()

      map('n', '<F11>', dapui.toggle, { desc = 'Toggle DAP UI' })
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    -- config here is similar to mason-lspconfig
    opts = {
      ensure_installed = {},
      automatic_installation = {
        exclude = { 'delve' }, -- we handle delve with leoluz/nvim-dap-go
      },
      -- handlers = {
      --   function(config)
      --     -- Add DAP installs with no specific handler use this function
      --
      --     -- Keep original functionality
      --     require('mason-nvim-dap').default_setup(config)
      --   end,
      --   delve = function(config)
      --     require('mason-nvim-dap').default_setup(config)
      --
      --     -- The configs used here are taken from:
      --     -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
      --     -- https://github.com/leoluz/nvim-dap-go/blob/main/README.md#debugging-with-build-flags
      --     require('dap').configurations.go = {
      --       {
      --         type = 'delve',
      --         name = 'Debug (Build Flags & Arguments)',
      --         request = 'launch',
      --         program = '${file}',
      --       },
      --       {
      --         type = 'delve',
      --         name = 'Debug test',
      --         request = 'launch',
      --         program = '${file}',
      --         mode = 'test',
      --       },
      --       {
      --         type = 'delve',
      --         name = 'Debug test (go.mod)',
      --         request = 'launch',
      --         program = "./${relativeFileDirname}",
      --         mode = 'test',
      --       },
      --     }
      --   end,
      -- },
    },
  },
  {
    'leoluz/nvim-dap-go',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    ft = 'go',
    config = function()
      require('dap-go').setup {
        dap_configurations = {
          {
            type = 'go',
            name = 'Debug (Build Flags)',
            request = 'launch',
            program = '${file}',
            buildFlags = require('dap-go').get_build_flags,
          },
        },
      }
    end,
  },
}
