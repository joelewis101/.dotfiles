return {
  -- dashboard to greet
  -- { 'goolord/alpha-nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     local alpha = require("alpha")
  --     local dashboard = require("alpha.themes.dashboard")
  --     -- Set header
  --     dashboard.section.header.val = {
  --       "NEOVIM"
  --     }
  --
  --     -- Set menu
  --     dashboard.section.buttons.val = {
  --       dashboard.button("e", "💡   New file", ":ene <BAR> startinsert <CR>"),
  --       dashboard.button("f", "🔍   Find file", ":Telescope find_files<CR>"),
  --       dashboard.button("r", "🗄️  Recent", ":Telescope oldfiles<CR>"),
  --       dashboard.button("s", "⚙️   Settings", ":e $MYVIMRC | :cd %:p:h<cr>"),
  --       dashboard.button("k", "⌨️   Keymaps", ":e ~/.config/nvim/lua/config/keymap.lua <cr>"),
  --       dashboard.button("q", "🚪   Quit", ":qa<CR>"),
  --     }
  --
  --     local fortune = require("alpha.fortune")
  --     dashboard.section.footer.val = fortune({
  --       fortune_list = {
  --         { "You otter be proud of yourself!", "", "— 🦦" },
  --         { "Hello from the otter slide!", "", "— Otterdele" },
  --         { "To otter space!", "", "— 🦦" },
  --         { "What if I say I'm not like the otters?", "", "— Foo Fighters" },
  --       }
  --     })
  --
  --     -- Send config to alpha
  --     alpha.setup(dashboard.opts)
  --   end
  -- },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
        local function getGreeting(name)
        local tableTime = os.date("*t")
        local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
        local hour = tableTime.hour
        local greetingsTable = {
          [1] = "  Sleep well",
          [2] = "  Good morning",
          [3] = "  Good afternoon",
          [4] = "  Good evening",
          [5] = "󰖔  Good night",
        }
        local greetingIndex = 0
        if hour == 23 or hour < 7 then
          greetingIndex = 1
        elseif hour < 12 then
          greetingIndex = 2
        elseif hour >= 12 and hour < 18 then
          greetingIndex = 3
        elseif hour >= 18 and hour < 21 then
          greetingIndex = 4
        elseif hour >= 21 then
          greetingIndex = 5
        end
        return greetingsTable[greetingIndex] .. ", " .. name
      end

      local datetime = os.date("   %d-%m-%Y   %H:%M:%S")
      local version = vim.version()
      local nvim_version_info = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
      local logo = [[
     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
      ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n" .. nvim_version_info .. datetime .. "\n\n" .. getGreeting("Joe") .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
            { action = "Oil",                                                      desc = " Explore files",   icon = " ", key = "e" },
            { action = "ene | startinsert",                                        desc = " New file",        icon = " ",  key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
            { action = "lcd ~/.config/nvim | Oil",                                       desc = " Config",          icon = " ", key = "c" },
            { action = "Neorg workspace notes",                                    desc = " Neorg todo",      icon = " ", key = "t" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
