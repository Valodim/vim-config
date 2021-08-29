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
