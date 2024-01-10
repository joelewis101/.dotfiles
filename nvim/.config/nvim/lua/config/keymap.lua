local wk = require("which-key")

P = function(x)
  print(vim.inspect(x))
  return (x)
end

RELOAD = function(...)
  return require 'plenary.reload'.reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

local nmap = function(key, effect)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true })
end

local vmap = function(key, effect)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true })
end

local imap = function(key, effect)
  vim.keymap.set('i', key, effect, { silent = true, noremap = true })
end

-- buffers
-- nmap("[b", "<cmd>bprevious<cr>")
-- nmap("]b", "<cmd>bnext<cr>")

-- disable arrow keys!
--
--

nmap("<Up>", "<Nop>")
nmap("<Down>", "<Nop>")
nmap("<Left>", "<Nop>")
nmap("<Right>", "<Nop>")
imap("<Up>", "<Nop>")
imap("<Down>", "<Nop>")
imap("<Left>", "<Nop>")
imap("<Right>", "<Nop>")
vmap("<Up>", "<Nop>")
vmap("<Down>", "<Nop>")
vmap("<Left>", "<Nop>")
vmap("<Right>", "<Nop>")

-- Resize window using <shift> arrow keys
nmap("<S-Up>", "<cmd>resize +2<CR>")
nmap("<S-Down>", "<cmd>resize -2<CR>")
nmap("<S-Left>", "<cmd>vertical resize -2<CR>")
nmap("<S-Right>", "<cmd>vertical resize +2<CR>")

-- Add undo break-points
imap(",", ",<c-g>u")
imap(".", ".<c-g>u")
imap(";", ";<c-g>u")

nmap('Q', '<Nop>')

imap("µ", "%>%")
imap("˜", "|>")
-- send code with ctrl+Enter
-- just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u
-- nmap('<c-cr>', '<Plug>SlimeSendCell')
-- nmap('<s-cr>', '<Plug>SlimeSendCell')
-- imap('<c-cr>', '<esc><Plug>SlimeSendCell<cr>i')
-- imap('<s-cr>', '<esc><Plug>SlimeSendCell<cr>i')

-- send code with Enter and leader Enter
vmap('<cr>', '<Plug>SlimeRegionSend')

-- keep selection after indent/dedent
vmap('>', '>gv')
vmap('<', '<gv')

-- remove search highlight on esc
nmap('<esc>', '<cmd>noh<cr>')

-- find files with telescope
nmap('<c-t>', "<cmd>Telescope find_files<cr>")

-- paste and without overwriting register
vmap("<leader>p", "\"_dP")

-- delete and without overwriting register
vmap("<leader>d", "\"_d")

-- center after search and jumps
nmap('n', "nzz")
nmap('<c-d>', '<c-d>zz')
nmap('<c-u>', '<c-u>zz')

local function toggle_diagnostics()
  if vim.diagnostic.is_disabled() then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end
