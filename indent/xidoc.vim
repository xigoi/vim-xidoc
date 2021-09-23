if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

function! XidocIndentExprFull(lnum) abort
  let nesting = 0
  for ln in getline(1, a:lnum - 1)
    let nesting += count(ln, '[') - count(ln, ']')
  endfor
  let cur_ln = getline(a:lnum)
  let nesting -= count(matchstr(cur_ln, '^\s*\]*'), ']')
  return nesting * shiftwidth()
endfunction

function! XidocIndentExprFast(lnum) abort
  if lnum == 0
    return 0
  endif
  let prev_indent = indent(a:lnum - 1)
  let prev_ln = getline(a:lnum - 1)
  let additional_nesting = count(prev_ln, '[') - count(prev_ln, ']')
  let cur_ln = getline(a:lnum)
  let additional_nesting -= count(matchstr(cur_ln, '^\s*\]*'), ']')
  return prev_indent + additional_nesting * shiftwidth()
endfunction

setlocal indentexpr=XidocIndentExprFast(v:lnum)
setlocal indentkeys=0],!^F,o,O
