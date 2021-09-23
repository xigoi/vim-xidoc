if exists('b:current_syntax')
  finish
endif

syntax region xidocCommand matchgroup=xidocBracket start=/\[/ end=/\]/ contains=xidocCommand

highlight link xidocBracket Delimiter
