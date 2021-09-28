if exists('b:current_syntax')
  finish
endif
let b:current_syntax = 'xidoc'

syntax region xidocCommand matchgroup=xidocBracket start=/\[/ end=/\]/ contains=ALL
syntax match xidocCommandName /\[\@<=[^\] 	]*/

highlight link xidocBracket Delimiter
highlight link xidocCommandName Function
