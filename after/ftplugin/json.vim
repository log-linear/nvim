nn <leader>bf :w<CR> :%!python -m json.tool<CR>
lua callback = function() vim.treesitter.start() end
