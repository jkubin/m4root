" Vim M4
"
" 2019/10/27 Josef Kubin

if exists("b:usr_ftplugin_m4_control")
	finish
endif
let b:usr_ftplugin_m4_control = 1

"iabbrev <buffer> <unique> ,, ⟦<c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> ,l ⟦<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ,r ⟧<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> .. ⟧<c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> [[ ⟦<c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> ]] ⟧<c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> ,[ ⟦<c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> ,] ⟧<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> UU ⟦<c-r>"⟧<esc>
iabbrev <buffer> <unique> uU ⟦⟧<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> lb LB()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lbb ⟦⟧LB()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lbr ⟦⟧LB()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ll LL()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ln LN()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lnn LN()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lq LQ()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lqq `'LQ()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lu LU()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> luu ⟦⟧LU()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> rb RB()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> rbb ⟦⟧RB()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> rbr ⟦⟧RB()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> rn RN()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> rnn RN()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> rq RQ()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> rqq `'RQ()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> rr RR()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ru RU()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ruu ⟦⟧RU()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> {{ ⟦<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> }} ⟧<c-r>=Eatchar('\s')<cr>

