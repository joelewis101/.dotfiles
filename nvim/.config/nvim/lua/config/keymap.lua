local wk = require("which-key")

-- disable arrow keys!
wk.add(
  {
    { "<Up>",    "Nop>" },
    { "<Down>",  "<Nop>" },
    { "<Left>",  "<Nop>" },
    { "<Right>", "<Nop>" }
  },
  { mode = { "n", "v", "i" } }
)

local function toggle_diagnostics()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
    print("Diagnostics OFF")
  else
    vim.diagnostic.enable()
    print("Diagnostics ON")
  end
end


-- normal mode leader mappings
wk.add(
  {
    {
      { "<leader><cr>",    "<Plug>SlimeSendCell",                                                                       desc = "send code cell" },
      { "<leader><space>", ':lua require("telescope.builtin").buffers({sort_mru=true,ignore_current_buffer=true})<cr>', desc = "Telescope buffers" },
      { "<leader>c",       group = "code" },
      { "<leader>c,",      ":.s/, /,\\r/g<CR>",                                                                         desc = "split line on ," },
      { "<leader>cc",      group = "set conceal level" },
      { "<leader>cc0",     "<cmd>set conceallevel=0<cr>",                                                               desc = "conceallevel 0" },
      { "<leader>cc1",     "<cmd>set conceallevel=1<cr>",                                                               desc = "conceallevel 1" },
      { "<leader>cc2",     "<cmd>set conceallevel=2<cr>",                                                               desc = "conceallevel 2" },
      { "<leader>cc3",     "<cmd>set conceallevel=3<cr>",                                                               desc = "conceallevel 3" },
      { "<leader>cd",      toggle_diagnostics,                                                                          desc = "toggle diagnostics" },
      { "<leader>cq",      vim.diagnostic.setqflist,                                                                    desc = "add diagnostics to quickfix list" },
      { "<leader>cs",      ":SlimeConfig<cr>",                                                                          desc = "slime config" },
      { "<leader>e",       "<cmd>:Oil<cr>",                                                                             desc = "explore filetree" },
      { "<leader>f",       group = "find (telescope)" },
      { "<leader>fM",      "<cmd>Telescope man_pages<cr>",                                                              desc = "man pages" },
      { "<leader>fb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",                                              desc = "fuzzy" },
      { "<leader>fc",      "<cmd>Telescope git_commits<cr>",                                                            desc = "git commits" },
      { "<leader>fd",      "<cmd>Telescope buffers<cr>",                                                                desc = "buffers" },
      { "<leader>ff",      "<cmd>Telescope find_files<cr>",                                                             desc = "files" },
      { "<leader>fg",      "<cmd>Telescope live_grep<cr>",                                                              desc = "grep" },
      { "<leader>fh",      "<cmd>Telescope help_tags<cr>",                                                              desc = "help" },
      { "<leader>fj",      "<cmd>Telescope jumplist<cr>",                                                               desc = "marks" },
      { "<leader>fk",      "<cmd>Telescope keymaps<cr>",                                                                desc = "keymaps" },
      { "<leader>fl",      "<cmd>Telescope loclist<cr>",                                                                desc = "loclist" },
      { "<leader>fm",      "<cmd>Telescope marks<cr>",                                                                  desc = "marks" },
      { "<leader>fo",      "<cmd>Telescope colorscheme<cr>",                                                            desc = "c[o]lortheme" },
      { "<leader>fp",      desc = "project" },
      { "<leader>fq",      "<cmd>Telescope quickfix<cr>",                                                               desc = "quickfix" },
      { "<leader>fr",      "<cmd>Telescope lsp_references<cr>",                                                         desc = "references" },
      { "<leader>fs",      "<cmd>Telescope lsp_document_symbols<cr>",                                                   desc = "symbols" },
      { "<leader>g",       group = "git" },
      { "<leader>gb",      group = "blame" },
      { "<leader>gbb",     ":GitBlameToggle<cr>",                                                                       desc = "toggle" },
      { "<leader>gbc",     ":GitBlameCopyCommitURL<cr>",                                                                desc = "copy" },
      { "<leader>gbo",     ":GitBlameOpenCommitURL<cr>",                                                                desc = "open" },
      { "<leader>gc",      ":GitConflictRefresh<cr>",                                                                   desc = "conflict" },
      { "<leader>gd",      group = "diff" },
      { "<leader>gdc",     ":DiffviewClose<cr>",                                                                        desc = "close" },
      { "<leader>gdo",     ":DiffviewOpen<cr>",                                                                         desc = "open" },
      { "<leader>gg",      ":Neogit<cr>",                                                                               desc = "neogit" },
      { "<leader>gs",      ":Gitsigns<cr>",                                                                             desc = "gitsigns" },
      { "<leader>gwc",     ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",               desc = "worktree create" },
      { "<leader>gws",     ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",                     desc = "worktree switch" },
      { "<leader>l",       group = "lsp" },
      { "<leader>lD",      vim.lsp.buf.type_definition,                                                                 desc = "type definition" },
      { "<leader>lR",      desc = "rename" },
      { "<leader>la",      vim.lsp.buf.code_action,                                                                     desc = "code action" },
      { "<leader>lf",      vim.lsp.buf.format,                                                                          desc = "format buffer with LSP" },
      { "<leader>lm",      ":Mason<cr>",                                                                                desc = "Mason" },
      { "<leader>lr",      "<cmd>Telescope lsp_references<cr>",                                                         desc = "references" },
      { "<leader>p",       group = "pipe buffer to ..." },
      { "<leader>pk",      "<cmd>:new | r ! khal printics #<cr>",                                                       desc = "khal printics" },
      { "<leader>q",       group = "quarto" },
      { "<leader>qE",      ":lua require'otter'.export(true)<cr>",                                                      desc = "otter export overwrite" },
      { "<leader>qa",      ":QuartoActivate<cr>",                                                                       desc = "activate" },
      { "<leader>qe",      ":lua require'otter'.export()<cr>",                                                          desc = "otter export" },
      { "<leader>qh",      ":QuartoHelp ",                                                                              desc = "help" },
      { "<leader>qo",      ":lua require'otter'.dev_setup",                                                             desc = "otter activate" },
      { "<leader>qp",      ":lua require'quarto'.quartoPreview()<cr>",                                                  desc = "preview" },
      { "<leader>qq",      ":lua require'quarto'.quartoClosePreview()<cr>",                                             desc = "preview close" },
      { "<leader>s",       group = "spellcheck" },
      { "<leader>s/",      "<cmd>setlocal spell!<cr>",                                                                  desc = "spellcheck" },
      { "<leader>s?",      "<cmd>Telescope spell_suggest<cr>",                                                          desc = "suggest" },
      { "<leader>sg",      "zg",                                                                                        desc = "good" },
      { "<leader>sn",      "]s",                                                                                        desc = "next" },
      { "<leader>sp",      "[s",                                                                                        desc = "previous" },
      { "<leader>ss",      "<cmd>Telescope spell_suggest<cr>",                                                          desc = "spelling" },
      { "<leader>sw",      "zw",                                                                                        desc = "wrong" },
      { "<leader>t",       group = "treesitter" },
      { "<leader>tc",      ":=vim.treesitter.get_captures_at_cursor()<cr>",                                             desc = "show capture" },
      { "<leader>tn",      ":=vim.treesitter.get_node():type()<cr>",                                                    desc = "show node" },
      { "<leader>tt",      vim.treesitter.inspect_tree,                                                                 desc = "show tree" },
    },
    { mode = { "n" } }
  }
)
-- normal mode other mappings

wk.add(
  {
    { "<c-t>",      "<cmd>Telescope find_files<cr>" },
    { "<c-b>",      "<cmd>:UrlView<cr>",              desc = "oprn urlviewer" },
    { "<c-e>",      "<cmd>:Oil<cr>",                  desc = "explore filetree" },
    { "<esc>",      "<cmd>noh<cr>",                   desc = "remove search highlight" },
    { "[b",         "<cmd>bprevious<cr>",             desc = "buffer prev" },
    { "[q",         ":silent cprev<cr>",              desc = "quickfix prev" },
    { "]b",         "<cmd>bnext<cr>",                 desc = "buffer next" },
    { "]q",         ":silent cnext<cr>",              desc = "quickfix next" },
    { "<c-c><c-c>", "<Plug>SlimeParagraphSend<Esc> ]" },
    -- Resize window using <shift> arrow keys
    { "<S-Up>",     "<cmd>resize +2<CR>" },
    { "<S-Down>",   "<cmd>resize -2<CR>" },
    { "<S-Left>",   "<cmd>vertical resize -2<CR>" },
    { "<S-Right>",  "<cmd>vertical resize +2<CR>" }
  },
  { mode = { "n" } }
)

-- visual mode
wk.add(
  {
    { "<cr>", "<Plug>SlimeRegionSend" }
  },
  { mode = { "v" } }
)

-- insert mode
wk.add(
  {
    { "¯", "|>" }
  },
  { mode = { "v" } }
)
