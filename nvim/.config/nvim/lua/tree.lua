-- disable netrw at the very start of your init.lua
vim.g.loaded_newtr = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
    filters = {dotfiles = true},
    view = {width = 50},
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

local function open_nvim_tree()
  -- open the tree
  --require("nvim-tree.api").tree.open()
  require("nvim-tree.api").tree.toggle({focus = false})
end

open_nvim_tree()
