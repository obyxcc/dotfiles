vim.api.nvim_command([[
  augroup AutoRemoveWhitespace
  autocmd BufWritePre * %s/\s\+$//e
  augroup END
]])

vim.api.nvim_command([[
  augroup AutoCompileGroff
  autocmd BufWritePost *.ms !groff -ms ./*.ms -T pdf > %:r.pdf
  augroup END
]])
