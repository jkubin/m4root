__HEADER([Josef Kubin], [2019/12/01], [root_cz])
___DESCR([navigation logic for HTML page; table of content; all parts of the series])
___POINT([common script for preview and publish])

# if enabled
ifdef([ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES], [

	# A → β
	define([TABLE_OF_CONTENT_ITEM], [

		# if multilingual pages are generated
		ifelse([$3], [], [], [

			# add reference to prefered language
			define([ALL_PARTS_REF_TO_PREFERED_LANGUAGE],
			[,] <a href="../defn([RELAT_PATH])defn([$1.$3.anch])/defn([INDEX_HTML])" title="defn([$1.$3.capt])">$3</a>)
		])

		divert(ALL_PARTS_ITEMS)dnl
<li>ifdef([this.]defn([$1.$2.capt]),
[defn([$1.$2.capt])],
[<a href="../defn([$1.$2.anch])/defn([INDEX_HTML])">defn([$1.$2.capt])</a>])defn([ALL_PARTS_REF_TO_PREFERED_LANGUAGE])</li>
divert(-1)
	])

	# "this.page name" disables link for "this" page (because it looks better :-)
	define(this.defn([CAPTION]))

	# creates table of content for all parts
	ifelse(defn(OTHER_LANG_CODE.[LANG_VERSION]), [], [

		TABLE_OF_CONTENT(LANG_CODE)
	], [
		TABLE_OF_CONTENT(LANG_CODE[,] OTHER_LANG_CODE)
	])
])

# find the current index for navigation logic (previous part, current part, next part)
define([CURRENT_INDEX], defn([#].LANG_CODE.defn([CAPTION])))

# empty index means no input document (without CAPTION)
ifelse(defn([CURRENT_INDEX]), [], [

	ROOT_ERROR([unknown caption; run ‘make -B refs …’ to regenerate])
])

# if multilingual pages are generated
ifelse(defn(OTHER_LANG_CODE.[LANG_VERSION]), [], [], [

	# create HTML code to next language
	define([SWITCH_TO_ANOTHER_LANGUAGE],
	NB()(<a href="../defn([OTHER_LANGUAGE])defn(CURRENT_INDEX.OTHER_LANG_CODE.anch)/defn([INDEX_HTML])">defn(OTHER_LANG_CODE.[LANG_VERSION])</a>))
])

# this is the TOC name at the beginning of page
divert(START_OF_NAVIGATION)dnl
<!-- table of content -->
<h2 id="NSP()TOC_TOP">WORD_CONTENT[]ifdef([ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES],
[NB()AH(JUMP_TO_TOC, defn([SENTENCE_ALL_PARTS]), [jmp], [#]NSP()defn([TOC_ALL_PARTS]))])defn([SWITCH_TO_ANOTHER_LANGUAGE])</h2>
divert(END_OF_NAVIGATION)dnl
<!-- article content -->
divert(ANNEX_CONTENT_START)dnl
<!-- annex content -->
divert(-1)

# the following code tests state of the REF automaton
# if the REF were used somewhere in the source document it changes automaton state to the REF_NEXT state
ifelse(defn([REF]), defn([REF_NEXT]), [

	# increment chapter index for rerences
	define([CHAPTER_IDX], incr(CHAPTER_IDX))

	# set link to references
	define([#ID], defn([TOC_REFS]))

	# add item to navigation and below the page
	# it have to be here because it is the last but one index, it can not be in the REF automaton
	divert(CHAPTER_NAVIG_DATA)dnl
<p id="NSP()TOCP-defn([#ID])"><a href="[#]NSP()defn([#ID])">CHAPTER_IDX()NB2()WORD_REFERENCES</a></p>
divert(ARTICLE_REFER_CAPT)
<!-- article references -->
<h2 id="NSP()defn([#ID])"><a href="[#]NSP()defn([#ID])"defn([ANCHOR_SIGN])>CHAPTER_IDX</a>NB2()WORD_REFERENCES[]RETURN_TO_TOC</h2>
divert(-1)
])

# if enabled
ifdef([ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES], [

	define([#ID], defn([TOC_ALL_PARTS]))

	# increment chapter index (this is the last item in navigation)
	define([CHAPTER_IDX], incr(CHAPTER_IDX))

	# add item to navigation and below the page
	divert(CHAPTER_NAVIG_DATA)dnl
<p id="NSP()TOCP-defn([#ID])"><a href="[#]NSP()defn([#ID])">CHAPTER_IDX()NB2()SENTENCE_ALL_PARTS</a></p>
divert(ALL_PARTS_LIST)dnl
<h2 id="NSP()defn([#ID])"><a href="[#]NSP()defn([#ID])"defn([ANCHOR_SIGN])>CHAPTER_IDX</a>NB2()SENTENCE_ALL_PARTS[]RETURN_TO_TOC</h2>
<ol>
divert(ALL_PARTS_LIST_END)dnl
</ol>
divert(-1)
])
