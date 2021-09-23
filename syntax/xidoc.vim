if exists('b:current_syntax')
  finish
endif
let b:current_syntax = 'xidoc'

syntax region xidocCommand matchgroup=xidocBracket start=/\[/ end=/\]/ contains=ALL
syntax match xidocCommandName /\[\@<=[^\] 	]*/

" highlight xidocBracket guifg=#ff0000
" highlight xidocCommandName guifg=#00ff00
highlight link xidocBracket Delimiter
highlight link xidocCommandName Function
