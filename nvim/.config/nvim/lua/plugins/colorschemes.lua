return{

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000
    -- config = function()
    --   vim.cmd.colorscheme 'onedark'
    -- end,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  }
}
