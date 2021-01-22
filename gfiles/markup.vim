" Vim markup for M4 series

if exists("b:usr_ftplugin_markup")
	finish
endif
let b:usr_ftplugin_markup = 1

iabbrev <buffer> <unique> atm <space><space><space>___      ___<cr><c-u><space><space>/   \--->/   \---.<cr>\___/    \___/<--'<c-r>=Eatchar('.')<cr>

iabbrev <buffer> <unique> ab ABBREV(⟦<c-r>"⟧, ⟦⟧)<c-o>T⟦<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ac ACRONYM(⟦<c-r>"⟧, ⟦⟧)<c-o>T⟦<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> am ⟦⟧AMP()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ap <c-l><cr>APPENDIX(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> apo ⟦⟧AP()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> arw ARTICLE_WRAP(⟦<cr><cr><cr><cr>⟧)dnl ARTICLE_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> asw ASIDE_WRAP(⟦<cr><cr><cr><cr>⟧)dnl ASIDE_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> bb BOLD(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> bh BRIDGEHEAD(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> bo BOLD(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> bq BLOCKQUOTE(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> br ⟦⟧BR()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> bri BRIDGEHEAD(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> btn BUTTON(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> bu BUN(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> cbr CSS_BARE_ID_RULE_SET(⟦⟦⟧⟧,	⟦%%%⟧, ⟦⟦⟧⟧, ⟦<cr>⟧)<up><up>;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cc CODE(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> ccr CSS_CLASS_RULE_SET(⟦⟦⟧⟧,	⟦%%%⟧,	⟦⟦⟧⟧, ⟦<cr>⟧)<up><up>;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cha <c-l><cr>CHAPTER(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ci CSS_ID(⟦⟧, ⟦⟧, ⟦<cr>%%%<cr>⟧)<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cir CSS_ID_RULE_SET(⟦⟦⟧⟧,	⟦%%%⟧, ⟦⟦⟧⟧, ⟦<cr>⟧)<up><up>;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cit CITATION(⟦<c-r>"⟧)<esc>
"iabbrev <buffer> <unique> cl CSS_CLASS(⟦⟧, ⟦⟧, ⟦<cr>%%%<cr>⟧)<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> cma CM()<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> cm ⟦⟧CM()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cmm CMDSYNOPSIS(⟦dnl<cr><cr>⟧)<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cmr CMDSYNOPSIS_ROOT(⟦dnl<cr><cr>⟧)<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> com COMMENT(⟦⟦<cr><cr>⟧⟧)<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cp CSS_PARENT(⟦⟧, ⟦⟧, ⟦<cr>%%%<cr>⟧)<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> del DELETED(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> dew DETAILS_WRAP(⟦<cr><cr><cr><cr>⟧)dnl DETAILS_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> diw DIV_WRAP(⟦<cr><cr><cr><cr>⟧)dnl DIV_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dld DESCRIPTION_LIST_DESC(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dlt DESCRIPTION_LIST_TERM(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dlw DESCRIPTION_LIST_WRAP(⟦<cr><cr><cr><cr>⟧)dnl DESCRIPTION_LIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dq ⟦⟧DQ()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dv DIV(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> emp EMPHASIS(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> exc EXCL(, defn(⟦WORD_IMPORTANT⟧), ⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ex EXAMPLE(⟦<c-r>"⟧, ⟦⟧)<c-o>T⟦<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ex EXECUTED(⟦<c-r>"⟧, ⟦%%%⟧, ⟦%%%⟧)<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> exp EXPLAIN(⟦<c-r>"⟧, ⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> exr EXECUTED_ROOT(⟦<c-r>"⟧, ⟦%%%⟧, ⟦%%%⟧)<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> fig FIGCAPTION(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ftn ⟦⟧FOOTNOTE(⟦⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ftnn ⟦⟧FOOTNOTE(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ftnn FooT Note Next
iabbrev <buffer> <unique> fw FIGURE_WRAP(⟦<cr><cr><cr><cr>⟧)dnl FIGURE_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> gr GRAY(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> gt ⟦⟧GT()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> hc HCODE(⟦<c-r>"⟧, ⟦⟦⟦%%%⟧, ⟦%%%⟧⟧%%%⟧)<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> hew HEADER_WRAP(⟦<cr><cr><cr><cr>⟧)dnl HEADER_WRAP<up><up><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> hh H1(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> hh HTEXT(⟦<c-r>"⟧, ⟦⟦⟦%%%⟧, ⟦%%%⟧⟧⟧)<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> hr HORIZONTAL_RULE()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> hx HEXPLAIN(⟦<c-r>"⟧, ⟦⟦⟦%%%⟧, ⟦%%%⟧⟧%%%⟧)<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ifi INSERT_FILE(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ifm INSERT_FILE_MLH(⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ii LI(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> im IMAGEDATA(⟦⟧,dnl id<cr>⟦%%%⟧,dnl title<cr>⟦⟧,dnl class<cr>⟦⟧,dnl style<cr>⟦⟧,dnl anything<cr>⟦%%%, %%%⟧,dnl ⟦local_img, server_img⟧<cr>⟦⟦<cr>%%%<cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> inf INFO(, defn(⟦WORD_INFORMATION⟧), ⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ins INSERTED(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> ita ITALIC(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> itl ITEMIZEDLIST_WRAP(⟦<cr><cr><cr><cr>⟧)dnl ITEMIZEDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> itt ITALIC(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> itw ITEMIZEDLIST_WRAP(⟦<cr><cr><cr><cr>⟧)dnl ITEMIZEDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lan LANG(⟦<c-r>"⟧, ⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ,. , ⟦⟦⟦%%%⟧, ⟦%%%⟧⟧%%%⟧<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ,/ , ⟦⟦%%%⟧, ⟦%%%⟧⟧<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lii LI(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> lit LISTITEM(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)dnl LISTITEM<up><up><up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lnk LINK(⟦<c-r>"⟧, ⟦⟧)<c-o>T⟦<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lt ⟦⟧LT()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> mar MARK(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> maw MAIN_WRAP(⟦<cr><cr><cr><cr>⟧)dnl MAIN_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> met METER(⟦60%⟧,,,,, ⟦value="0.6"⟧)<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> mM MM(⟦<c-r>"⟧, )<left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> mm s/<c-o>m`/MM(%%%)/%%%<c-o>``<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> nav NAV(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> nb ⟦⟧NB()<esc>
iabbrev <buffer> <unique> nt NOTE(, defn(⟦WORD_NOTE⟧), ⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ntw NOTE_WRAP(, defn(⟦WORD_NOTE⟧), ⟦<cr><cr><cr><cr>⟧)dnl NOTE_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> oll ORDEREDLIST_WRAP(⟦<cr><cr><cr><cr>⟧)dnl ORDEREDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ol OL(⟦<cr><cr>⟧)<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> olw ORDEREDLIST_WRAP(⟦<cr><cr><cr><cr>⟧)dnl ORDEREDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ow ORDEREDLIST_WRAP(⟦<cr><cr><cr><cr>⟧)dnl ORDEREDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pa PARA(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> par PARA(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pe PERSON(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> pl PLAIN_TEXT(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pp PARA(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> pp P(⟦⟧)%%%<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> prl PRE_LANG(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> prm PROMPT()
iabbrev <buffer> <unique> prmt PROMPT()
iabbrev <buffer> <unique> prog PROGRESS(⟦⟧,,,,, ⟦value="22" max="100"⟧)<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> proo PROMPT_ROOT()
iabbrev <buffer> <unique> proot PROMPT_ROOT()
iabbrev <buffer> <unique> pr PROGRAMLISTING(⟦dnl<cr><cr>⟧)dnl PROGRAMLISTING
iabbrev <buffer> <unique> qc „<c-r>"“<esc>
"iabbrev <buffer> <unique> qc Quote _first_language_
iabbrev <buffer> <unique> qe “<c-r>"”<esc>
"iabbrev <buffer> <unique> qe Quote English
iabbrev <buffer> <unique> qf »<c-r>"«<esc>
"iabbrev <buffer> <unique> qf Quote French
iabbrev <buffer> <unique> qfs ›<c-r>"‹<esc>
"iabbrev <buffer> <unique> qfs Quote French Single
iabbrev <buffer> <unique> qq QUOTE(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> qs ‚<c-r>"‘<esc>
"iabbrev <buffer> <unique> qs Quote Single
iabbrev <buffer> <unique> ref ⟦⟧REF(⟦⟧, ⟦%%%⟧, ⟦%%%⟧)<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sa SAMP(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> sc <c-l><cr>SECT1(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> scn <c-l><cr>SECT1(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sm SMALL(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> sp SPAN(⟦<c-r>"⟧, ⟦%%%⟧, ⟦%%%⟧)<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ss <c-l><cr>SECT1(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> str STRONG(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> stt STRIKETHROUGH(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> subs SUBSCRIPT(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> sum SUMMARY(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sup SUPERSCRIPT(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> sw SECTION_WRAP(⟦<cr><cr><cr><cr>⟧)dnl SECTION_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> til TILE_BOX(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tto TOOLTIP(⟦<c-r>"⟧, ⟦⟧)<c-o>T⟦<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tx TEXTDATA(⟦⟧, ⟦%%%⟧, ⟦%%%⟧)<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ul UL(⟦<cr><cr>⟧)<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> un UNDERLINE(⟦<c-r>"⟧)<esc>
iabbrev <buffer> <unique> uu ULINK(⟦<c-r>"⟧, ⟦⟧)<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> uuu ULINK(⟦<c-r>"⟧, ⟦%%%⟧, ⟦%%%⟧)<left><c-o>%;;<c-o><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> wa WARN(, defn(⟦WORD_WARNING⟧), ⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> wb ⟦⟧WBR()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ww WARN(, defn(⟦WORD_WARNING⟧), ⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> xs XSPAN(⟦<c-r>"⟧, ⟦%%%⟧, ⟦%%%⟧)<left><c-o>%;;<c-r>=Eatchar('.')<cr>

iabbrev <buffer> <unique> enh ENTRY_HEAD(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ent ENTRY(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> rw ROW_WRAP(⟦<cr><cr><cr><cr>⟧)dnl ROW_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tbw TBODY_WRAP(⟦<cr><cr><cr><cr>⟧)dnl TBODY_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tcg TABLE_COLGROUP_WRAP(⟦<cr><cr><cr><cr>⟧)dnl TABLE_COLGROUP_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tco TABLE_COL(⟦⟧,dnl id<cr>⟦⟧,dnl title<cr>⟦⟧,dnl class<cr>⟦⟧,dnl style<cr>⟦span="2"⟧,dnl anything<cr>)<up><c-o>f2<esc>
iabbrev <buffer> <unique> tcw TABLE_COLGROUP_WRAP(⟦<cr><cr><cr><cr>⟧)dnl TABLE_COLGROUP_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tfw TFOOT_WRAP(⟦<cr><cr><cr><cr>⟧)dnl TFOOT_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> thw THEAD_WRAP(⟦<cr><cr><cr><cr>⟧)dnl THEAD_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tti TTITLE(⟦⟦<cr><cr>⟧,dnl lang_en<cr>⟦<cr>%%%<cr>⟧⟧)<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tw TABLE_WRAP(⟦<cr><cr><cr><cr>⟧)dnl TABLE_WRAP<up><up><c-r>=Eatchar('.')<cr>

