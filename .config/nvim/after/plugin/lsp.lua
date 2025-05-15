vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable("angular")
vim.lsp.enable("cssls")
vim.lsp.enable("html")
vim.lsp.enable("jsonls")
vim.lsp.enable("lua")
vim.lsp.enable("python")
vim.lsp.enable("tailwind")
vim.lsp.enable("tsserver")
