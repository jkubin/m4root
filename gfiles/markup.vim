" Vim markup for M4 series

if exists("b:usr_ftplugin_markup")
	finish
endif
let b:usr_ftplugin_markup = 1

iabbrev <buffer> <unique> aaa AH([<c-r>"], [%%%], [%%%])<left><c-o>%;;<c-o><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> aa AH([<c-r>"], [])<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ab ABBR([<c-r>"], [])<c-o>T[<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ac ACRO([<c-r>"], [])<c-o>T[<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> am []AMP()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ap <c-l><cr>APPENDIX([dnl czech<cr>[],<cr>dnl english: _next_language_<cr><c-u>[%%%],<cr>])<left><c-o>%<c-o>0<down><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> apo []AP()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> arw ARTICLE_WRAP([<cr><cr><cr><cr>])dnl ARTICLE_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> asw ASIDE_WRAP([<cr><cr><cr><cr>])dnl ASIDE_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> bb BO([<c-r>"])<esc>
iabbrev <buffer> <unique> bh BRIDGEHEAD([dnl czech<cr>[],<cr>dnl english: _next_language_<cr><c-u>[%%%],<cr>])<left><c-o>%<c-o>0<down><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> bhm BRIDGEHEAD_MONO([dnl monolingual<cr>[],<cr>])<up><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> bm BLOCKQUOTE_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> bo BOLD([<c-r>"])<esc>
"iabbrev <buffer> <unique> bo BO([])<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> bq BLOCKQUOTE([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> br []BR()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> bri BRIDGEHEAD([dnl czech<cr>[],<cr>dnl english: _next_language_<cr><c-u>[%%%],<cr>])<left><c-o>%<c-o>0<down><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> btn BUTTON([<c-r>"])<esc>
iabbrev <buffer> <unique> bu BUN([<c-r>"])<esc>
iabbrev <buffer> <unique> cbr CSS_BARE_ID_RULE_SET([[]],	[%%%], [[]], [<cr>])<up><up>;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cc CODE([<c-r>"])<esc>
iabbrev <buffer> <unique> ccr CSS_CLASS_RULE_SET([[]],	[%%%],	[[]], [<cr>])<up><up>;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cha <c-l><cr>CHAPTER([dnl czech<cr>[],<cr>dnl english: _next_language_<cr><c-u>[%%%],<cr>])<left><c-o>%<c-o>0<down><right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ci CSS_ID([], [], [<cr>%%%<cr>])<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cir CSS_ID_RULE_SET([[]],	[%%%], [[]], [<cr>])<up><up>;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cit CITE([<c-r>"])<esc>
"iabbrev <buffer> <unique> cl CSS_CLASS([], [], [<cr>%%%<cr>])<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> cma CM()<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> cm []CM()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cm CODE_M4([<c-r>"])<esc>
iabbrev <buffer> <unique> cmm CMD()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> com COMMENT_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cor COMMAND_ROOT([dnl<cr><cr>])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cou COMMAND_USR([dnl<cr><cr>])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> cp CSS_PARENT([], [], [<cr>%%%<cr>])<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> del DEL([<c-r>"])<esc>
iabbrev <buffer> <unique> dew DETAILS_WRAP([<cr><cr><cr><cr>])dnl DETAILS_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> divm DIV_MONO([[dnl monolingual<cr><cr>]])dnl DIV_MONO<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> diw DIV_WRAP([<cr><cr><cr><cr>])dnl DIV_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dld DESCRIPTION_LIST_DESC([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dldm DESCRIPTION_LIST_DESC_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dlt DESCRIPTION_LIST_TERM([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dltm DESCRIPTION_LIST_TERM_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dlw DESCRIPTION_LIST_WRAP([<cr><cr><cr><cr>])dnl DESCRIPTION_LIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dm DIV_MONO([[dnl monolingual<cr><cr>]])dnl DIV_MONO<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dq []DQ()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> dv DIV([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> emm EM([<c-r>"])<esc>
"iabbrev <buffer> <unique> ex EXAMPLE([<c-r>"], [])<c-o>T[<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ex EXCL(, defn([WORD_IMPORTANT]), [[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> fig FIGCAPTION([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> fim FIGCAPTION_MONO([[dnl monolingual<cr><cr>]])dnl FIGCAPTION_MONO<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> fw FIGURE_WRAP([<cr><cr><cr><cr>])dnl FIGURE_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> gr GRAY([<c-r>"])<esc>
iabbrev <buffer> <unique> gt []GT()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> hc HCODE([<c-r>"], [[[%%%], [%%%]]%%%])<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> hew HEADER_WRAP([<cr><cr><cr><cr>])dnl HEADER_WRAP<up><up><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> hh H1([])<left><left><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> hh HTEXT([<c-r>"], [[[%%%], [%%%]]])<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> hm HCODE_M4([<c-r>"], [[[%%%], [%%%]]%%%])<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> hr HORIZONTAL_RULE()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> hx HEXPL([<c-r>"], [[[%%%], [%%%]]%%%])<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> hxm HEXPL_M4([<c-r>"], [[[%%%], [%%%]]%%%])<left><c-o>%;;<c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> ii LI([<c-r>"])<esc>
iabbrev <buffer> <unique> im IMAGEDATA([],dnl id<cr>[%%%],dnl title<cr>[],dnl class<cr>[],dnl style<cr>[],dnl anything<cr>[%%%, %%%],dnl [local_img, server_img]<cr>[[dnl czech<cr>%%%<cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<right><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> inf INFO(, defn([WORD_INFORMATION]), [[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ins INS([<c-r>"])<esc>
iabbrev <buffer> <unique> lan LANG([<c-r>"], [])<left><left><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ,. , [[[%%%], [%%%]]%%%]<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ,/ , [[%%%], [%%%]]<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lii LI([<c-r>"])<esc>
iabbrev <buffer> <unique> lim LISTITEM_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lit LISTITEM([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])dnl LISTITEM<up><up><up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lnk LINK([<c-r>"], [])<c-o>T[<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> lt []LT()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> mar MARK([<c-r>"])<esc>
iabbrev <buffer> <unique> maw MAIN_WRAP([<cr><cr><cr><cr>])dnl MAIN_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> met METER([60%],,,,, [value="0.6"])<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> navm NAV_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> nav NAV([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> nb []NB()<esc>
iabbrev <buffer> <unique> ntm NOTE_MONO(, defn([WORD_NOTE]), [[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> nt NOTE(, defn([WORD_NOTE]), [[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ntw NOTE_WRAP(, defn([WORD_NOTE]), [<cr><cr><cr><cr>])dnl NOTE_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> oll ORDEREDLIST_WRAP([<cr><cr><cr><cr>])dnl ORDEREDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ol OL([<cr><cr>])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> olw ORDEREDLIST_WRAP([<cr><cr><cr><cr>])dnl ORDEREDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ow ORDEREDLIST_WRAP([<cr><cr><cr><cr>])dnl ORDEREDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> par PARA([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pe PERSON([<c-r>"])<esc>
iabbrev <buffer> <unique> plm PLAIN_TEXT_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pl PLAIN_TEXT([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pm PARA_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pp PARA([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> pp P([])%%%<c-o>T(<right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> prl PRE_LANG([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> prog PROGRESS([],,,,, [value="22" max="100"])<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> pr PROGRAMLISTING([dnl<cr><cr>])dnl PROGRAMLISTING note: The [#] or [dnl] on the last line have to be in brackets!<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> qm QM([<c-r>"])<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> qq QUOTE([<c-r>"])<esc>
iabbrev <buffer> <unique> ref []REF([], [%%%], [%%%])<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> roo ROO()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sa SAMP([<c-r>"])<esc>
iabbrev <buffer> <unique> scn <c-l><cr>SECT1([dnl czech<cr>[],<cr>dnl english: _next_language_<cr><c-u>[%%%],<cr>])<left><c-o>%<c-o>0<down><right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sm SMALL([<c-r>"])<esc>
iabbrev <buffer> <unique> sp SPAN([<c-r>"], [%%%], [%%%])<left><c-o>%;;<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ss <c-l><cr>SECT1([dnl czech<cr>[],<cr>dnl english: _next_language_<cr><c-u>[%%%],<cr>])<left><c-o>%<c-o>0<down><right><c-r>=Eatchar('.')<cr>
"iabbrev <buffer> <unique> st STRONG([])%%%<c-o>T(<right><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> st STT([<c-r>"])<esc>
iabbrev <buffer> <unique> subs SUB([<c-r>"])<esc>
iabbrev <buffer> <unique> summ SUMMARY_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sum SUMMARY([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> sup SUP([<c-r>"])<esc>
iabbrev <buffer> <unique> sw SECTION_WRAP([<cr><cr><cr><cr>])dnl SECTION_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> til TILE_BOX([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tt TOOLTIP([<c-r>"], [])<c-o>T[<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ull ITEMIZEDLIST_WRAP([<cr><cr><cr><cr>])dnl ITEMIZEDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ul UL([<cr><cr>])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ulw ITEMIZEDLIST_WRAP([<cr><cr><cr><cr>])dnl ITEMIZEDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> un UN([<c-r>"])<esc>
iabbrev <buffer> <unique> uw ITEMIZEDLIST_WRAP([<cr><cr><cr><cr>])dnl ITEMIZEDLIST_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> wa WARN(, defn([WORD_WARNING]), [[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> wb []WBR()<c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> ww WARN(, defn([WORD_WARNING]), [[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> xs XSPAN([<c-r>"], [%%%], [%%%])<left><c-o>%;;<c-r>=Eatchar('.')<cr>

iabbrev <buffer> <unique> tbw TBODY_WRAP([<cr><cr><cr><cr>])dnl TBODY_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tcm TABLE_CAPTION_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tco TABLE_COL([],dnl id<cr>[],dnl title<cr>[],dnl class<cr>[],dnl style<cr>[span="2"],dnl anything<cr>)<up><c-o>f2<esc>
iabbrev <buffer> <unique> tc TABLE_CAPTION([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tcw TABLE_COLGROUP_WRAP([<cr><cr><cr><cr>])dnl TABLE_COLGROUP_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tdm TABLE_DATA_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> td TABLE_DATA([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tfw TFOOT_WRAP([<cr><cr><cr><cr>])dnl TFOOT_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> thm TABLE_HEAD_MONO([[dnl monolingual<cr><cr>]])<up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> th TABLE_HEAD([[dnl czech<cr><cr>],<cr>[dnl english: _next_language_<cr>%%%<cr>]])<left><c-o>%<c-o>0<down><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> thw THEAD_WRAP([<cr><cr><cr><cr>])dnl THEAD_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tr TABLE_ROW_WRAP([<cr><cr><cr><cr>])dnl TABLE_ROW_WRAP<up><up><c-r>=Eatchar('.')<cr>
iabbrev <buffer> <unique> tw TABLE_WRAP([<cr><cr><cr><cr>])dnl TABLE_WRAP<up><up><c-r>=Eatchar('.')<cr>

