return {
  {
    'olimorris/codecompanion.nvim',
    version = '^18.0.0',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
      { 'franco-ruggeri/codecompanion-spinner.nvim' },
      { 'ravitemer/mcphub.nvim' },
    },
    opts = {
      extensions = {
        spinner = {},
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            -- MCP Tools
            make_tools = true,              -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
            show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
            add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
            show_result_in_chat = true,      -- Show tool results directly in chat buffer
            format_tool = nil,               -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
            -- MCP Resources
            make_vars = true,                -- Convert MCP resources to #variables for prompts
            -- MCP Prompts
            make_slash_commands = true,      -- Add MCP prompts as /slash commands
          }
        },
      },
      interactions = {
        chat = {
          adapter = {
            name = 'ollama',
            model = 'qwen3-coder:30b',
          },
          opts = {
            completion_provider = 'blink',
          },
        },
        inline = {
          adapter = {
            name = 'ollama',
            model = 'qwen3-coder:30b',
          },
        },
        cmd = {
          adapter = {
            name = 'ollama',
            model = 'qwen3-coder:30b',
          },
        },
        background = {
          adapter = {
            name = 'ollama',
            model = 'qwen3-coder:30b',
          },
          chat = {
            callbacks = {
              ['on_ready'] = {
                actions = {
                  'interactions.background.builtin.chat_make_title',
                },
                -- Enable "on_ready" callback which contains the title generation action
                enabled = true,
              },
            },
            opts = {
              -- Enable background interactions generally
              enabled = true,
            },
          },
        },
      },
    },
  },
}
