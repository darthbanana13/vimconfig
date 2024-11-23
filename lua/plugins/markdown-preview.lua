return {
  -- Seems to be kind of abandoned by the dev. In the future check for alternatives
  -- Right now main competitors are:
  -- toppair/peek.nvim - this also seems to be abandoned
  -- brianhuster/live-preview.nvim - a lot of work but still small, 73 git stars ATM
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function(plugin)
    if vim.fn.executable 'npx' then
      vim.cmd('!cd ' .. plugin.dir .. ' && cd app && npx --yes yarn install')
    else
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn['mkdp#util#install']()
    end
  end,
  init = function()
    if vim.fn.executable 'npx' then vim.g.mkdp_filetypes = { 'markdown' } end
  end,
}
