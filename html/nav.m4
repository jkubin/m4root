__HEADER([Josef Kubin], [2019/12/01], [root_cz])
___DESCR([navigation logic for HTML page; table of content; all parts of the series])
__REASON([common script for preview and publish])

# if the REF was used it changes automaton state to the REF_NEXT node
ifelse(defn([REF]), defn([REF_NEXT]), [

	# increment chapter index for references
	CHAPTER_COUNTER

	# assign indexes
	define([#S0], CHAPTER_COUNTER_val)
	define([#S1])
	define([#S2])

	# set link to references
	define([#ID], defn([NSP], [TOC_REFS]))

	# add item to navigation and below the page
	# it have to be here because it is the last but one index, it can not be in the REF automaton
	divert(CHAPTER_NAVIG_DATA)dnl
<p id="defn([#ID], [TOC_ANCH])"><a href="[#]defn([#ID])"><b>defn([#S0], [#S1], [#S2])</b>WORD_REFERENCES</a></p>
divert(ARTICLE_REFER_CAPT)dnl
<!-- article references -->
<h2 id="defn([#ID])" class="ADD_CLASS([ch])">]defn([TOC_AND_ANCHOR], [WORD_REFERENCES], [GO_BACK_UP])[</h2>
divert(-1)
])

# A → β
define([MAKE_ALL_PARTS], [

	ifelse([$1], [], [], [

		divert(ALL_PARTS_ITEMS)dnl
<li>ifdef([this.]defn([$1].LANG_CODE.capt),
[defn([$1].LANG_CODE.capt)],
[<a href="../defn([$1].LANG_CODE.anch)/defn([OUTPUT_FILE], [#NSP], [TOC_ANCH])">defn([$1].LANG_CODE.capt)</a>])dnl
ifdef(OTHER_LANG_CODE[_OTHER_LANG],
[, <a href="../defn([RELAT_PATH])defn([$1].OTHER_LANG_CODE.anch)/defn([OUTPUT_FILE], [#NSP], [TOC_ANCH])" title="defn([$1].OTHER_LANG_CODE.capt)">OTHER_LANG_CODE</a>])dnl
</li>
divert(-1)

		# right recursive loop
		$0(shift($@))
	])
])

# if enabled, adds a code to references
ifdef([ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES], [

	# "this.page name" disables link for "this" page (because it looks better :-)
	define(this.defn([PART_val]))

	MAKE_ALL_PARTS(FILE_LIST)

	# increment chapter index (this is the last item in navigation)
	CHAPTER_COUNTER

	# assign indexes
	define([#S0], CHAPTER_COUNTER_val)
	define([#S1])
	define([#S2])

	# set link to references
	define([#ID], defn([NSP], [TOC_ALL_PARTS]))

	# add item to navigation and below the page
	divert(CHAPTER_NAVIG_DATA)dnl
<p id="defn([#ID], [TOC_ANCH])"><a href="[#]defn([#ID])"><b>defn([#S0], [#S1], [#S2])</b>SENTENCE_ALL_PARTS</a></p>
divert(ALL_PARTS_LIST)dnl
<h2 id="defn([#ID])" class="ADD_CLASS([ch])">]defn([TOC_AND_ANCHOR], [SENTENCE_ALL_PARTS], [GO_BACK_UP])[</h2>
<ol>
divert(ALL_PARTS_LIST_END)dnl
</ol>
divert(-1)
])
