
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- Special case: 2-space tabs for .proto files
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
    pattern = "*.proto",
    command = "set filetype=proto",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "proto",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 4
  end,
})

-- c: Automatically format comments when wrapping text.
-- r: Automatically insert the comment leader on pressing Enter.
-- o: Automatically insert the comment leader when opening a new line.
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*", -- Apply to all files; adjust the pattern as needed
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})


vim.opt.list = true
vim.opt.listchars = "tab:›-,trail:·,extends:»,precedes:«,nbsp:·"

vim.opt.wrap = false


vim.opt.colorcolumn = "80"

vim.o.mouse="a"
--vim.opt.clipboard = 'unnamedplus'

-- Automatically build CMake projects on save
--vim.api.nvim_create_autocmd("BufWritePost", {
--    pattern = {"*.c", "*.h"},
--    callback = function()
--        vim.cmd("CMakeBuild")
--    end,
--})
