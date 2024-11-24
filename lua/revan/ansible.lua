# Fix for ansible-language-server/vscode-ansible (ansiblels) file detection

local ansible_vim_fthosts = vim.api.nvim_create_augroup(
  'ansible_filetype',
  { clear = true }
)

vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  {
    pattern = {
      '*/hosts.yaml',
      '*/hosts.yml',
      '*.pb.yaml',
      '*.pb.yml',
      '*/roles/*.yml',
      '*/roles/*.yaml',
    },
    command = 'set filetype=yaml.ansible',
    group = ansible_vim_fthosts,
  }
)
