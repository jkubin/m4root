if exists("b:usr_ftplugin_hello")
	finish
endif
let b:usr_ftplugin_hello = 1

iabbrev <buffer> <unique> syc SYSCALL([], [%%%])<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> gl GLOBAL_LABEL([])<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> int INT([])<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> mv MOV([], [%%%])<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> st STRING([], [%%%])<c-o>T(<right><c-r>=Eatchar('.')<cr>

" comment out if not unique
"inoremap <buffer> <unique> ;; <c-o>/%%%<cr><del><del><del>
