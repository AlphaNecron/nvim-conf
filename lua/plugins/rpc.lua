return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    display = {
      theme = "catppuccin",
      flavor = "accent",
      swap_icons = true,
    },
    idle = {
      details = "zzz",
    },
    text = {
      default = nil,
      workspace = function(opts)
        return "@ " .. opts.workspace
      end,
      viewing = function(opts)
        return "viewing " .. opts.filename
      end,
      editing = function(opts)
        return "editing " .. opts.filename
      end,
      file_browser = function(opts)
        return "browsing " .. opts.name
      end,
      plugin_manager = nil,
      lsp = function(opts)
        return "configuring lsp " .. opts.name
      end,
      docs = function(opts)
        return "reading " .. opts.name
      end,
      vcs = function(opts)
        return "commiting @ " .. opts.name
      end,
      notes = function(opts)
        return "taking notes @ " .. opts.name
      end,
      debug = function(opts)
        return "debugging @ " .. opts.name
      end,
      test = function(opts)
        return "testing @ " .. opts.name
      end,
      diagnostics = function(opts)
        return "fixing bugs @ " .. opts.name
      end,
      games = function(opts)
        return "playing " .. opts.name
      end,
      terminal = function(opts)
        return "executing cmds"
      end,
      dashboard = "home",
    },
    buttons = {
      {
        label = function(opts)
          return opts.repo_url and "repo" or "website"
        end,
        url = function(opts)
          return opts.repo_url or "https://necron.dev"
        end,
      },
    },
    editor = {
      client = "vim",
      tooltip = "necronuwu",
      icon = "https://product.hstatic.net/200000903781/product/vn-11134207-7r98o-luu4at0x9r1ha4_a276c059812246d195e36af6bd5e9599_master.jpeg",
      -- icon = "https://necron.dev/favicon.png",
    },
  },
}
