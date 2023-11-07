return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 
        'bash',
        'comment',
        'css',
        'diff',
        'dockerfile',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'gomod',
        'gosum',
        'gowork',
				'html',
				'javascript',
        'json',
				'lua',
        'make',
        'markdown',
        'python',
				'query',
        'regex',
        'requirements',
				'vim',
				'vimdoc',
        'xml',
        'yaml',
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true , additional_vim_regex_highlighting = false },
      indent = { enable = true },  
    })
  end
}
 
