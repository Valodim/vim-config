inoremap jj 
inoremap kj 
" inoremap hh 
inoremap ;; ;

" make sure the cursor stays where it is when leaving insert!
let CursorColumnI = 0
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

let g:asterisk#keeppos = 1

let g:mapleader="\\"

nnoremap <silent> <space> :exec "normal i".nr2char(getchar())."\e"<CR>

" don't keep paragraph jumps in jump map
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>

nnoremap <silent> Q :quit!<CR>

if dein#tap('vim-altr')
	nmap <leader>n  <Plug>(altr-forward)
	nmap <leader>N  <Plug>(altr-back)
endif

if dein#tap('nvim-dap')
	nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
	nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
	nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
	nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
	nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
	nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
	" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
	nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
	nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
	nnoremap <silent> gK :lua require('dap.ui.widgets').hover()<CR>
endif
