__HEADER([Josef Kubin], [2019/12/01], [root_cz])
___DESCR([navigation logic for HTML page; table of content; all parts of the series])
___POINT([common script for preview and publish])

# find the current index for navigation logic (previous part, current part, next part)
define([CURRENT_INDEX], defn([#].LANG_CODE.defn([PART_val])))

# empty index means no input document (without PART)
ifelse(defn([CURRENT_INDEX]), [], [

	ROOT_ERROR([unknown caption; run ‘make -B refs …’ to regenerate])
])

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

# if enabled, adds a code to references
ifdef([ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES], [

	# A → β
	define([TABLE_OF_CONTENT_ITEM], [

		# if multilingual pages are generated
		ifelse([$3], [], [], [

			# add reference to prefered language
			define([ALL_PARTS_REF_TO_PREFERED_LANGUAGE],
			[,] <a href="../defn([RELAT_PATH])defn([$1.$3.anch])/defn([OUTPUT_FILE], [#NSP], [TOC_ANCH])" title="defn([$1.$3.capt])">$3</a>)
		])

		divert(ALL_PARTS_ITEMS)dnl
<li>ifdef([this.]defn([$1.$2.capt]),
[defn([$1.$2.capt])],
[<a href="../defn([$1.$2.anch])/defn([OUTPUT_FILE], [#NSP], [TOC_ANCH])">defn([$1.$2.capt])</a>])defn([ALL_PARTS_REF_TO_PREFERED_LANGUAGE])</li>
divert(-1)
	])

	# "this.page name" disables link for "this" page (because it looks better :-)
	define(this.defn([PART_val]))

	# creates table of content for all parts
	ifelse(defn(OTHER_LANG_CODE[]_OTHER_LANG), [], [

		TABLE_OF_CONTENT(LANG_CODE)
	], [
		TABLE_OF_CONTENT(LANG_CODE[,] OTHER_LANG_CODE)
	])

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
