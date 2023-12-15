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
      -- enabled = true,
      -- char = '┊'
      -- show_trailing_blankline_indent = false,
      -- show_current_context = true
    },
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} }
}
