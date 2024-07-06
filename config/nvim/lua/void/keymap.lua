vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>p" , "<C-^>")
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gd",         vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>f",  vim.lsp.buf.format)
vim.keymap.set("n", "<leader>b",  "<cmd>Telescope buffers<cr>")


local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

vim.keymap.set("n", "]d", diagnostic_goto(true))
vim.keymap.set("n", "[d", diagnostic_goto(false))
