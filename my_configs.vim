set expandtab tabstop=2 shiftwidth=2
set clipboard+=unnamedplus
set nofoldenable

set relativenumber
set number
set mouse=a
set nowrap

function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

tnoremap <C-[> <C-\><C-n>
tnoremap <C-l> <C-\><C-n>

nnoremap tn :tabnew 
nnoremap tN :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprevious<CR>
nnoremap tJ :tabm -1<CR>
nnoremap tK :tabm +1<CR>
nnoremap tl :tablast<CR>
nnoremap th :tabfirst<CR>
nnoremap tH :call MoveToPrevTab()<CR>
nnoremap tL :call MoveToNextTab()<CR>

nnoremap <C-j> 4<C-e>
nnoremap <C-k> 4<C-y>

nnoremap <C-l> :noh<CR>


" BUFFER CONFIG
cnoremap bc Bclose
