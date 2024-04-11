local vim = vim 

local M = {}

function M.color()

vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])
require("catppuccin").setup({
    flavour = "frappe",
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = false,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})
vim.cmd([[colorscheme catppuccin]])
--vim.cmd([[colorscheme kanagawa]])

vim.opt.termguicolors = true


end
return M
