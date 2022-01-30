function! XidocEnter() abort
  let cur_ln = getline('.')
  let cursor_col = getcurpos()[2] - 1
  let after_cursor = strpart(cur_ln, cursor_col)
  if count(after_cursor, ']') > 0
    return pumvisible() ? "\<cr>\<cr>\<c-o>O" : "\<cr>\<c-o>O"
  else
    return pumvisible() ? "\<cr>\<cr>" : "\<cr>"
  endif
endfunction

setlocal commentstring=[#%s]
setlocal iskeyword=@,48-57,_,192-255,-

inoremap <buffer> <expr> <cr> XidocEnter()
