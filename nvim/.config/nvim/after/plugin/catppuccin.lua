require("catppuccin").setup {
  highlight_overrides = {
    frappe = function(frappe)
      return {
        ["@comment"] = { fg = frappe.surface2, style = { "italic" } },
      }
    end,
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
  },
}

vim.cmd([[hi NvimTreeWinSeparator guifg=#303446 guibg=#303446]])
vim.cmd.colorscheme("catppuccin-frappe")
