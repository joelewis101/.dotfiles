return {
  'tpope/vim-surround',
  'tpope/vim-sleuth',
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      indent = {
        char = "│",
        -- tab_char = { "a", "b", "c" },
        -- highlight = { "Function", "Label" },
        -- smart_indent_cap = true,
        -- priority = 2
      }
    },
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} }
}