--show kepbindings with whichkey
wk.register(

  {
    ['<cr>'] = { "<Plug>SlimeSendCell", "send code cell" },
    ['<space>'] = { "<cmd>Telescope buffers<cr>", "Telescope buffers" },
    c = {
      name = 'code',
      c = {
        name = "set conceal level",
        ['0'] = { '<cmd>set conceallevel=0<cr>', "conceallevel 0"},
        ['1'] = { '<cmd>set conceallevel=1<cr>', "conceallevel 1"},
        ['2'] = { '<cmd>set conceallevel=2<cr>', "conceallevel 2"},
        ['3'] = { '<cmd>set conceallevel=3<cr>', "conceallevel 3"},
      },
      s    = { ':SlimeConfig<cr>', 'slime config' },
      [','] = { ':.s/, /,\\r/g<CR>', 'split line on ,' },
      d    = { toggle_diagnostics, "toggle diagnostics" },
      q    = { vim.diagnostic.setqflist, "add diagnostics to quickfix list" }
    },
    l = {
      name = 'lsp',
      r    = { '<cmd>Telescope lsp_references<cr>', 'references' },
      R    = { 'rename' },
      D    = { vim.lsp.buf.type_definition, 'type definition' },
      a    = { vim.lsp.buf.code_action, 'code action' },
      f    = { vim.lsp.buf.format, 'format buffer with LSP' },
      m    = { ':Mason<cr>', 'Mason' }
    },
    q = {
      name = 'quarto',
      a    = { ":QuartoActivate<cr>", 'activate' },
      p    = { ":lua require'quarto'.quartoPreview()<cr>", 'preview' },
      q    = { ":lua require'quarto'.quartoClosePreview()<cr>", 'close' },
      h    = { ":QuartoHelp ", 'help' },
      o    = { require 'otter'.dev_setup, 'otter activate' },
      e    = { ":lua require'otter'.export()<cr>", 'otter export' },
      E    = { ":lua require'otter'.export(true)<cr>", 'otter export overwrite' },
    },
    e = { "<cmd>:Oil<cr>", "explore filetree" },
    f = {
      name = 'find (telescope)',
      f = { '<cmd>Telescope find_files<cr>', 'files' },
      h = { '<cmd>Telescope help_tags<cr>', 'help' },
      k = { '<cmd>Telescope keymaps<cr>', 'keymaps' },
      r = { '<cmd>Telescope lsp_references<cr>', 'references' },
      g = { "<cmd>Telescope live_grep<cr>", "grep" },
      b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
      m = { "<cmd>Telescope marks<cr>", "marks" },
      M = { "<cmd>Telescope man_pages<cr>", "man pages" },
      c = { "<cmd>Telescope git_commits<cr>", "git commits" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
      d = { "<cmd>Telescope buffers<cr>", "buffers" },
      q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
      l = { "<cmd>Telescope loclist<cr>", "loclist" },
      j = { "<cmd>Telescope jumplist<cr>", "marks" },
      o = { '<cmd>Telescope colorscheme<cr>', 'c[o]lortheme' },
      p = { "project" },
    },
    t = {
      name = 'treesitter',
      t = { vim.treesitter.inspect_tree, 'show tree' },
      c = { ':=vim.treesitter.get_captures_at_cursor()<cr>', 'show capture' },
      n = { ':=vim.treesitter.get_node():type()<cr>', 'show node' },
    },
    s = {
      name = "spellcheck",
      s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
      ['/'] = { '<cmd>setlocal spell!<cr>', 'spellcheck' },
      n = { ']s', 'next' },
      p = { '[s', 'previous' },
      g = { 'zg', 'good' },
      r = { 'zg', 'right' },
      w = { 'zw', 'wrong' },
      b = { 'zw', 'bad' },
      ['?'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
    },
    g = {
      name = "git",
      c = { ":GitConflictRefresh<cr>", 'conflict' },
      g = { ":Neogit<cr>", "neogit" },
      s = { ":Gitsigns<cr>", "gitsigns" },
      pl = { ":Octo pr list<cr>", "gh pr list" },
      pr = { ":Octo review start<cr>", "gh pr review" },
      wc = { ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "worktree create" },
      ws = { ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "worktree switch" },
      d = {
        name = 'diff',
        o = { ':DiffviewOpen<cr>', 'open' },
        c = { ':DiffviewClose<cr>', 'close' },
      },
      b = {
        name = 'blame',
        b = { ':GitBlameToggle<cr>', 'toggle' },
        o = { ':GitBlameOpenCommitURL<cr>', 'open' },
        c = { ':GitBlameCopyCommitURL<cr>', 'copy' },
      }
    },
  }, { mode = 'n', prefix = '<leader>' }
)
-- normal mode
wk.register({
  ['<c-LeftMouse>'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'go to definition' },
  ["<c-e>"]         = { '<cmd>:Oil<cr>', 'explore filetree'},
  ['<esc>']         = { '<cmd>noh<cr>', 'remove search highlight' },
  [']q']            = {':silent cnext<cr>', 'quickfix next'},
  ['[q']            = {':silent cprev<cr>', 'quickfix prev'},
  [']b']            = {'<cmd>bnext<cr>', 'buffer next'},
  ['[b']            = {'<cmd>bprevious<cr>', 'buffer prev'},

}, { mode = 'n', silent = true })


-- visual mode
wk.register({
  ['<cr>'] = { '<Plug>SlimeRegionSend', 'run code region' },
  ['<M-j>'] = { ":m'>+<cr>`<my`>mzgv`yo`z", 'move line down' },
  ['<M-k>'] = { ":m'<-2<cr>`>my`<mzgv`yo`z", 'move line up' },
  ['.'] = { ':norm .<cr>', 'repat last normal mode command' },
  ['q'] = { ':norm @q<cr>', 'repat q macro' },
}, { mode = 'v' })

wk.register({
  ['<leader>'] = { '<Plug>SlimeRegionSend', 'run code region' },
  ['p'] = { '"_dP', 'replace without overwriting reg' },
}, { mode = 'v', prefix = "<leader>" })

wk.register({
  -- ['<c-e>'] = { "<esc>:FeMaco<cr>i", "edit code" },
  ['<m-->'] = { ' <- ', "assign" },
  ['<m-m>'] = { ' |>', "pipe" },
  ['<m-i>'] = { '```{r}<cr>```<esc>O', "r code chunk" },
  ['<cm-i>'] = { '<esc>o```{python}<cr>```<esc>O', "r code chunk" },
  ['<m-I>'] = { '<esc>o```{python}<cr>```<esc>O', "r code chunk" },
}, { mode = 'i' })

-- norg

-- failed attempt to use Neorg with which key

-- _G.whichkeyNorg = function()
--   local buf = vim.api.nvim_get_current_buf()
--   wk.register({
--      i = {
--       name = "Neorg insert", -- buffer = buf,
--       -- { b = { "<cmd>:pwd<cr>", "banana", buffer = buf}}
--       -- d = { "<cmd>echo 'markdown header'<cr>", "Create header", buffer = buf },
--     }
-- },
--     { mode = 'n', prefix = "<localleader>", buffer = buf}
--   )
-- end
--
--
-- vim.cmd(([[
-- autocmd FileType norg lua whichkeyNorg()
-- ]]))
