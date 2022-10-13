
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

--local nvmim_tree = require('nvim-tree')

nvim_tree.setup {
	disable_netrw = false,
    open_on_setup = true,
    open_on_setup_file = true,
    ignore_buffer_on_setup = true,
    open_on_tab = false,
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                }
            }
        }
    }
}
