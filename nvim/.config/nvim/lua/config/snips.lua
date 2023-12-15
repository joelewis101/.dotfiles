-- Joe snippets


local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local text = ls.text_node

ls.add_snippets(nil, {
  mail = {
    snip({
      trig = "Ch",
      namr = "Cheers sign off",
      dscr = "Cheers sign off",
    }, {
      text({'Cheers,',
      'Joe'})
    }),
  },
})

