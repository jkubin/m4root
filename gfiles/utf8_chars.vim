" vim:mps+=⟦\:⟧
"
" DO NOT EDIT! This file is generated automatically!
"
" 2019/10/27 Josef Kubin

if exists("b:usr_ftplugin_m4_maps")
	finish
endif
let b:usr_ftplugin_m4_maps = 1

iabbrev <buffer> <unique> ar ARG1(<c-r>")<esc>
iabbrev <buffer> <unique> ,b ⟦⟧<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> bra BRAC(<c-r>")<esc>
"iabbrev <buffer> <unique> bu builtin(⟦⟧, ⟦%%%⟧, ⟦%%%⟧)<left><c-o>%<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> cc changecom()<left><c-r>=Eatchar('.')<cr>	<--- kolize
"iabbrev <buffer> <unique> chw changeword()<left><c-r>=Eatchar('.')<cr>	<--- nevyuzito
iabbrev <buffer> <unique> cq changequote(⟦,⟧)<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> cw changeword()<left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> d0 divert(0)dnl<cr><c-u><c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> db debugmode(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> dbf debugfile(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> dbm debugmode(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dc decr($1)
iabbrev <buffer> <unique> ddd debugfile(⟦debug.m4⟧)debugmode(⟦taeqc⟧)<cr>debugmode<c-o>0<esc>
iabbrev <buffer> <unique> dd debugfile(⟦debug.m4⟧)debugmode(⟦taeq⟧)<cr>debugmode<c-o>0<esc>
"iabbrev <buffer> <unique> dea define(⟦⟧, defn(⟦%%%⟧))<c-o>T(<c-o>;<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> deb # β<cr><c-u>define(⟦⟧, ⟦<cr><cr><tab>%%%<cr><c-d>⟧)<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dec decr($1)
iabbrev <buffer> <unique> de define(⟦⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> dee define(`', `%%%')<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> def # A → β<cr><c-u>define(⟦⟧, ⟦<cr><cr><tab>%%%<cr><c-d>⟧)<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> def # A → β<cr><c-u>define(⟦⟧, ⟦<cr><cr><tab>%%%<cr><c-d>⟧)<up><up><up><c-o>f⟧<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> deff define(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> deff define(⟦⟧, defn(⟦%%%⟧))<c-o>T(<c-o>;<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> defi define(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> defn defn(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> defs # A → β<cr><c-u>define(⟦⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦<cr><cr><tab>%%%<cr><c-d>⟧)⟧)<up><up><up><c-o>f⟧<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dep # β<cr><c-u>pushdef(⟦⟧, ⟦<cr><cr><tab>%%%<cr><c-d>⟧)<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> des define(⟦⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦%%%⟧)⟧)<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> det define(⟦$0⟧, defn(⟦⟧))<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> detr define(⟦$0⟧, defn(⟦⟧))<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> df <left>defn(<right><right>)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dfn defn(⟦<c-r>"⟧)<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> di0 divert(0)dnl<cr><c-u><c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> di divert()dnl0<c-d><c-o>T(<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dii divert(-1)0<c-d><c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> din divert(1)dnl0<c-d><c-o>T1<esc><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dio divert(0)dnl<cr><c-u><c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> dive divert()dnl0<c-d><c-o>T(<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dive divert()dnl<c-o>T(<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> diven divert(1)dnl0<c-d><c-o>T(<esc><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> divn divnum<c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> dn dnl<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> dn dnl<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> dnu divert(-1)<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> don DONTE()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> du dumpdef(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dum dumpdef(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dump dumpdef(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dvn divnum<c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> er errprint(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> erp errprint(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> err errprint(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> err ROOT_ERROR(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> es esyscmd(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> esy esyscmd(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> esys esyscmd(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> eva eval(⟦⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> eval eval(⟦⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ev eval(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> evv eval(⟦⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> exi m4exit(1)<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> fil __file__<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> fm format(⟦%⟧, %%%)<c-o>T(<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> fmt format(⟦%⟧, %%%)<c-o>T(<right><right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> fo format(⟦%⟧, %%%)<c-o>T(<right><right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> for format(⟦%⟧, %%%)<c-o>T(<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> fs FST()<left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> gn __gnu__<c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> id index(⟦⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> idx index(⟦⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ifc ifelse(⟦<cr>⟧)dnl comment<c-o>0<esc>
"iabbrev <buffer> <unique> ifdd ifdef(`', `%%%', `%%%')<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ifde ifdef(⟦⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ifd ifdef(⟦⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ifee ifelse(⟦⟧, ⟦%%%⟧, ⟦%%%⟧, ⟦%%%⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ifee ifelse(`', `%%%', `%%%', `%%%')<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ife ifelse(⟦$1⟧, ⟦%%%⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T$<esc>
iabbrev <buffer> <unique> ifel ifelse(<cr><tab>⟦$%%%⟧, ⟦%%%⟧, ⟦%%%⟧,<cr>⟦$%%%⟧, ⟦%%%⟧, ⟦%%%⟧,<cr>⟦$%%%⟧, ⟦%%%⟧, ⟦%%%⟧,<cr>⟦%%%⟧dnl<cr>)<c-o><<<left><c-o>%;;<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ifff ifelse(`', `%%%', `%%%')<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> iff ifelse(⟦$⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>F$<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ii ifelse(⟦<cr>⟧)dnl comment<c-o>0<esc>
iabbrev <buffer> <unique> inc incr($1)
iabbrev <buffer> <unique> incl include(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ind indir(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> in indir(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> le len(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> line __line__:<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> lin __line__<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> lll ⟦⟧LL()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> m4ex m4exit(1)<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> mk maketemp(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> mkt maketemp(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> mw m4wrap(⟦<cr><cr>⟧)<up><tab><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> mx m4exit(1)<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> os2 __os2__<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> pai PAYR(<c-r>")<esc>
"iabbrev <buffer> <unique> pa patsubst(⟦$⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T$<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> pat patsubst(⟦$⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T$<c-r>=Eatchar('\s')<cr>
"iabbrev <buffer> <unique> pod popdef(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> popd popdef(<cr><tab>⟦%%%⟧,<cr>⟦%%%⟧,<cr>⟦%%%⟧,<cr><c-d>)<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pop popdef(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> pop popdef(<cr><tab>⟦%%%⟧,<cr>⟦%%%⟧,<cr>⟦%%%⟧,<cr><c-d>)<up><up><up><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> popp popdef(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> popp popdef(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pt pushdef(⟦$0⟧, defn(⟦⟧))<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> pud pushdef(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pu pushdef(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pus pushdef(⟦⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> put pushdef(⟦$0⟧, defn(⟦⟧))<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> putr pushdef(⟦$0⟧, defn(⟦⟧))<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ,q `'<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> reg regexp(⟦$⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T$<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> rrr ⟦⟧RR()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> saf ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦<c-r>"⟧)<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> shi shift($@)
iabbrev <buffer> <unique> sin sinclude(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sn SND()<left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> sub substr(⟦$⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T$<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> su substr(⟦$⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T$<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> sv sysval<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sysc syscmd(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sys sysval<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sysv sysval<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tof traceoff<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ton traceon(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tra define(⟦$0⟧, defn(⟦⟧))<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> trn # transition to the next node<cr><c-u>define(⟦$0⟧, defn(⟦⟧))<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> troff traceoff(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tron traceon(⟦⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> tr translit(⟦$⟧, ⟦%%%⟧)<c-o>T$<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ue undefine(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> undef undefine(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> unde undefine(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> undi undivert()<left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> und undivert()dnl<c-o>T(<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> une undefine(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> unn undivert(1)dnl<c-o>T1<esc><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ut undivert()dnl<c-o>T(<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ux __unix__<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> war ROOT_WARNING(⟦⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> wi __windows__<c-r>=Eatchar('\s')<cr>
iabbrev <buffer> <unique> wr m4wrap(⟦<cr><cr>⟧)<up><tab><c-r>=Eatchar('.')<cr>

" quickfix
"setlocal errorformat=%.%#:%f:%l:%m
"setlocal errorformat=%*\\w:%f:%l:%m,%f:%l:%m
"setlocal errorformat=%*⟦^:⟧:%f:%l:%m

" column-maker
nnoremap <buffer> <unique> <silent><leader>f :%! perl -pe 'use encoding utf8;s/\s+,/,/g;s/^(\⟦.., )(\⟦⟦^⟧⟧*\⟧,)\s*(\⟦⟦^⟧⟧*\⟧,)\s*(\⟦⟦^⟧⟧*\⟧)/sprintf("\%s\%-35s\%-43s\%s", $1, $2, $3, $4)/e'<cr>g;g;
nnoremap <buffer> <unique> <silent><leader>F :%! perl -pe 'use encoding utf8;s/\s+,/,/g;s/^(\⟦.., )(\⟦⟦^⟧⟧*\⟧,)\s*(\⟦⟦^⟧⟧*\⟧,)\s*(\⟦⟦^⟧⟧*\⟧)/sprintf("\%s\%-35s\%-63s\%s", $1, $2, $3, $4)/e'<cr>g;g;

" jumps to the placeholder and removes it
inoremap <buffer> <unique> ;; <c-o>/%%%<cr><del><del><del>
