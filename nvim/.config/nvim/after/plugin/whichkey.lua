require 'which-key'.setup()
local wk = require("which-key")

wk.register({
  f = {
    name = "files", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find Files" }, -- create a binding with label
    g = { "<cmd>Telescope live_grep<cr>", "Search Files" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- additional options for creating the keymap
    b = { "<cmd>Telescope buffers<cr>", "Open current buffers" }, -- additional options for creating the keymap
    h = { "<cmd>Telescope buffers<cr>", "Open help tags" }, -- additional options for creating the keymap
    -- ["1"] = "which_key_ignore", -- special label to hide it in the popup
  },
  d = {
    name = "delete w/o replacing buffer", -- optional group name
  },
  p = {
    name = "paste w/o replacing buffer", -- optional group name
  },
}, { prefix = "<leader>" })
