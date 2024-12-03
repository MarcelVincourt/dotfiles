-- disable netrw at the very start of your init.lua
vim.g.loaded_newtr = 1
vim.g.loaded_netrwPlugin = 1

local function open_nvim_tree()
  -- open the tree
  --require("nvim-tree.api").tree.open()
  require("nvim-tree.api").tree.toggle({focus = false})
end

open_nvim_tree()
