return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'bluz71/vim-moonfly-colors',
  },
  config = function()
    vim.cmd.colorscheme("moonfly")
    vim.opt.termguicolors = true
    require('bufferline').setup {}
  end
}
