
do
  local orig_deprecate = vim.deprecate

  vim.deprecate = function(name, alternative, version, plugin)
    if name == "require('lspconfig')" then
      -- ignore this one specific warning
      return
    end
    return orig_deprecate(name, alternative, version, plugin)
  end
end

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require('plugins')
require('settings')
require('remap')
require('lsp')
require('tree')
require('cmake')
require('lualine_config').config()


vim.lsp.set_log_level("off")

--colorscheme  = catppuccin
vim.cmd.colorscheme "catppuccin-frappe"

