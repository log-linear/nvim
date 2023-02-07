--================================= Mappings ===================================
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("t", "<esc>", "<C-\\g><C-n>", opts)
map("n", "<leader>s", ":%s//g<left><left>", opts)
map("n", "<leader>S", ":%s/<C-r><C-w>/", opts)
map("n", "<leader>bs", ":bufdo %s//gc<left><left><left>", opts)
map("i", ";B", "<esc>0D80A=<esc>0:exec 'normal! 0R' . &cms<cr>a<bs><bs><bs>===<esc>o<esc>0C", opts)
map("i", ";b", "<esc>0D80A-<esc>0:exec 'normal! 0R' . &cms<cr>a<bs><bs><bs>---<esc>o<esc>0C", opts)
map("i", ";H", "<esc>:center<cr>2hv0r=A<space><esc>40A=<esc>d80<bar>0:exec 'normal! 0R' . &cms<cr>a<bs><bs><bs>===<esc>o<esc>0C", opts)
map("i", ";h", "<esc>:center<cr>2hv0r-A<space><esc>40A-<esc>d80<bar>0:exec 'normal! 0R' . &cms<cr>a<bs><bs><bs>---<esc>o<esc>0C", opts)
map("i", ";todo", "<esc>:exec 'normal! 0i' . &cms<cr>a<bs><bs><bs><esc>$a TODO: ", opts)
map("n", "<cr><cr>", ":w<CR> :15sp<CR> :term compile %<CR>", opts)
map("n", "<leader>tt", ":15new<CR><C-\\><C-n>:call termopen('zsh')<CR><C-w>k", opts)
map("n", "<leader>tp", ":15new<CR><C-\\><C-n>:call termopen('python')<CR><C-w>k", opts)
map("n", "<leader>tr", ":15new<CR><C-\\><C-n>:call termopen('radian')<CR><C-w>k", opts)
map("n", "<leader>ts", ":15new<CR><C-\\><C-n>:call termopen('usql')<CR><C-w>k", opts)
map("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", opts)
map("n", "<leader>..", ":cd ..<CR>:pwd<CR>", opts)

local modes = { "n", "i", "v", "t" }
map(modes, "<A-h>", "<C-\\><C-n><C-w>h", opts)
map(modes, "<A-j>", "<C-\\><C-n><C-w>j", opts)
map(modes, "<A-k>", "<C-\\><C-n><C-w>k", opts)
map(modes, "<A-l>", "<C-\\><C-n><C-w>l", opts)
map(modes, "<A-H>", "<C-\\><C-n><C-w>H", opts)
map(modes, "<A-J>", "<C-\\><C-n><C-w>J", opts)
map(modes, "<A-K>", "<C-\\><C-n><C-w>K", opts)
map(modes, "<A-L>", "<C-\\><C-n><C-w>L", opts)
map(modes, "<A-,>", "<C-\\><C-n><C-w>:vertical resize -3<CR>", opts)
map(modes, "<A-->", "<C-\\><C-n><C-w>:resize -3<CR>", opts)
map(modes, "<A-=>", "<C-\\><C-n><C-w>:resize +3<CR>", opts)
map(modes, "<A-.>", "<C-\\><C-n><C-w>:vertical resize +3<CR>", opts)
map(modes, "<A-0>", "<C-\\><C-n><C-w>=", opts)
map(modes, "<A-q>", "<C-\\><C-n>:quit<CR>", opts)
map(modes, "<C-6>", "<C-\\><C-n><C-^>", opts)
map(modes, "<C-^>", "<C-\\><C-n><C-^>", opts)
map(modes, "<A-s>", "<C-\\><C-n>:sp<CR>", opts)
map(modes, "<A-v>", "<C-\\><C-n>:vs<CR>", opts)
map(modes, "<A-S>", "<C-\\><C-n><C-w>:horizontal winc =<CR>", opts)
map(modes, "<A-V>", "<C-\\><C-n><C-w>:vertical winc =<CR>", opts)

