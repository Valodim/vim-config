local map = vim.keymap.set

map('i', 'jj', '')
map('i', 'kj', '')
map('i', ';;', ';')

map('n', 'Q', ':quit!<CR>')

-- don't update jumplist for paragraph motions
map('n', '{', ':<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>', { silent = true })
map('n', '}', ':<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>', { silent = true })

-- <expr>
map('n', '<C-e>', '(line("w$") >= line(\'$\') ? "j" : "3\\<C-e>")', { expr = true })
map('n', '<C-y>', '(line("w0") <= 1         ? "k" : "3\\<C-y>")', { expr = true })

map('n', '<Leader>id', '"=strftime("%F")<CR>P', { desc = "Insert current date" })
map('n', '<Leader>iu', '"=system("uuidgen")<CR>P', { desc = "Insert UUID" })

map('n', '<space>', ':exec "normal i".nr2char(getchar())."\\e"<CR>', { silent = true })

vim.cmd([[
" make sure the cursor stays where it is when leaving insert!
  let CursorColumnI = 0
  autocmd InsertEnter * let CursorColumnI = col('.')
  autocmd CursorMovedI * let CursorColumnI = col('.')
  autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif
]])

-- local CursorColumnI = 0
-- vim.api.nvim_create_autocmd({ 'InsertEnter', 'CursorMovedI' }, {
--   group = augroup('insert_stay'),
--   callback = function()
--     CursorColumnI = vim.fn.col('.')
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('InsertLeave', {
--   group = augroup('insert_stay'),
--   callback = function()
--     print('hi')
--     local c = nvim_win_get_cursor(0)
--     if c[1] ~= CursorColumnI then
--       print('ho')
--       c[1] = c[1]+1
--       vim.api.nvim_win_set_cursor(0, c)
--     end
--   end,
-- })
--
