# vim:ts=20:sw=20

__HEADER([Josef Kubin], [2019/12/29], [root_cz])
___DESCR([basic set of block-level elements with a subset of global attributes])
___POINT([HTML5 block-level elements])

# WARNING: keep the HTML tags with spell.m4 and refs.m4 1:1

# html tag attributes (at the end of this file will be forgotten)
# β
pushdef([ID_1],	[ifelse([$#], [1], [], [$1], [], [], [ id="FIND_AND_ADD_ID_RULE_SET([$1])"])])
pushdef([TITLE_2],	[ifelse([$#], [2], [], [$2], [], [], [ title="[$2]"])])
pushdef([CLASS_3],	[ifelse([$#], [3], [], [$3], [], [], [ class="ADD_CLASS([$3])"])])
pushdef([CLASS_3_EXCL],	[ class="rs-tip-major ADD_CLASS([excl])ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS([$3])])"])
pushdef([CLASS_3_HEADING],	[ class="ADD_CLASS([hx])[]ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS([$3])])"])
pushdef([CLASS_3_INFO],	[ class="rs-tip-major ADD_CLASS([info])ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS([$3])])"])
pushdef([CLASS_3_NOTE],	[ class="rs-tip-major ADD_CLASS([note])ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS([$3])])"])
pushdef([CLASS_3_ROOT_CMD],	[ class="ADD_CLASS([root])[]ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS([$3])])"])
pushdef([CLASS_3_TILE],	[ class="rs-tile[]ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS([$3])])"])
pushdef([CLASS_3_USR_CMD],	[ class="ADD_CLASS([usc])[]ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS([$3])])"])
pushdef([CLASS_3_WARN],	[ class="rs-tip-major ADD_CLASS([warn])ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS([$3])])"])
pushdef([STYLE_4],	[ifelse([$#], [4], [], [$4], [], [], [ style="[$4]"])])
pushdef([ANYTHING_5],	[ifelse([$#], [5], [], [$5], [], [], [ [$5]])])

# html tag attributes groups
# β
pushdef([HTML_EXCL_ATTRIBUTES],	defn([ID_1], [TITLE_2], [CLASS_3_EXCL], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_GLOBAL_ATTRIBUTES],	defn([ID_1], [TITLE_2], [CLASS_3], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_HEADING_ATTRIBUTES],	[ id="ADD_ID_RULE(defn([#ID]))"]defn([TITLE_2], [CLASS_3_HEADING], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_INFO_ATTRIBUTES],	defn([ID_1], [TITLE_2], [CLASS_3_INFO], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_NOTE_ATTRIBUTES],	defn([ID_1], [TITLE_2], [CLASS_3_NOTE], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_ROOT_CMD_ATTRIBUTES],	defn([ID_1], [TITLE_2], [CLASS_3_ROOT_CMD], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_USR_CMD_ATTRIBUTES],	defn([ID_1], [TITLE_2], [CLASS_3_USR_CMD], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_WARN_ATTRIBUTES],	defn([ID_1], [TITLE_2], [CLASS_3_WARN], [STYLE_4], [ANYTHING_5]))

# convert {&, >, <} to html entities, strip trailing white chars
# β
pushdef([PROCESS_RAW_CODE_TO_HTML_ENTITIES], [patsubst(patsubst(patsubst(patsubst(define([#], [[[[[$$#]]]]])indir([#], $@), [\s*]), [&], [&amp;]), [<], [&lt;]), [>], [&gt;])])

# β
pushdef([SET_ANCHOR], [
	# if a unique symbol is not defined
	ifdef(defn([FILE_PREFIX]).uniq.defn([SELITM]), [], [

		ROOT_WARNING([unknown $0(]BRAC(defn([SELITM]))[) found; run ‘make -B refs …’ to regenerate])
	])

	# set html anchor
	ifdef([#ID], [
		define([#ID], defn(defn([FILE_PREFIX]).anch.defn([#ID])))
	], [
		define([#ID], defn(defn([FILE_PREFIX]).anch.defn([SELITM])))
	])
])

# β
pushdef([HTML_MONOLINGUAL], [
	divert(CURRQU)dnl
<defn([##$0>])]defn([HTML_GLOBAL_ATTRIBUTES])[>EXPAND_ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</defn([##$0>])>
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
	define([CHAPTER_IDX], defn([COUNT_UP]))
	CHAPTER_IDX(0)

	# starting letter for annex: ord('A') is 65
	define([APPENDIX_IDX], defn([COUNT_UP]))
	APPENDIX_IDX(65)

	# init counters for sections
	define([SECT1_IDX], defn([COUNT_UP]))
	define([SECT2_IDX], defn([COUNT_UP]))
	SECT1_IDX(1)
	SECT2_IDX(1)

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
<p id="NSP()TOCP-defn([#ID])"INDENT_LEVEL><a href="[#]NSP()defn([#ID])"><b>defn([CHAPTER_IDX_val], [#S1], [#S2])</b>SELITM</a></p>
divert(CURRQU)dnl
<HEADING_TAG]defn([HTML_HEADING_ATTRIBUTES])>defn([RETURN_TO_TOC])[<a href="[#]NSP()defn([#ID])" title="🔗">defn([CHAPTER_IDX_val], [#S1], [#S2])</a>SELITM</HEADING_TAG>
divert(-1)
])

# A → β
define([CHAPTER], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment index
	CHAPTER_IDX
	define([SECT1_IDX_val], 1)
	define([SECT2_IDX_val], 1)

	define([#S1])
	define([#S2])
	define([INDENT_LEVEL])
	define([HEADING_TAG], [h2])

	]defn([CHAPTER_COMMON_CODE])[

	define([HEADING_TAG], [h3])
])

# A → β
define([SECT1], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment index
	define([#S1], .SECT1_IDX)
	define([SECT2_IDX_val], 0)
	define([#S2])
	define([INDENT_LEVEL], [ class="ADD_CLASS([l2])"])
	define([HEADING_TAG], [h3])

	]defn([CHAPTER_COMMON_CODE])[

	define([HEADING_TAG], [h4])
])

# A → β
define([SECT2], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment index
	define([#S1], .SECT1_IDX_val)
	define([#S2], .SECT2_IDX)
	define([INDENT_LEVEL], [ class="ADD_CLASS([l3])"])
	define([HEADING_TAG], [h4])

	]defn([CHAPTER_COMMON_CODE])[

	define([HEADING_TAG], [h5])
])

#      <hr> tag automaton (used in table of content as a separator)
#      ______      ___
# --->/ <hr> \--->/ ε \---.
#     \______/    \___/<--'
#
# A → β
define([APPENDIX_SEPARATOR], [<hr>
define([$0])])

# β
define([APPENDIX_MODE], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment letter index
	define([APPENDIX_LETTER], format([%c], APPENDIX_IDX))
	define([SECT1_IDX_val], 0)
	define([SECT2_IDX_val], 0)

	# set the current queue
	define([CURRQU], APPENDIX_CONTENT)

	divert(APPENDIX_NAVIG_DATA)dnl
APPENDIX_SEPARATOR<p id="NSP()TOCP-defn([#ID])"><a href="[#]NSP()defn([#ID])"><b>APPENDIX_LETTER</b>SELITM</a></p>
divert(APPENDIX_NAVIGATION)dnl
undivert(CURRQU)dnl
<h2]defn([HTML_HEADING_ATTRIBUTES])>defn([RETURN_TO_TOC])[<a href="[#]NSP()defn([#ID])" title="🔗">APPENDIX_LETTER</a>SELITM</h2>
divert(-1)

	# size of the following headings
	define([HEADING_TAG], [h3])

	# temporarily change the current queue
	pushdef([CURRQU], [APPENDIX_NAVIGATION])
	APPENDIX_APPEND_CODE()
	# set the previous queue
	popdef([CURRQU])
])

#      __________      _______________
# --->/ APPENDIX \--->/ APPENDIX_MODE \---.
#     \__________/    \_______________/<--'
#      _______      ________________
# --->/ SECT1 \--->/ SECT1_APPENDIX \---.
#     \_SECT2_/    \_SECT2_APPENDIX_/<--'
#
# A → β
define([APPENDIX], defn([APPENDIX_MODE])[

	# transition to the next node
	define([$0], defn([APPENDIX_MODE]))
	define([SECT1], defn([SECT1_APPENDIX]))
	define([SECT2], defn([SECT2_APPENDIX]))
])

# β
define([SECT1_APPENDIX], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment index
	SECT1_IDX
	define([SECT2_IDX_val], 0)

	divert(APPENDIX_NAVIGATION)dnl
<p id="NSP()TOCP-defn([#ID])" class="ADD_CLASS([l2])"><a href="[#]NSP()defn([#ID])"><b>APPENDIX_LETTER.SECT1_IDX_val</b>SELITM</a></p>
divert(CURRQU)dnl
<h3]defn([HTML_HEADING_ATTRIBUTES])>defn([RETURN_TO_TOC])[<a href="[#]NSP()defn([#ID])" title="🔗">APPENDIX_LETTER.SECT1_IDX_val</a>SELITM</h3>
divert(-1)

	# size of the following headings
	define([HEADING_TAG], [h4])
])

# β
define([SECT2_APPENDIX], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment index
	SECT2_IDX

	divert(APPENDIX_NAVIGATION)dnl
<p id="NSP()TOCP-defn([#ID])" class="ADD_CLASS([l3])"><a href="[#]NSP()defn([#ID])"><b>APPENDIX_LETTER.SECT1_IDX_val.SECT2_IDX_val</b>SELITM</a></p>
divert(CURRQU)dnl
<h4]defn([HTML_HEADING_ATTRIBUTES])>defn([RETURN_TO_TOC])[<a href="[#]NSP()defn([#ID])" title="🔗">APPENDIX_LETTER.SECT1_IDX_val.SECT2_IDX_val</a>SELITM</h4>
divert(-1)

	# size of the following headings
	define([HEADING_TAG], [h5])
])

# a hyperlink to a paragraph, code, headline, …, even into other html page in different language
# LINK([hyperlink], [INTERNAL_ID])
# LINK([hyperlink], [EXTERNAL_ID], source.mc)
# LINK([hyperlink to another language], [EXTERNAL_ID], source.mc, en)
#
# both IDs must be the same in order to dereference the text
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
			pushdef([EXTERN], ../defn([RELAT_PATH])defn(defn([PREF]).anch)/defn([OUTPUT_FILE]))
		],
		[$#], [4], [
			pushdef([PREF], [$3.$4])
			pushdef([EXTERN], ../defn([RELAT_PATH])defn(defn([PREF]).anch)/defn([OUTPUT_FILE]))
		], [

		ROOT_ERROR([$0($@) is not defined])
	])

	# find link in refs
	pushdef([ANCH], defn(defn([PREF]).anch.[$2]))

	ifelse(defn([ANCH]), [], [

		ROOT_WARNING([$0([$1], [‘$2’ not found], [$3], [$4]); run ‘make -B refs …’ to regenerate reference list])
	])

	# find caption for title
	pushdef([TITLE], defn(defn([PREF]).capt.[$2]))

	ifelse(defn([TITLE]), [], [], [

		# temporarily redefine macros
		pushdef([BO], defn([FST]))
		pushdef([CODE], defn([SELECT_ARG1]))
		pushdef([CODE_M4], defn([SELECT_ARG1]))
		pushdef([NB], [ifelse([$#], [0], [[$0]], [ ])])

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
	# the "identify" program has a bug (silent if missing file)
	ifelse(ARG1($6), [], [

		ROOT_ERROR([missing image name])
	])

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

# IMAGEDATA(,,,,, [img.png, http://root.cz/img.png], [[czech], [english]])
# IMAGEDATA([ID], [title],,,, [img.png, http://root.cz/img.png], [[czech], [english]])
# IMAGEDATA([ID], [title], [class], [style], [anything], [img.png, http://root.cz/img.png], [[czech], [english]])
# A → β
define([IMAGEDATA], [
	# Fixed number of arguments!
	ifelse([$#], [7], [], [

		ROOT_ERROR([$0(…) requires 7 arguments (received $#)])
	])

	]defn([FIND_IMG_DIM])[

	divert(CURRQU)dnl
<img src="IMG_SRC($6)" alt="[&#160;]" width="ARG1(IMAGE_DIM)" height="ARG2(IMAGE_DIM)"]defn([HTML_GLOBAL_ATTRIBUTES])[>
<p><em>WORD_IMAGE <a href="[#]NSP()defn(defn([FILE_PREFIX]).anch.[$1])" title="🔗">COUNTER_FOR_IMAGES</a>: EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</em></p>
divert(-1)
])

# A → β
define([PLAIN_TEXT_MONO], [
	divert(CURRQU)dnl
EXPAND_ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)[]dnl
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
<!-- EXPAND_ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[) -->
divert(-1)
])

# A → β
define([NOTE_WRAP], [
	divert(CURRQU)dnl
<div[]]defn([HTML_NOTE_ATTRIBUTES])[>dnl
divert(-1)
	]defn([EXPAND_LAST])[

	divert(CURRQU)dnl
</div>
divert(-1)
])

# A → β
define([NOTE_MONO], [
	divert(CURRQU)dnl
<div[]]defn([HTML_NOTE_ATTRIBUTES])[>EXPAND_ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([NOTE], [
	divert(CURRQU)dnl
<div[]]defn([HTML_NOTE_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([WARN], [
	divert(CURRQU)dnl
<div[]]defn([HTML_WARN_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([EXCL], [
	divert(CURRQU)dnl
<div[]]defn([HTML_EXCL_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([INFO], [
	divert(CURRQU)dnl
<div[]]defn([HTML_INFO_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([TILE_BOX], [
	divert(CURRQU)dnl
<div[]]defn([ID_1], [TITLE_2], [CLASS_3_TILE], [STYLE_4])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([PROGRAMLISTING], [
	divert(CURRQU)dnl
<div class="ADD_CLASS([src])"><pre[]]defn([HTML_GLOBAL_ATTRIBUTES])>defn([PROCESS_RAW_CODE_TO_HTML_ENTITIES])[</pre></div>
divert(-1)
])

# A → β
define([COMMAND_USR], [
	divert(CURRQU)dnl
<div[]]defn([HTML_USR_CMD_ATTRIBUTES])>defn([PROCESS_RAW_CODE_TO_HTML_ENTITIES])[</div>
divert(-1)
])

# A → β
define([COMMAND_ROOT], [
	divert(CURRQU)dnl
<div[]]defn([HTML_ROOT_CMD_ATTRIBUTES])>defn([PROCESS_RAW_CODE_TO_HTML_ENTITIES])[</div>
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
	define([{$1|$2|$3}], REF_COUNTER)

	# transition to the next node
	define([$0], defn([REF_NEXT]))

	# create new entry for all references under the article
	divert(ARTICLE_REFERENCES)dnl
<ol class="ADD_CLASS([refs])">
<li>ifelse(defn([CURRQU]), [-1], [], [<a href="[#]REF_SYMBOL" title="WORD_SOURCE">↑</a>])<strong>$1</strong>ifelse([$2], [], [], [, $2])[]BR()
<a href="[$3]">[$3]</a></li>
divert(END_OF_REFERENCES)dnl
</ol>
divert(CURRQU)popdef([CURRQU])dnl
<sup><a href="[$3]" title="$1" id="REF_SYMBOL">BRAC(REF_COUNTER)</a></sup>dnl
])

# β
define([REF_NEXT], [pushdef([CURRQU], divnum)divert(-1)

	# test if the reference already exists
	ifdef([{$1|$2|$3}], [

		divert(CURRQU)popdef([CURRQU])dnl
<sup><a href="[$3]" title="$1">BRAC(REF_VALUE)</a></sup>dnl
], [
		# increment counter for new ref value
		define([REF_VALUE], define([REF_COUNTER], incr(REF_COUNTER))REF_COUNTER)
		define([REF_SYMBOL], NSP()[ref]REF_VALUE)
		define([{$1|$2|$3}], REF_VALUE)

		divert(ARTICLE_REFERENCES)dnl
<li>ifelse(defn([CURRQU]), [-1], [], [<a href="[#]REF_SYMBOL" title="WORD_SOURCE">↑</a>])<strong>$1</strong>ifelse([$2], [], [], [, $2])[]BR()
<a href="[$3]">[$3]</a></li>
divert(CURRQU)popdef([CURRQU])dnl
<sup><a href="[$3]" title="$1" id="REF_SYMBOL">BRAC(REF_VALUE)</a></sup>dnl
])dnl
])

# A → β
define([BRIDGEHEAD_MONO], defn([MONOLINGUAL_HEADINGS], [SET_ANCHOR])[

	divert(CURRQU)dnl
<HEADING_TAG]defn([HTML_HEADING_ATTRIBUTES])[><sup><a href="[#]NSP()TOCP" title="defn([WORD_TOP])">🡅</a><a href="[#]NSP()defn([#ID])">🔗</a></sup>SELITM</HEADING_TAG>
divert(-1)
])

# A → β
define([BRIDGEHEAD], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	divert(CURRQU)dnl
<HEADING_TAG]defn([HTML_HEADING_ATTRIBUTES])[><sup><a href="[#]NSP()TOCP" title="defn([WORD_TOP])">🡅</a><a href="[#]NSP()defn([#ID])">🔗</a></sup>SELITM</HEADING_TAG>
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
define([##ADDRESS_WRAP>],	[address])
define([ADDRESS_WRAP],	defn([DIV_WRAP]))
define([##ARTICLE_WRAP>],	[article])
define([ARTICLE_WRAP],	defn([DIV_WRAP]))
define([##ASIDE_WRAP>],	[aside])
define([ASIDE_WRAP],	defn([DIV_WRAP]))
define([##BLOCKQUOTE>],	[blockquote])
define([BLOCKQUOTE],	defn([HTML_MULTILINGUAL]))
define([##BLOCKQUOTE_MONO>],	[blockquote])
define([BLOCKQUOTE_MONO],	defn([HTML_MONOLINGUAL]))
define([##DESCRIPTION_LIST_DESC>],	[dd])
define([DESCRIPTION_LIST_DESC],	defn([HTML_MULTILINGUAL]))
define([##DESCRIPTION_LIST_DESC_MONO>],	[dd])
define([DESCRIPTION_LIST_DESC_MONO],	defn([HTML_MONOLINGUAL]))
define([DESCRIPTION_LIST_TERM],	defn([HTML_MULTILINGUAL]))
define([##DESCRIPTION_LIST_TERM>],	[dt])
define([DESCRIPTION_LIST_TERM_MONO],	defn([HTML_MONOLINGUAL]))
define([##DESCRIPTION_LIST_TERM_MONO>],	[dt])
define([DESCRIPTION_LIST_WRAP],	defn([DIV_WRAP]))
define([##DESCRIPTION_LIST_WRAP>],	[dl])
define([DETAILS_WRAP],	defn([DIV_WRAP]))
define([##DETAILS_WRAP>],	[details])
define([DIV],	defn([HTML_MULTILINGUAL]))
define([##DIV>],	[div])
define([DIV_MONO],	defn([HTML_MONOLINGUAL]))
define([##DIV_MONO>],	[div])
define([##DIV_WRAP>],	[div])
define([FIGCAPTION],	defn([HTML_MULTILINGUAL]))
define([##FIGCAPTION>],	[figcaption])
define([FIGCAPTION_MONO],	defn([HTML_MONOLINGUAL]))
define([##FIGCAPTION_MONO>],	[figcaption])
define([FIGURE_WRAP],	defn([DIV_WRAP]))
define([##FIGURE_WRAP>],	[figure])
define([FOOTER_WRAP],	defn([DIV_WRAP]))
define([##FOOTER_WRAP>],	[footer])
define([FORM_WRAP],	defn([DIV_WRAP]))
define([##FORM_WRAP>],	[form])
define([HEADER_WRAP],	defn([DIV_WRAP]))
define([##HEADER_WRAP>],	[header])
define([HORIZONTAL_RULE],	defn([HTML_UNPAIRED_TAG]))
define([##HORIZONTAL_RULE>],	[hr])
define([INPUT],	defn([HTML_UNPAIRED_TAG]))
define([##INPUT>],	[input])
define([ITEMIZEDLIST_WRAP],	defn([DIV_WRAP]))
define([##ITEMIZEDLIST_WRAP>],	[ul])
define([LISTITEM],	defn([HTML_MULTILINGUAL]))
define([##LISTITEM>],	[li])
define([LISTITEM_MONO],	defn([HTML_MONOLINGUAL]))
define([##LISTITEM_MONO>],	[li])
define([MAIN_WRAP],	defn([DIV_WRAP]))
define([##MAIN_WRAP>],	[main])
define([NAV],	defn([HTML_MULTILINGUAL]))
define([NAV_MONO],	defn([HTML_MONOLINGUAL]))
define([##NAV_MONO>],	[nav])
define([##NAV>],	[nav])
define([ORDEREDLIST_WRAP],	defn([DIV_WRAP]))
define([##ORDEREDLIST_WRAP>],	[ol])
define([PARA],	defn([HTML_MULTILINGUAL]))
define([PARA_MONO],	defn([HTML_MONOLINGUAL]))
define([##PARA_MONO>],	[p])
define([##PARA>],	[p])
define([SECTION_WRAP],	defn([DIV_WRAP]))
define([##SECTION_WRAP>],	[section])
define([SUMMARY],	defn([HTML_MULTILINGUAL]))
define([SUMMARY_MONO],	defn([HTML_MONOLINGUAL]))
define([##SUMMARY_MONO>],	[summary])
define([##SUMMARY>],	[summary])
define([##TABLE_CAPTION>],	[caption])
define([TABLE_CAPTION],	defn([HTML_MULTILINGUAL]))
define([##TABLE_CAPTION_MONO>],	[caption])
define([TABLE_CAPTION_MONO],	defn([HTML_MONOLINGUAL]))
define([##TABLE_COL>],	[col])
define([TABLE_COL],	defn([HTML_UNPAIRED_TAG]))
define([##TABLE_COLGROUP_WRAP>],	[colgroup])
define([TABLE_COLGROUP_WRAP],	defn([DIV_WRAP]))
define([TABLE_DATA],	defn([HTML_MULTILINGUAL]))
define([TABLE_DATA_MONO],	defn([HTML_MONOLINGUAL]))
define([##TABLE_DATA_MONO>],	[td])
define([##TABLE_DATA>],	[td])
define([TABLE_HEAD],	defn([HTML_MULTILINGUAL]))
define([TABLE_HEAD_MONO],	defn([HTML_MONOLINGUAL]))
define([##TABLE_HEAD_MONO>],	[th])
define([##TABLE_HEAD>],	[th])
define([TABLE_ROW_WRAP],	defn([DIV_WRAP]))
define([##TABLE_ROW_WRAP>],	[tr])
define([TABLE_WRAP],	defn([DIV_WRAP]))
define([##TABLE_WRAP>],	[table])
define([TBODY_WRAP],	defn([DIV_WRAP]))
define([##TBODY_WRAP>],	[tbody])
define([TFOOT_WRAP],	defn([DIV_WRAP]))
define([##TFOOT_WRAP>],	[tfoot])
define([THEAD_WRAP],	defn([DIV_WRAP]))
define([##THEAD_WRAP>],	[thead])

# forget local β rules (good for frozen files)
popdef(

	[ANYTHING_5],
	[CHAPTER_COMMON_CODE],
	[CLASS_3],
	[CLASS_3_EXCL],
	[CLASS_3_HEADING],
	[CLASS_3_INFO],
	[CLASS_3_NOTE],
	[CLASS_3_ROOT_CMD],
	[CLASS_3_TILE],
	[CLASS_3_USR_CMD],
	[CLASS_3_WARN],
	[FIND_IMG_DIM],
	[HTML_EXCL_ATTRIBUTES],
	[HTML_GLOBAL_ATTRIBUTES],
	[HTML_HEADING_ATTRIBUTES],
	[HTML_INFO_ATTRIBUTES],
	[HTML_MONOLINGUAL],
	[HTML_MULTILINGUAL],
	[HTML_NOTE_ATTRIBUTES],
	[HTML_ROOT_CMD_ATTRIBUTES],
	[HTML_UNPAIRED_TAG],
	[HTML_USR_CMD_ATTRIBUTES],
	[HTML_WARN_ATTRIBUTES],
	[ID_1],
	[PROCESS_RAW_CODE_TO_HTML_ENTITIES],
	[SET_ANCHOR],
	[STYLE_4],
	[TITLE_2],

)
