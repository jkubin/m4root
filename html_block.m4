__HEADER([Josef Kubin], [2019/12/29], [root_cz])
___DESCR([basic set of block-level elements with a subset of global attributes])
___POINT([HTML5 block-level elements])

# WARNING: keep the HTML tags with spell.m4 and refs.m4 1:1

# html tag attributes (at the end of this file will be forgotten)
# β
pushdef([ID_1],			[ifelse([$#], [1], [], [$1], [], [], [ id="FIND_AND_ADD_ID_RULE_SET([$1])"])])
pushdef([TITLE_2],		[ifelse([$#], [2], [], [$2], [], [], [ title="[$2]"])])
pushdef([CLASS_3],		[ifelse([$#], [3], [], [$3], [], [], [ class="ADD_CLASS_RULE_SET([$3])"])])
pushdef([CLASS_3_TIP_BOX],	[ class="rs-tip-major ADD_CLASS_RULE_SET([tip])ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS_RULE_SET([$3])])"])
pushdef([CLASS_3_TILE_BOX],	[ class="rs-tile[]ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS_RULE_SET([$3])])"])
pushdef([STYLE_4],		[ifelse([$#], [4], [], [$4], [], [], [ style="[$4]"])])
pushdef([ANYTHING_5],		[ifelse([$#], [5], [], [$5], [], [], [ [$5]])])

# html attributes groups
# β
pushdef([HTML_GLOBAL_ATTRIBUTES],	defn([ID_1], [TITLE_2], [CLASS_3], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_HEADING_ATTRIBUTES],	[ id="ADD_ID_RULE(defn([#ID]))"]defn([TITLE_2], [CLASS_3], [STYLE_4]))
pushdef([HTML_TIP_BOX_ATTRIBUTES],	defn([ID_1], [TITLE_2], [CLASS_3_TIP_BOX], [STYLE_4]))

# β
pushdef([SET_ANCHOR], [

	# if a unique symbol is not defined
	ifdef(defn([FILE_PREFIX]).uniq.defn([SELITM]), [], [

		ROOT_WARNING([unknown $0(]BRAC(defn([SELITM]))[) found; run ‘make -B rules’ to regenerate])
	])

	# set html anchor
	ifdef([#ID], [
		define([#ID], defn(defn([FILE_PREFIX]).anch.defn([#ID])))
	], [
		define([#ID], defn(defn([FILE_PREFIX]).anch.defn([SELITM])))
	])
])

# β
pushdef([COUNTERS], [

	# increment the current index
	define([$0_IDX], incr($0_IDX))

	# reset two child sub-indices (subchapters)
	define([SUB_$0_IDX], 0)
	define([SUB_SUB_$0_IDX], 0)
])

# β
pushdef([HTML_MONOLINGUAL], [

	divert(CURRQU)dnl
<defn([##$0>])]defn([HTML_GLOBAL_ATTRIBUTES])[>ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</defn([##$0>])>
divert(-1)
])

# β
pushdef([HTML_MULTILINGUAL], [

	divert(CURRQU)dnl
<defn([##$0>])]defn([HTML_GLOBAL_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</defn([##$0>])>
divert(-1)
])

# A → β
define([PEREX_IMG], defn([TEST_ATM])[

	# transition to the next node (redefine itself to image path)
	define([$0], ../[$1])
])

# A → β
define([CAPTION], defn([TEST_ATM])[

	define([FILE_PREFIX], __file__.LANG_CODE)

	# init counter for chapters
	define([CHAPTER_IDX], 0)

	# starting letter for annex: ord('A') is 65
	define([ANNEX_IDX], 64)

	# transition to the next node (redefine itself to string)
	define([$0], EXPAND_LANG(]defn([EXPAND_LAST])[))
])

# A → β
define([PEREX], defn([TEST_ATM])[

	# transition to the next node (redefine itself to the selected string)
	define([$0], SELECT_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[))
])

# β
pushdef([CHAPTER_COMMON_CODE], [

	define([CURRQU], ARTICLE_CONTENT)

	divert(CHAPTER_NAVIG_DATA)dnl
<p id="NSP()TOCP-defn([#ID])">defn([INDENT_LEVEL])<a href="[#]NSP()defn([#ID])">defn([CHAPTER_IDX], [#L2], [#L3], [NBX])SELITM</a></p>
divert(CURRQU)dnl
<HEADING_TAG]defn([HTML_HEADING_ATTRIBUTES])[><a href="[#]NSP()defn([#ID])"]defn([ANCHOR_SIGN])[>defn([CHAPTER_IDX], [#L2], [#L3])</a>NBX()SELITM]defn([RETURN_TO_TOC], [SWITCH_LANG])[</HEADING_TAG>
divert(-1)
])

# A → β
define([CHAPTER], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR], [COUNTERS])[

	define([#L2])
	define([#L3])
	define([INDENT_LEVEL])
	define([HEADING_TAG], [h2])

	]defn([CHAPTER_COMMON_CODE])[

	define([HEADING_TAG], [h3])
])

# A → β
define([SUB_CHAPTER], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR], [COUNTERS])[

	define([#L2], .SUB_CHAPTER_IDX)
	define([#L3])
	define([INDENT_LEVEL], NBY)

	]defn([CHAPTER_COMMON_CODE])[

	define([HEADING_TAG], [h4])
])

# A → β
define([SUB_SUB_CHAPTER], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR], [COUNTERS])[

	define([#L2], .SUB_CHAPTER_IDX)
	define([#L3], .SUB_SUB_CHAPTER_IDX)
	define([INDENT_LEVEL], NBZ)

	]defn([CHAPTER_COMMON_CODE])[

	define([HEADING_TAG], [h5])
])

#      <hr> tag automaton (used in table of content as a separator)
#      ______      ___
# --->/ <hr> \--->/ ε \---.
#     \______/    \___/<--'
#
# A → β
define([ANNEX_SEPARATOR], [<hr>
define([$0])])

# A → β
define([ANNEX], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR], [COUNTERS])[

	define([ANNEX_LETTER], format([[%c]], ANNEX_IDX))

	# set the current queue
	define([CURRQU], ANNEX_CONTENT)

	divert(ANNEX_NAVIG_DATA)dnl
ANNEX_SEPARATOR<p id="NSP()TOCP-defn([#ID])"><a href="[#]NSP()defn([#ID])">ANNEX_LETTER[]NBX()SELITM</a></p>
divert(ANNEX_NAVIGATION)dnl
undivert(CURRQU)dnl
<h2]defn([HTML_HEADING_ATTRIBUTES])[><a href="[#]NSP()defn([#ID])"]defn([ANCHOR_SIGN])[>ANNEX_LETTER</a>NBX()SELITM]defn([RETURN_TO_TOC], [SWITCH_LANG])[</h2>
divert(-1)

	# size of the following headings
	define([HEADING_TAG], [h3])

	# temporarily change the current queue
	pushdef([CURRQU], [ANNEX_NAVIGATION])
	ANNEX_APPEND_CODE()
	# set the previous queue
	popdef([CURRQU])
])

# A → β
define([SUB_ANNEX], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR], [COUNTERS])[

	divert(ANNEX_NAVIGATION)dnl
<p id="NSP()TOCP-defn([#ID])">NBY()<a href="[#]NSP()defn([#ID])">ANNEX_LETTER.SUB_ANNEX_IDX[]NBX()SELITM</a></p>
divert(CURRQU)dnl
<h3]defn([HTML_HEADING_ATTRIBUTES])[><a href="[#]NSP()defn([#ID])"]defn([ANCHOR_SIGN])[>ANNEX_LETTER.SUB_ANNEX_IDX</a>NBX()SELITM]defn([RETURN_TO_TOC], [SWITCH_LANG])[</h3>
divert(-1)

	# size of the following headings
	define([HEADING_TAG], [h4])
])

# A → β
define([SUB_SUB_ANNEX], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR], [COUNTERS])[

	divert(ANNEX_NAVIGATION)dnl
<p id="NSP()TOCP-defn([#ID])">NBZ()<a href="[#]NSP()defn([#ID])">ANNEX_LETTER.SUB_ANNEX_IDX.SUB_SUB_ANNEX_IDX[]NBX()SELITM</a></p>
divert(CURRQU)dnl
<h4]defn([HTML_HEADING_ATTRIBUTES])[><a href="[#]NSP()defn([#ID])"]defn([ANCHOR_SIGN])[>ANNEX_LETTER.SUB_ANNEX_IDX.SUB_SUB_ANNEX_IDX</a>NBX()SELITM]defn([RETURN_TO_TOC], [SWITCH_LANG])[</h4>
divert(-1)

	# size of the following headings
	define([HEADING_TAG], [h5])
])

# LINK([text to link], [INTERNAL_ID])
# LINK([text to link], [EXTERNAL_ID], src.mc)
# LINK([text to link to another language], [EXTERNAL_ID], source.mc, en)
#
# both IDs must be the same
# LINK([INTERNAL_ID], [INTERNAL_ID])
# LINK([EXTERNAL_ID], [EXTERNAL_ID], source.mc)
# LINK([EXTERNAL_ID], [EXTERNAL_ID], source.mc, en)
# A → β
define([LINK], [pushdef([CURRQU], divnum)divert(-1)

	# the more arguments the more link capabilities
	ifelse(
		[$#], [2], [
			pushdef([PREF], defn([FILE_PREFIX]))
			pushdef([EXTERN])
		],
		[$#], [3], [
			pushdef([PREF], [$3].LANG_CODE)
			pushdef([EXTERN], ../defn([RELAT_PATH])defn(defn([PREF]).anch)/defn([INDEX_HTML]))
		],
		[$#], [4], [
			pushdef([PREF], [$3.$4])
			pushdef([EXTERN], ../defn([RELAT_PATH])defn(defn([PREF]).anch)/defn([INDEX_HTML]))
		], [

		ROOT_ERROR([$0($@) is not defined])
	])

	# find link in refs
	pushdef([ANCH], defn(defn([PREF]).anch.[$2]))

	ifelse(defn([ANCH]), [], [

		ROOT_WARNING([$0([$1], [‘$2’ not found], [$3], [$4]); run ‘make -B refs’ to regenerate reference list])
	])

	# find caption for title
	pushdef([TITLE], defn(defn([PREF]).capt.[$2]))

	ifelse(defn([TITLE]), [], [], [

		# temporarily redefine macros
		pushdef([BO], defn([FST]))
		pushdef([CODE], defn([SELECT_ARG1]))
		pushdef([CODE_M4], defn([SELECT_ARG1]))
		pushdef([NB], [ ])

		# expand title
		define([TITLE], [ ]title="TITLE")

		# forget previous temporary macros
		popdef(

			[BO],
			[CODE],
			[CODE_M4],
			[NB],

		)
	])

	# find caption in refs
	pushdef([CAPT], defn(defn([PREF]).capt.[$1]))

	ifelse(defn([CAPT]), [], [

			# CAPT in refs not found, use the first LINK argument
			define([CAPT], [$1])
		],
		[$1], [$2], [], [

			# CAPT in refs found, but the arg1 and arg2 are different, therefore use the arg1
			define([CAPT], [$1])
	])

	# write the resulting _HTML_ code and forget local defined macros
	divert(CURRQU)dnl
<a href="defn([EXTERN])[#]NSP()defn([ANCH])"defn([TITLE])>CAPT</a>popdef([CURRQU], [EXTERN], [PREF], [ANCH], [TITLE], [CAPT])dnl
])

# β
pushdef([FIND_IMG_DIM], [

	# find out image dimension (copy of the image is uploaded on server)
	define([IMAGE_DIM], esyscmd([identify -format "[%w, %h]" ]ARG1($6)))

	# test return value from an external commad
	ifelse(sysval, [0], [], [

		ROOT_ERROR([$3 image dimensions; you may not have ImageMagick installed])
	])
])

# create and init counter for images
define([COUNTER_FOR_IMAGES], defn([COUNT_UP]))
COUNTER_FOR_IMAGES(1)

# IMG(,,,,, [img.png, http://root.cz/img.png], [[czech], [english]])
# IMG([ID], [title],,,, [img.png, http://root.cz/img.png], [[czech], [english]])
# IMG([ID], [title], [class], [style], [anything], [img.png, http://root.cz/img.png], [[czech], [english]])
# A → β
define([IMG], [

	# Fixed number of arguments!
	ifelse([$#], [7], [], [

		ROOT_ERROR([$0(…) requires 7 arguments (received $#)])
	])

	]defn([FIND_IMG_DIM])[

	divert(CURRQU)dnl
<img src="IMG_SRC($6)" alt="[&#160;]" width="ARG1(IMAGE_DIM)" height="ARG2(IMAGE_DIM)"]defn([HTML_GLOBAL_ATTRIBUTES])[>
<p><em>WORD_IMAGE <a href="[#]NSP()defn(defn([FILE_PREFIX]).anch.[$1])"]defn([ANCHOR_SIGN])[>COUNTER_FOR_IMAGES</a>: EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</em></p>
divert(-1)
])

# A → β
define([PLAIN_TEXT_MONO], [

	divert(CURRQU)dnl
ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)[]dnl
divert(-1)
])

# A → β
define([PLAIN_TEXT], [

	divert(CURRQU)dnl
EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)[]dnl
divert(-1)
])

# A → β
define([COMMENT_MONO], [

	divert(CURRQU)dnl
<!-- ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[) -->
divert(-1)
])

# A → β
define([TIP_BOX_WRAP], [

	divert(CURRQU)dnl
<div[]]defn([HTML_TIP_BOX_ATTRIBUTES])[>dnl
divert(-1)

	]defn([EXPAND_LAST])[

	divert(CURRQU)dnl
</div>
divert(-1)
])

# A → β
define([TIP_BOX_MONO], [

	divert(CURRQU)dnl
<div[]]defn([HTML_TIP_BOX_ATTRIBUTES])[>ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([TIP_BOX], [

	divert(CURRQU)dnl
<div[]]defn([HTML_TIP_BOX_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([TILE_BOX], [

	divert(CURRQU)dnl
<div[]]defn([ID_1], [TITLE_2], [CLASS_3_TILE_BOX], [STYLE_4])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([PRE], [

	# convert '<' and '>' to html entities
	divert(CURRQU)dnl
<pre[]]defn([HTML_GLOBAL_ATTRIBUTES])[>patsubst(patsubst(BRAC(]defn([SELECT_LAST])[), [<], [&lt;]), [>], [&gt;])</pre>
divert(-1)
])

#      _____      __________
# --->/ REF \--->/ REF_NEXT \---.
#     \_____/    \__________/<--'
#
# REF([name], [description], [URL])
# A → β
define([REF], [pushdef([CURRQU], divnum)divert(-1)

	# set reference index, create symbol and an unique tuple
	define([REF_COUNTER], [1])
	define([REF_SYMBOL], NSP()[ref]REF_COUNTER)
	define([{$1$2$3}], REF_COUNTER)

	# transition to the next node
	define([$0], defn([REF_NEXT]))

	# create new entry for all references under the article
	divert(ARTICLE_REFERENCES)dnl
<ol>
<li id="REF_SYMBOL"><strong>$1</strong>ifelse([$2], [], [], [, $2])[]BR()
<a href="[$3]">[$3]</a></li>
divert(END_OF_REFERENCES)dnl
</ol>
divert(CURRQU)popdef([CURRQU])dnl
<sup><a href="[$3]" title="$1">BRAC(REF_COUNTER)</a></sup>dnl
])

# β
define([REF_NEXT], [pushdef([CURRQU], divnum)divert(-1)

	# test if the reference already exists
	ifdef([{$1$2$3}], [

		# find number to an existing referece
		define([REF_VALUE], defn([{$1$2$3}]))
		define([REF_SYMBOL], NSP()[ref]REF_VALUE)
	], [
		# increment counter for new ref value
		define([REF_VALUE], define([REF_COUNTER], incr(REF_COUNTER))REF_COUNTER)
		define([REF_SYMBOL], NSP()[ref]REF_VALUE)
		define([{$1$2$3}], REF_VALUE)

		divert(ARTICLE_REFERENCES)dnl
<li id="REF_SYMBOL"><strong>$1</strong>ifelse([$2], [], [], [, $2])[]BR()
<a href="[$3]">[$3]</a></li>
divert(-1)
	])

divert(CURRQU)popdef([CURRQU])dnl
<sup><a href="[$3]" title="$1">BRAC(REF_VALUE)</a></sup>dnl
])

# A → β
define([HEADING_MONO], defn([MONOLINGUAL_HEADINGS], [SET_ANCHOR])[

	divert(CURRQU)dnl
<HEADING_TAG]defn([HTML_HEADING_ATTRIBUTES])[>]defn([REFERENCE_TO_HEADLINE])[SELITM</HEADING_TAG>
divert(-1)
])

# A → β
define([HEADING], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	divert(CURRQU)dnl
<HEADING_TAG]defn([HTML_HEADING_ATTRIBUTES])[>]defn([REFERENCE_TO_HEADLINE])[SELITM</HEADING_TAG>
divert(-1)
])

# β
pushdef([HTML_UNPAIRED_TAG], [

	divert(CURRQU)dnl
<defn([##$0>])]defn([HTML_GLOBAL_ATTRIBUTES])[>
divert(-1)
])

# A → β
# β
define([DIV_WRAP], defn([HTML_UNPAIRED_TAG], [EXPAND_LAST])[

	divert(CURRQU)dnl
</defn([##$0>])>
divert(-1)
])

# :'<,'>! sort

# A → β
define([##ADDRESS_WRAP>],		[address])
define([ADDRESS_WRAP],			defn([DIV_WRAP]))
define([##ARTICLE_WRAP>],		[article])
define([ARTICLE_WRAP],			defn([DIV_WRAP]))
define([##ASIDE_WRAP>],			[aside])
define([ASIDE_WRAP],			defn([DIV_WRAP]))
define([##BLOCKQUOTE>],			[blockquote])
define([BLOCKQUOTE],			defn([HTML_MULTILINGUAL]))
define([##BLOCKQUOTE_MONO>],		[blockquote])
define([BLOCKQUOTE_MONO],		defn([HTML_MONOLINGUAL]))
define([##DESCRIPTION_LIST_DESC>],	[dd])
define([DESCRIPTION_LIST_DESC],		defn([HTML_MULTILINGUAL]))
define([##DESCRIPTION_LIST_DESC_MONO>],	[dd])
define([DESCRIPTION_LIST_DESC_MONO],	defn([HTML_MONOLINGUAL]))
define([DESCRIPTION_LIST_TERM],		defn([HTML_MULTILINGUAL]))
define([##DESCRIPTION_LIST_TERM>],	[dt])
define([DESCRIPTION_LIST_TERM_MONO],	defn([HTML_MONOLINGUAL]))
define([##DESCRIPTION_LIST_TERM_MONO>],	[dt])
define([DESCRIPTION_LIST_WRAP],		defn([DIV_WRAP]))
define([##DESCRIPTION_LIST_WRAP>],	[dl])
define([DETAILS_WRAP],			defn([DIV_WRAP]))
define([##DETAILS_WRAP>],		[details])
define([DIV],				defn([HTML_MULTILINGUAL]))
define([##DIV>],			[div])
define([DIV_MONO],			defn([HTML_MONOLINGUAL]))
define([##DIV_MONO>],			[div])
define([##DIV_WRAP>],			[div])
define([FIGCAPTION],			defn([HTML_MULTILINGUAL]))
define([##FIGCAPTION>],			[figcaption])
define([FIGCAPTION_MONO],		defn([HTML_MONOLINGUAL]))
define([##FIGCAPTION_MONO>],		[figcaption])
define([FIGURE_WRAP],			defn([DIV_WRAP]))
define([##FIGURE_WRAP>],		[figure])
define([FOOTER_WRAP],			defn([DIV_WRAP]))
define([##FOOTER_WRAP>],		[footer])
define([FORM_WRAP],			defn([DIV_WRAP]))
define([##FORM_WRAP>],			[form])
define([HEADER_WRAP],			defn([DIV_WRAP]))
define([##HEADER_WRAP>],		[header])
define([HORIZONTAL_RULE],		defn([HTML_UNPAIRED_TAG]))
define([##HORIZONTAL_RULE>],		[hr])
define([INPUT],				defn([HTML_UNPAIRED_TAG]))
define([##INPUT>],			[input])
define([LIST_ITEM],			defn([HTML_MULTILINGUAL]))
define([##LIST_ITEM>],			[li])
define([LIST_ITEM_MONO],		defn([HTML_MONOLINGUAL]))
define([##LIST_ITEM_MONO>],		[li])
define([MAIN_WRAP],			defn([DIV_WRAP]))
define([##MAIN_WRAP>],			[main])
define([NAV],				defn([HTML_MULTILINGUAL]))
define([NAV_MONO],			defn([HTML_MONOLINGUAL]))
define([##NAV_MONO>],			[nav])
define([##NAV>],			[nav])
define([ORDERED_LIST_WRAP],		defn([DIV_WRAP]))
define([##ORDERED_LIST_WRAP>],		[ol])
define([PARA],				defn([HTML_MULTILINGUAL]))
define([PARA_MONO],			defn([HTML_MONOLINGUAL]))
define([##PARA_MONO>],			[p])
define([##PARA>],			[p])
define([SECTION_WRAP],			defn([DIV_WRAP]))
define([##SECTION_WRAP>],		[section])
define([SUMMARY],			defn([HTML_MULTILINGUAL]))
define([SUMMARY_MONO],			defn([HTML_MONOLINGUAL]))
define([##SUMMARY_MONO>],		[summary])
define([##SUMMARY>],			[summary])
define([##TABLE_CAPTION>],		[caption])
define([TABLE_CAPTION],			defn([HTML_MULTILINGUAL]))
define([##TABLE_CAPTION_MONO>],		[caption])
define([TABLE_CAPTION_MONO],		defn([HTML_MONOLINGUAL]))
define([##TABLE_COL>],			[col])
define([TABLE_COL],			defn([HTML_UNPAIRED_TAG]))
define([##TABLE_COLGROUP_WRAP>],	[colgroup])
define([TABLE_COLGROUP_WRAP],		defn([DIV_WRAP]))
define([TABLE_DATA],			defn([HTML_MULTILINGUAL]))
define([TABLE_DATA_MONO],		defn([HTML_MONOLINGUAL]))
define([##TABLE_DATA_MONO>],		[td])
define([##TABLE_DATA>],			[td])
define([TABLE_HEAD],			defn([HTML_MULTILINGUAL]))
define([TABLE_HEAD_MONO],		defn([HTML_MONOLINGUAL]))
define([##TABLE_HEAD_MONO>],		[th])
define([##TABLE_HEAD>],			[th])
define([TABLE_ROW_WRAP],		defn([DIV_WRAP]))
define([##TABLE_ROW_WRAP>],		[tr])
define([TABLE_WRAP],			defn([DIV_WRAP]))
define([##TABLE_WRAP>],			[table])
define([TBODY_WRAP],			defn([DIV_WRAP]))
define([##TBODY_WRAP>],			[tbody])
define([TFOOT_WRAP],			defn([DIV_WRAP]))
define([##TFOOT_WRAP>],			[tfoot])
define([THEAD_WRAP],			defn([DIV_WRAP]))
define([##THEAD_WRAP>],			[thead])
define([UNORDERED_LIST_WRAP],		defn([DIV_WRAP]))
define([##UNORDERED_LIST_WRAP>],	[ul])

# forget local β rules (good for frozen files)
popdef(

	[ANYTHING_5],
	[CHAPTER_COMMON_CODE],
	[CLASS_3],
	[CLASS_3_TILE_BOX],
	[CLASS_3_TIP_BOX],
	[COUNTERS],
	[FIND_IMG_DIM],
	[HTML_GLOBAL_ATTRIBUTES],
	[HTML_HEADING_ATTRIBUTES],
	[HTML_MONOLINGUAL],
	[HTML_MULTILINGUAL],
	[HTML_TIP_BOX_ATTRIBUTES],
	[HTML_UNPAIRED_TAG],
	[ID_1],
	[SET_ANCHOR],
	[STYLE_4],
	[TITLE_2],

)
