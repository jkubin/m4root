__HEADER([Josef Kubin], [2020/05/19], [text])
___DESCR([table of content; all parts of the series])
___POINT([not finished yet])

# if multilingual pages are generated
ifelse(defn(OTHER_LANG_CODE[]_OTHER_LANG), [], [], [

	# create an HTML link to another language
	define([SWITCH_TO_ANOTHER_LANGUAGE], [ ](ARG1(OTHER_LANG_CODE)_OTHER_LANG))
])

# this is the beginning of the page
divert(START_OF_NAVIGATION)dnl table of content
dnl
defn([WORD_CONTENT], [SWITCH_TO_ANOTHER_LANGUAGE])			dnl
ifdef([NEW_ARTICLE], [], [WORD_UPDATED SARG1(esyscmd(defn([DATE_COMMAND])))])
divert(APPENDIX_NAVIGATION)dnl

divert(-1)

# the following code tests state of the REF automaton
# if the REF macro was used somewhere in the source document it changes automaton state to the REF_NEXT state
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
defn([#S0], [#S1], [#S2]) WORD_REFERENCES
divert(ARTICLE_REFER_CAPT)dnl
defn([#S0], [#S1], [#S2]) WORD_REFERENCES
divert(-1)
])

# if enabled, adds a code to references
ifdef([ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES], [

	# A → β
	define([TABLE_OF_CONTENT_ITEM], [

		# if multilingual pages are generated
		ifelse([$3], [], [], [

			# add prefered language
			define([ALL_PARTS_REF_TO_PREFERED_LANGUAGE], [, $3
])
		])

		divert(ALL_PARTS_ITEMS)dnl
defn([ALL_PARTS_REF_TO_PREFERED_LANGUAGE])dnl
divert(-1)
	])

	# create table of content for all parts
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

	# add item to navigation and below the page
	divert(CHAPTER_NAVIG_DATA)dnl
defn([#S0], [#S1], [#S2]) SENTENCE_ALL_PARTS
divert(ALL_PARTS_LIST)dnl
defn([#S0], [#S1], [#S2]) SENTENCE_ALL_PARTS
divert(-1)
])
