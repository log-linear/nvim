--================================= Mappings ===================================
local map = vim.keymap.set
vim.cmd[[
  nnoremap <expr> j &wrap ? 'gj' : 'j'
  nnoremap <expr> k &wrap ? 'gk' : 'k'
]]

map("n", "<leader>s", ":%s//g<left><left>", { desc = "Search and replace" })
map("n", "<leader>S", ":%s/<C-r><C-w>/", { desc = "Search and replace word under cursor" })
map("n", "<leader>bs", ":bufdo %s//gc<left><left><left>", { desc = "Buffer search and replace" })
map("n", "]b", ":bn<cr>", { desc = "Next buffer" })
map("n", "[b", ":bp<cr>", { desc = "Next buffer" })
map("i", ";B", "<esc>0D80A=<esc>0:exec 'normal! 0R' . &cms<cr>a<bs><bs><bs>===<esc>o<esc>0C", { desc = "Create `===` block" })
map("i", ";b", "<esc>0D80A-<esc>0:exec 'normal! 0R' . &cms<cr>a<bs><bs><bs>---<esc>o<esc>0C", { desc = "Create `---` block" })
map("i", ";H", "<esc>:center<cr>2hv0r=A<space><esc>40A=<esc>d80<bar>0:exec 'normal! 0R' . &cms<cr>a<bs><bs><bs>===<esc>o<esc>0C", { desc = "Create `===` header"})
map("i", ";h", "<esc>:center<cr>2hv0r-A<space><esc>40A-<esc>d80<bar>0:exec 'normal! 0R' . &cms<cr>a<bs><bs><bs>---<esc>o<esc>0C", { desc = "Create `---` header"})
map("i", ";todo", "<esc>:exec 'normal! 0i' . &cms<cr>a<bs><bs><bs><esc>$a TODO: ", { desc = "Add a `TODO:` comment" })
map("n", "<leader>tt", [[:15new<CR><C-\><C-n>:call termopen($SHELL)<CR><C-w>k]], { desc = "Open a new terminal" })
map("n", "<leader>tp", [[:15new<CR><C-\><C-n>:call termopen('python')<CR><C-w>k]], { desc = "Open a new Python console" })
map("n", "<leader>tr", [[:15new<CR><C-\><C-n>:call termopen('radian')<CR><C-w>k]], { desc = "Open a new R console" })
map("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", { desc = "Change to current buffer file directory" })
map("n", "<leader>..", ":cd ..<CR>:pwd<CR>", { desc = "Change to parent directory" })
map("i", "<c-e>", "<esc><C-e>i", opts)
map("i", "<c-y>", "<esc><C-y>i", opts)

local modes = { "n", "i", "v", "t" }
map(modes, "<A-h>", [[<C-\><C-n><C-w>h]])
map(modes, "<A-j>", [[<C-\><C-n><C-w>j]])
map(modes, "<A-k>", [[<C-\><C-n><C-w>k]])
map(modes, "<A-l>", [[<C-\><C-n><C-w>l]])
map(modes, "<A-H>", [[<C-\><C-n><C-w>H]])
map(modes, "<A-J>", [[<C-\><C-n><C-w>J]])
map(modes, "<A-K>", [[<C-\><C-n><C-w>K]])
map(modes, "<A-L>", [[<C-\><C-n><C-w>L]])
map(modes, "<A-,>", [[<C-\><C-n><C-w>:vertical resize -3<CR>]])
map(modes, "<A-->", [[<C-\><C-n><C-w>:resize -3<CR>]])
map(modes, "<A-=>", [[<C-\><C-n><C-w>:resize +3<CR>]])
map(modes, "<A-.>", [[<C-\><C-n><C-w>:vertical resize +3<CR>]])
map(modes, "<A-0>", [[<C-\><C-n><C-w>=]])
map(modes, "<A-q>", [[<C-\><C-n>:quit<CR>]])
map(modes, "<C-6>", [[<C-\><C-n><C-^>]])
map(modes, "<C-^>", [[<C-\><C-n><C-^>]])
map(modes, "<A-s>", [[<C-\><C-n>:sp<CR>]])
map(modes, "<A-v>", [[<C-\><C-n>:vs<CR>]])
map(modes, "<A-S>", [[<C-\><C-n><C-w>:horizontal winc =<CR>]])
map(modes, "<A-V>", [[<C-\><C-n><C-w>:vertical winc =<CR>]])

