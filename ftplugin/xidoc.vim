inoremap <buffer> <expr> <cr> XidocEnter()

function! XidocEnter() abort
  let cur_ln = getline('.')
  let cursor_col = getcurpos()[2] - 1
  let after_cursor = strpart(cur_ln, cursor_col)
  if count(after_cursor, ']') > 0
    return "\<cr>\<esc>O"
  else
    return "\<cr>"
  endif
endfunction
