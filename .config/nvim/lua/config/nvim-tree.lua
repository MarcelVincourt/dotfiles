
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

--local nvmim_tree = require('nvim-tree')

nvim_tree.setup {
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    sort = {
    sorter = "name",
    folders_first = true,
    },
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = false,
    reload_on_bufenter = false,
    --open_on_setup = true,
    --open_on_setup_file = true,
    --ignore_buffer_on_setup = true,
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
