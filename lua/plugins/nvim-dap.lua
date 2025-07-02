return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio'
    },
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    -- config here is similar to mason-lspconfig
    opts = {
      ensure_installed = {},
      handlers = {
        function(config)
          -- Add DAP installs with no specific handler use this function

          -- Keep original functionality
          require('mason-nvim-dap').default_setup(config)
        end,
        delve = function(config)
          require('mason-nvim-dap').default_setup(config)

          -- The configs used here are taken from:
          -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#go-using-delve-directly
          -- https://github.com/leoluz/nvim-dap-go/blob/main/README.md#debugging-with-build-flags
          require('dap').configurations.go = {
            {
              type = 'delve',
              name = 'Debug (Build Flags & Arguments)',
              request = 'launch',
              program = '${file}',
            },
            {
              type = 'delve',
              name = 'Debug test',
              request = 'launch',
              program = '${file}',
              mode = 'test',
            },
            {
              type = 'delve',
              name = 'Debug test (go.mod)',
              request = 'launch',
              program = "./${relativeFileDirname}",
              mode = 'test',
            },
          }
        end,
      },
    },
  },
}
