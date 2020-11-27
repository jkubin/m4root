# vim:ts=20:sw=20

__HEADER([Josef Kubin], [2019/12/29], [root_cz])
___DESCR([basic set of block-level elements and unpaired tags with a subset of global attributes])
___POINT([definition of HTML5 block-level elements and unpaired tags])

# WARNING: keep 1:1 consistency: spell.m4 refs.m4 text.m4 man.m4 info.m4

# also used in html/nav.m4
# β
define([CHAPTER_INDEXES],	[<a href="[#]defn([#ID])" title="⚓">defn([#S0], [#S1], [#S2])</a>])
define([TOC_AND_ANCHOR],	[<a href="[#]defn([#ID], [TOC_ANCH])" title="defn([WORD_CONTENT])"></a>]defn([CHAPTER_INDEXES]))
define([GO_BACK_UP],	[<a href="defn([#NSP], [TOC_ANCH])" title="defn([WORD_TOP])"></a>])

# html tag attributes (at the end of this file will be forgotten)
# β
pushdef([ID_1],		[[]ifelse([$#], [1], [], [$1], [], [], [ id="ADD_ID_ANCH([$1])"])])
pushdef([ID_1_MONO],	[[]ifelse([$#], [1], [], [$1], [], [], [ id="ADD_ID_MONO([$1])"])])
pushdef([ID_1_SOURCE],	[ ANCH_COUNTER()id="ifelse([$#], [1], [NSP()anch-ANCH_COUNTER_val], [$1], [], [NSP()anch-ANCH_COUNTER_val], [ADD_ID_MONO([$1])])"])
pushdef([ID_1_ANCHOR],	[<code><span class="ADD_CLASS([cb])" title="defn([WORD_CLIPBOARD])"></span><a href="[#]ifelse([$#], [1], [NSP()anch-ANCH_COUNTER_val], [$1], [], [NSP()anch-ANCH_COUNTER_val], [ADD_ID_MONO([$1])])" title="⚓"></a></code>])
#pushdef([ID_1_ANCHOR],	[[]ifelse([$#], [1], [], [$1], [], [], [<code><span class="ADD_CLASS([cb])"></span><a href="[#]ADD_ID_MONO([$1])" title="⚓"></a></code>])])
pushdef([TITLE_2],		[ifelse([$#], [2], [], [$2], [], [], [ title="[$2]"])])
pushdef([CLASS_3],		[ifelse([$#], [3], [], [$3], [], [], [ class="ADD_CLASS([$3])"])])
pushdef([CLASS_3_SUFFIX],	[ifelse([$#], [3], [], [$3], [], [], [ ADD_CLASS([$3])])"])		<--- Keep it up (β)!
pushdef([CLASS_3_EXCL],	[ class="rs-tip-major ADD_CLASS([excl])]defn([CLASS_3_SUFFIX]))
pushdef([CLASS_3_BRIDGEHEAD],	[ class="ADD_CLASS([bh])]defn([CLASS_3_SUFFIX]))
pushdef([CLASS_3_HEADING],	[ class="ADD_CLASS([ch])]defn([CLASS_3_SUFFIX]))
pushdef([CLASS_3_INFO],	[ class="rs-tip-major ADD_CLASS([info])]defn([CLASS_3_SUFFIX]))
pushdef([CLASS_3_NOTE],	[ class="rs-tip-major ADD_CLASS([note])]defn([CLASS_3_SUFFIX]))
pushdef([CLASS_3_ROOT_CMD],	[ class="ADD_CLASS([root])]defn([CLASS_3_SUFFIX]))
pushdef([CLASS_3_TILE],	[ class="rs-tile]defn([CLASS_3_SUFFIX]))
pushdef([CLASS_3_SOURCE],	[ class="ADD_CLASS([src])]defn([CLASS_3_SUFFIX]))
pushdef([CLASS_3_COMMAND],	[ class="ADD_CLASS([usc])]defn([CLASS_3_SUFFIX]))
pushdef([CLASS_3_WARN],	[ class="rs-tip-major ADD_CLASS([warn])]defn([CLASS_3_SUFFIX]))
pushdef([STYLE_4],		[ifelse([$#], [4], [], [$4], [], [], [ style="[$4]"])])
pushdef([ANYTHING_5],	[ifelse([$#], [5], [], [$5], [], [], [ [$5]])])

# html tag attributes groups
# β
pushdef([HTML_BRIDGEHEAD_ATTRIBUTES],	[ id="ADD_ID_RULE(defn([#ID]))"]defn([TITLE_2], [CLASS_3_BRIDGEHEAD], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_EXCL_ATTRIBUTES],	defn([ID_1_MONO], [TITLE_2], [CLASS_3_EXCL], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_GLOBAL_ATTRIBUTES],	defn([ID_1], [TITLE_2], [CLASS_3], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_HEADING_ATTRIBUTES],	[ id="ADD_ID_RULE(defn([#ID]))"]defn([TITLE_2], [CLASS_3_HEADING], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_INFO_ATTRIBUTES],	defn([ID_1_MONO], [TITLE_2], [CLASS_3_INFO], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_MONO_GLOBAL_ATTRIBUTES],	defn([ID_1_MONO], [TITLE_2], [CLASS_3], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_NOTE_ATTRIBUTES],	defn([ID_1_MONO], [TITLE_2], [CLASS_3_NOTE], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_COMMAND_ROOT_ATTRIBUTES],	defn([ID_1_SOURCE], [TITLE_2], [CLASS_3_ROOT_CMD], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_SOURCE_CODE_ATTRIBUTES],	defn([ID_1_SOURCE], [TITLE_2], [CLASS_3_SOURCE], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_COMMAND_ATTRIBUTES],	defn([ID_1_SOURCE], [TITLE_2], [CLASS_3_COMMAND], [STYLE_4], [ANYTHING_5]))
pushdef([HTML_WARN_ATTRIBUTES],	defn([ID_1_MONO], [TITLE_2], [CLASS_3_WARN], [STYLE_4], [ANYTHING_5]))

# convert {'&', '<', '>'} to html entities, strip trailing white chars
# β
#pushdef([PROCESS_RAW_CODE_TO_HTML_ENTITIES], [patsubst(patsubst(patsubst(patsubst(define([#], [[[[[$$#]]]]])indir([#], $@), [\s*]), [&], [&amp;]), [<], [&lt;]), [>], [&gt;])])

# convert {'&', '<'} to html entities, strip trailing white chars
pushdef([PROCESS_RAW_CODE_TO_HTML_ENTITIES], [patsubst(patsubst(patsubst(define([#], [[[[$$#]]]])indir([#], $@), [\s*]), [&], [&amp;]), [<], [&lt;])])

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

	# init indices
	# A → ε
	define([#S0])
	define([#S1])
	define([#S2])
])

# β
pushdef([HTML_MONOLINGUAL], [
	divert(CURRQU)dnl
<defn([##$0>])]defn([HTML_MONO_GLOBAL_ATTRIBUTES])[>EXPAND_ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</defn([##$0>])>
divert(-1)
])

# β
pushdef([HTML_MULTILINGUAL], [
	divert(CURRQU)dnl
<defn([##$0>])]defn([HTML_GLOBAL_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</defn([##$0>])>
divert(-1)
])

# A → β
define([PART], defn([PART_INIT])[

	# set value (used in multiple places)
	define([PART_val], EXPAND_LANG(]defn([EXPAND_LAST])[))
])

# β
define([CHAPTER_NEXT], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment index
	CHAPTER_COUNTER

	# assign indexes
	define([SECT1_COUNTER_val], 0)
	define([SECT2_COUNTER_val], 0)

	define([#S0], CHAPTER_COUNTER_val)

	divert(CHAPTER_NAVIG_DATA)dnl
<p id="defn([#ID], [TOC_ANCH])"><a href="[#]defn([#ID])"><b>defn([#S0], [#S1], [#S2])</b>SELITM</a></p>
divert(CURRQU)dnl
<h2]defn([HTML_HEADING_ATTRIBUTES])>defn([TOC_AND_ANCHOR])[SELITM]defn([GO_BACK_UP])[</h2>
divert(-1)

	# following bridgeheads
	define([HEADING_TAG], [h3])
])

#      _______________      ______________
# --->/ CHAPTER_FIRST \--->/ CHAPTER_NEXT \---.
#     \_______________/    \______________/<--'
# β
define([CHAPTER_FIRST], [

	# find the current index for navigation logic (previous part, current part, next part)
	define([CURRENT_INDEX], defn([#].LANG_CODE.defn([PART_val])))

	# no index means no input document (without PART)
	ifelse(defn([CURRENT_INDEX]), [], [

		ROOT_ERROR([unknown caption; run ‘make -B refs …’ to regenerate])
	])

	divert(START_OF_NAVIGATION)dnl table of content
<div id="ADD_ID_RULE(defn([NSP], [TOC_ANCH]))"><h2>defn([WORD_CONTENT])ifelse(defn(OTHER_LANG_CODE[_OTHER_LANG]), [], [],
[ (<a href="../defn([OTHER_LANGUAGE])defn(CURRENT_INDEX.OTHER_LANG_CODE.anch)/defn([OUTPUT_FILE], [#NSP], [TOC_ANCH])" title="defn(CURRENT_INDEX.OTHER_LANG_CODE.capt)">defn(OTHER_LANG_CODE[_OTHER_LANG])</a>)])</h2><div>dnl
<div class="ADD_CLASS([dwnl])">dnl
dnl
dnl the following code generates the links at the top of the download next to the TOC
dnl (the ARTICLE_PATH macro comes from the command line)
dnl
dnl the first line containing links to download files
dnl
<a href="SRC_FILE_PATH(__file__)" style="font-weight:bold" title="defn([WORD_ARTICLE_SOURCE])">mc</a>dnl
esyscmd([test -f ./]defn([ARTICLE_PATH])[/spell.txt])ifelse(sysval, [0],     [<a href="SRC_FILE_PATH(defn([ARTICLE_PATH])[/spell.txt])" title="defn([WORD_SPELL_TEXT])">spell</a>])dnl
esyscmd([test -f ./]defn([ARTICLE_PATH])[.txt])ifelse(sysval, [0],           [<a href="SRC_FILE_PATH(defn([ARTICLE_PATH])[.txt])" title="defn([WORD_ARTICLE_TEXT])">txt</a>])dnl
esyscmd([test -f ./]defn([ARTICLE_PATH])[/index.html])ifelse(sysval, [0],    [<a href="SRC_FILE_PATH(defn([ARTICLE_PATH])[/index.html])" title="defn([WORD_ARTICLE_DEVELOPMENT])">devel</a>])dnl
esyscmd([test -f ./]defn([ARTICLE_PATH])[/preview.html])ifelse(sysval, [0],  [<a href="SRC_FILE_PATH(defn([ARTICLE_PATH])[/preview.html])" title="defn([WORD_ARTICLE_PREVIEW])">preview</a>])dnl
esyscmd([test -f ./]defn([ARTICLE_PATH])[/publish.txt])ifelse(sysval, [0],   [<a href="SRC_FILE_PATH(defn([ARTICLE_PATH])[/publish.txt])" title="defn([WORD_PUBLISH_TEXT])">pub</a>])dnl
<br>dnl … unfinished …
esyscmd([test -f ./]defn([ARTICLE_PATH])[.md])ifelse(sysval, [0],            [<a href="SRC_FILE_PATH(defn([ARTICLE_PATH])[.md])" title="defn([WORD_ARTICLE_MARKDOWN])">md</a>])dnl
[]NB()dnl
</div>dnl
ifdef([NEW_ARTICLE], [], [<div class="ADD_CLASS([updt])">WORD_UPDATED<br>SARG1(esyscmd(defn([DATE_COMMAND])))</div>])dnl
</div>dnl
</div>
divert(END_OF_NAVIGATION)dnl
<!-- article content -->
divert(APPENDIX_CONTENT_START)dnl
<!-- appendix content -->
divert(-1)

	# set article queue
	define([CURRQU], ARTICLE_CONTENT)

	# transition to next node
	define([$0], defn([CHAPTER_NEXT]))

]defn([CHAPTER_NEXT]))

# A → β
define([SECT1_ARTICLE], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment index
	SECT1_COUNTER
	define([SECT2_COUNTER_val], 0)

	# assign indexes
	define([#S0], CHAPTER_COUNTER_val)
	define([#S1], .SECT1_COUNTER_val)

	divert(CHAPTER_NAVIG_DATA)dnl
<p id="defn([#ID], [TOC_ANCH])" class="ADD_CLASS([l2])"><a href="[#]defn([#ID])"><b>defn([#S0], [#S1], [#S2])</b>SELITM</a></p>
divert(CURRQU)dnl
<h3]defn([HTML_HEADING_ATTRIBUTES])>defn([TOC_AND_ANCHOR])[SELITM]defn([GO_BACK_UP])[</h3>
divert(-1)

	# following bridgeheads
	define([HEADING_TAG], [h4])
])

# A → β
define([SECT2_ARTICLE], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment index
	SECT2_COUNTER

	# assign indexes
	define([#S0], CHAPTER_COUNTER_val)
	define([#S1], .SECT1_COUNTER_val)
	define([#S2], .SECT2_COUNTER_val)

	divert(CHAPTER_NAVIG_DATA)dnl
<p id="defn([#ID], [TOC_ANCH])" class="ADD_CLASS([l3])"><a href="[#]defn([#ID])"><b>defn([#S0], [#S1], [#S2])</b>SELITM</a></p>
divert(CURRQU)dnl
<h4]defn([HTML_HEADING_ATTRIBUTES])>defn([TOC_AND_ANCHOR])[SELITM]defn([GO_BACK_UP])[</h4>
divert(-1)

	# following bridgeheads
	define([HEADING_TAG], [h5])
])

# β
define([APPENDIX_NEXT], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment letter index
	define([APPENDIX_LETTER], format([%c], APPENDIX_COUNTER))
	define([SECT1_COUNTER_val], 0)
	define([SECT2_COUNTER_val], 0)

	# assign indexes
	define([#S0], APPENDIX_LETTER)

	# set the current queue
	define([CURRQU], APPENDIX_CONTENT)

	divert(APPENDIX_NAVIG_DATA)dnl
<p id="defn([#ID], [TOC_ANCH])"><a href="[#]defn([#ID])" title="defn([WORD_APPENDIX])"><b>defn([#S0], [#S1], [#S2])</b>SELITM</a></p>
divert(APPENDIX_NAVIGATION)dnl
undivert(CURRQU)dnl
<h2]defn([HTML_HEADING_ATTRIBUTES])>defn([TOC_AND_ANCHOR])[SELITM]defn([GO_BACK_UP])[</h2>
divert(-1)

	# following bridgeheads
	define([HEADING_TAG], [h3])

	# temporarily change the current queue
	pushdef([CURRQU], [APPENDIX_NAVIGATION])
	APPENDIX_APPEND_CODE()
	# set the previous queue
	popdef([CURRQU])
])

#      ________________      _______________
# --->/ APPENDIX_FIRST \--->/ APPENDIX_NEXT \---.
#     \________________/    \_______________/<--'
#      _______      ________________
# --->/ SECT1 \--->/ SECT1_APPENDIX \---.
#     \_SECT2_/    \_SECT2_APPENDIX_/<--'
#
# A → β
define([APPENDIX_FIRST], [

	# starting letter is 65: ord('A')
	define([APPENDIX_COUNTER], defn([COUNT_UP]))
	APPENDIX_COUNTER(65)

	divert(APPENDIX_NAVIG_DATA)dnl
<hr>
divert(-1)

	# transition to the next nodes
	define([APPENDIX], defn([APPENDIX_NEXT]))
	define([SECT1], defn([SECT1_APPENDIX]))
	define([SECT2], defn([SECT2_APPENDIX]))

]defn([APPENDIX_NEXT]))

# β
define([SECT1_APPENDIX], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment index
	SECT1_COUNTER
	define([SECT2_COUNTER_val], 0)

	# assign indexes
	define([#S0], APPENDIX_LETTER)
	define([#S1], .SECT1_COUNTER_val)

	divert(APPENDIX_NAVIGATION)dnl
<p id="defn([#ID], [TOC_ANCH])" class="ADD_CLASS([l2])"><a href="[#]defn([#ID])"><b>defn([#S0], [#S1], [#S2])</b>SELITM</a></p>
divert(CURRQU)dnl
<h3]defn([HTML_HEADING_ATTRIBUTES])>defn([TOC_AND_ANCHOR])[SELITM]defn([GO_BACK_UP])[</h3>
divert(-1)

	# following bridgeheads
	define([HEADING_TAG], [h4])
])

# β
define([SECT2_APPENDIX], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	# increment index
	SECT2_COUNTER

	# assign indexes
	define([#S0], APPENDIX_LETTER)
	define([#S1], .SECT1_COUNTER_val)
	define([#S2], .SECT2_COUNTER_val)

	divert(APPENDIX_NAVIGATION)dnl
<p id="defn([#ID], [TOC_ANCH])" class="ADD_CLASS([l3])"><a href="[#]defn([#ID])"><b>defn([#S0], [#S1], [#S2])</b>SELITM</a></p>
divert(CURRQU)dnl
<h4]defn([HTML_HEADING_ATTRIBUTES])>defn([TOC_AND_ANCHOR])[SELITM]defn([GO_BACK_UP])[</h4>
divert(-1)

	# following bridgeheads
	define([HEADING_TAG], [h5])
])

# β
pushdef([FIND_IMG_DIM], [

	# the "identify" program has a bug (silently ignores the missing file)
	ifelse(SARG1($6), [], [

		ROOT_ERROR([missing image name])
	])

	# find out image dimension (copy of the image is uploaded on server)
	define([IMAGE_DIM], esyscmd([identify -format "[%w, %h]" ]SARG1($6)))

	# test return value from an external commad
	ifelse(sysval, [0], [], [

		ROOT_ERROR([$3 image dimensions; you may not have ImageMagick installed])
	])
])

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
<img src="IMG_SRC($6)" alt="[]NB()" width="SARG1(IMAGE_DIM)" height="SARG2(IMAGE_DIM)"]defn([HTML_MONO_GLOBAL_ATTRIBUTES])[>
<p><em>WORD_IMAGE <a href="[#]defn(__file__.mono.[$1])" title="⚓">IMAGE_COUNTER</a>: EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</em></p>
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
<div]defn([HTML_NOTE_ATTRIBUTES])[>dnl
divert(-1)
	]defn([EXPAND_LAST])[

	divert(CURRQU)dnl
</div>
divert(-1)
])

# A → β
define([NOTE_MONO], [
	divert(CURRQU)dnl
<div]defn([HTML_NOTE_ATTRIBUTES])[>EXPAND_ARG1_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([NOTE], [
	divert(CURRQU)dnl
<div]defn([HTML_NOTE_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([WARN], [
	divert(CURRQU)dnl
<div]defn([HTML_WARN_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([EXCL], [
	divert(CURRQU)dnl
<div]defn([HTML_EXCL_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([INFO], [
	divert(CURRQU)dnl
<div]defn([HTML_INFO_ATTRIBUTES])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([TILE_BOX], [
	divert(CURRQU)dnl
<div]defn([ID_1], [TITLE_2], [CLASS_3_TILE], [STYLE_4])[>EXPAND_LANG_WITHOUT_TRAILING_LF(]defn([EXPAND_LAST])[)</div>
divert(-1)
])

# A → β
define([PROGRAMLISTING], [

	ADD_JAVASCRIPT_FOR_SOURCE_CODE()

	divert(CURRQU)dnl
<div]defn([HTML_SOURCE_CODE_ATTRIBUTES])><pre>defn([PROCESS_RAW_CODE_TO_HTML_ENTITIES])</pre>defn([ID_1_ANCHOR])[</div>
divert(-1)
])

# A → β
define([CMDSYNOPSIS], [
	divert(CURRQU)dnl
<div]defn([HTML_COMMAND_ATTRIBUTES])><pre>defn([PROCESS_RAW_CODE_TO_HTML_ENTITIES])</pre>defn([ID_1_ANCHOR])[</div>
divert(-1)
])

# A → β
define([CMDSYNOPSIS_ROOT], [
	divert(CURRQU)dnl
<div]defn([HTML_COMMAND_ROOT_ATTRIBUTES])><pre>defn([PROCESS_RAW_CODE_TO_HTML_ENTITIES])</pre>defn([ID_1_ANCHOR])[</div>
divert(-1)
])

# A → β
define([BRIDGEHEAD_MONO], defn([MONOLINGUAL_HEADINGS], [SET_ANCHOR])[

	divert(CURRQU)dnl
<HEADING_TAG]defn([HTML_BRIDGEHEAD_ATTRIBUTES])>defn([CHAPTER_INDEXES])[SELITM]defn([GO_BACK_UP])[</HEADING_TAG>
divert(-1)
])

# A → β
define([BRIDGEHEAD], defn([MULTILINGUAL_HEADINGS], [SET_ANCHOR])[

	divert(CURRQU)dnl
<HEADING_TAG]defn([HTML_BRIDGEHEAD_ATTRIBUTES])>defn([CHAPTER_INDEXES])[SELITM]defn([GO_BACK_UP])[</HEADING_TAG>
divert(-1)
])

# β
pushdef([HTML_UNPAIRED_TAG], [

	divert(CURRQU)dnl
<defn([##$0>])]defn([HTML_MONO_GLOBAL_ATTRIBUTES])[>
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
define([DIV],		defn([HTML_MULTILINGUAL]))
define([##DIV>],		[div])
define([DIV_MONO],		defn([HTML_MONOLINGUAL]))
define([##DIV_MONO>],	[div])
define([##DIV_WRAP>],	[div])
define([ENTRY],		defn([HTML_MULTILINGUAL]))
define([ENTRY_HEAD],	defn([HTML_MULTILINGUAL]))
define([ENTRY_HEAD_MONO],	defn([HTML_MONOLINGUAL]))
define([##ENTRY_HEAD_MONO>],	[th])
define([##ENTRY_HEAD>],	[th])
define([ENTRY_MONO],	defn([HTML_MONOLINGUAL]))
define([##ENTRY_MONO>],	[td])
define([##ENTRY>],		[td])
define([FIGCAPTION],	defn([HTML_MULTILINGUAL]))
define([##FIGCAPTION>],	[figcaption])
define([FIGCAPTION_MONO],	defn([HTML_MONOLINGUAL]))
define([##FIGCAPTION_MONO>],	[figcaption])
define([FIGURE_WRAP],	defn([DIV_WRAP]))
define([##FIGURE_WRAP>],	[figure])
define([FOOTER_WRAP],	defn([DIV_WRAP]))
define([##FOOTER_WRAP>],	[footer])
define([FORM_WRAP],		defn([DIV_WRAP]))
define([##FORM_WRAP>],	[form])
define([HEADER_WRAP],	defn([DIV_WRAP]))
define([##HEADER_WRAP>],	[header])
define([HORIZONTAL_RULE],	defn([HTML_UNPAIRED_TAG]))
define([##HORIZONTAL_RULE>],	[hr])
define([INPUT],		defn([HTML_UNPAIRED_TAG]))
define([##INPUT>],		[input])
define([ITEMIZEDLIST_WRAP],	defn([DIV_WRAP]))
define([##ITEMIZEDLIST_WRAP>],	[ul])
define([LISTITEM],		defn([HTML_MULTILINGUAL]))
define([##LISTITEM>],	[li])
define([LISTITEM_MONO],	defn([HTML_MONOLINGUAL]))
define([##LISTITEM_MONO>],	[li])
define([MAIN_WRAP],		defn([DIV_WRAP]))
define([##MAIN_WRAP>],	[main])
define([NAV],		defn([HTML_MULTILINGUAL]))
define([NAV_MONO],		defn([HTML_MONOLINGUAL]))
define([##NAV_MONO>],	[nav])
define([##NAV>],		[nav])
define([ORDEREDLIST_WRAP],	defn([DIV_WRAP]))
define([##ORDEREDLIST_WRAP>],	[ol])
define([PARA],		defn([HTML_MULTILINGUAL]))
define([PARA_MONO],		defn([HTML_MONOLINGUAL]))
define([##PARA_MONO>],	[p])
define([##PARA>],		[p])
define([ROW_WRAP],		defn([DIV_WRAP]))
define([##ROW_WRAP>],	[tr])
define([SECTION_WRAP],	defn([DIV_WRAP]))
define([##SECTION_WRAP>],	[section])
define([SUMMARY],		defn([HTML_MULTILINGUAL]))
define([SUMMARY_MONO],	defn([HTML_MONOLINGUAL]))
define([##SUMMARY_MONO>],	[summary])
define([##SUMMARY>],	[summary])
define([##TABLE_COL>],	[col])
define([TABLE_COL],		defn([HTML_UNPAIRED_TAG]))
define([##TABLE_COLGROUP_WRAP>],	[colgroup])
define([TABLE_COLGROUP_WRAP],	defn([DIV_WRAP]))
define([TABLE_WRAP],	defn([DIV_WRAP]))
define([##TABLE_WRAP>],	[table])
define([TBODY_WRAP],	defn([DIV_WRAP]))
define([##TBODY_WRAP>],	[tbody])
define([TFOOT_WRAP],	defn([DIV_WRAP]))
define([##TFOOT_WRAP>],	[tfoot])
define([THEAD_WRAP],	defn([DIV_WRAP]))
define([##THEAD_WRAP>],	[thead])
define([##TTITLE>],		[caption])
define([TTITLE],		defn([HTML_MULTILINGUAL]))
define([##TTITLE_MONO>],	[caption])
define([TTITLE_MONO],	defn([HTML_MONOLINGUAL]))

# forget local β rules (good for frozen files)
popdef(

	[ANYTHING_5],
	[CLASS_3],
	[CLASS_3_BRIDGEHEAD],
	[CLASS_3_COMMAND],
	[CLASS_3_EXCL],
	[CLASS_3_HEADING],
	[CLASS_3_INFO],
	[CLASS_3_NOTE],
	[CLASS_3_ROOT_CMD],
	[CLASS_3_SOURCE],
	[CLASS_3_SUFFIX],
	[CLASS_3_TILE],
	[CLASS_3_WARN],
	[FIND_IMG_DIM],
	[HTML_BRIDGEHEAD_ATTRIBUTES],
	[HTML_COMMAND_ATTRIBUTES],
	[HTML_COMMAND_ROOT_ATTRIBUTES],
	[HTML_EXCL_ATTRIBUTES],
	[HTML_GLOBAL_ATTRIBUTES],
	[HTML_INFO_ATTRIBUTES],
	[HTML_MONOLINGUAL],
	[HTML_MONO_GLOBAL_ATTRIBUTES],
	[HTML_MULTILINGUAL],
	[HTML_NOTE_ATTRIBUTES],
	[HTML_SOURCE_CODE_ATTRIBUTES],
	[HTML_UNPAIRED_TAG],
	[HTML_WARN_ATTRIBUTES],
	[ID_1],
	[ID_1_ANCHOR],
	[PROCESS_RAW_CODE_TO_HTML_ENTITIES],
	[SET_ANCHOR],
	[STYLE_4],
	[TITLE_2],

)
