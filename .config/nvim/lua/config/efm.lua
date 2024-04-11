require "lspconfig".efm.setup {
    on_attach = on_attach,
    init_options = {documentFormatting = true},
    fileTypes = {"python"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = {
                {formatCommand = "black --quiet", formatStdin = true}
            }
        }
    }
}
