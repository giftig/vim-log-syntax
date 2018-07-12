if exists("b:current_syntax")
  finish
endif

" Define patterns representing interesting things in logs
syn match log_error '\v<(ERROR|ERR|FATAL|FAT|CRI|CRIT|CRITICAL)>'
syn match log_warning '\v<(WARN|WARNING)>'
syn match log_debug '\v<(DEBUG|DEB)>'
syn match log_bool '\v<(true|false)>'
syn match log_classname '\v ([a-z\.]+\.[A-Z][A-Za-z\$]+) '

syn region log_string start=/'/ end=/'/ end=/$/ skip=/\\./
syn region log_string start=/"/ end=/"/ skip=/\\./
syn match log_number '0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'
syn match log_url '\v(\w+://\S+)'

syn match log_date '\v<\d\{4}-\d{2}-\d{2}>'
syn match log_time '\v<\d{2}:\d{2}:\d{2}([\.,]\d{3})?Z?>'

" Highlight defined patterns using standard syntax terms
hi def link log_bool Type
hi def link log_classname Type
hi def link log_date Constant
hi def link log_number Number
hi def link log_string String
hi def link log_url String
hi def link log_time Type

hi def link log_debug Comment
hi def link log_error ErrorMsg
hi def link log_warning WarningMsg

" Tell other syntax plugins we got dis
let b:current_syntax = "log"
