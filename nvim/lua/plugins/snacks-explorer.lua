return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = true,
      sources = {
        files = { hidden = true }, -- specifically for file picker
        grep = { hidden = true },
        explorer = {
          hidden = true,
          actions = {
            -- move the cursor to the parent folder, leaving it expanded
            explorer_parent = function(picker, item)
              if not item then
                return
              end
              local Actions = require("snacks.explorer.actions")
              local cwd = vim.fs.normalize(picker:cwd())
              local dir = Snacks.picker.util.dir(item)
              if item.dir then
                dir = vim.fs.dirname(dir)
              end
              -- already at the top: nothing above to jump to
              if dir == cwd or not vim.startswith(dir, cwd) then
                return
              end
              Actions.update(picker, { target = dir })
            end,
          },
          win = {
            list = {
              keys = {
                -- go to the parent folder, only inside the explorer
                ["p"] = "explorer_parent",
                -- `p` used to paste yanked files, moved out of the way
                ["<c-p>"] = "explorer_paste",
              },
            },
          },
        }, -- specifically for the explorer
      },
    },
  },
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
    {
      "<F2>",
      function()
        Snacks.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    {
      "<F3>",
      function()
        Snacks.explorer()
      end,
      desc = "Explorer Snacks (cwd)",
    },
  },
}
