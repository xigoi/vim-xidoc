if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

function! XidocIndentExpr(lnum) abort
  let nesting = 0
  for ln in getline(1, a:lnum - 1)
    let nesting += count(ln, '[') - count(ln, ']')
  endfor
  return nesting * shiftwidth()
endfunction

setlocal indentexpr=XidocIndentExpr(v:lnum)
