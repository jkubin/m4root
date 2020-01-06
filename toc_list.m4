__HEADER([Josef Kubin], [2019/11/29], [root_cz])
___DESCR([generates the necessary common macros for other M4 scripts])
___POINT([the order is based on the queue index])

# creates a skeleton for the file
divert(0)dnl
[#] DONTE()

[#] all source files in the order in which they are written to the file: TOC_FILE_NAME
# A → β
[define([TABLE_OF_CONTENT], ]LB()
divert(END_OF_TOC)dnl
])

[#] all languages in the order in which they are written to the file: TOC_FILE_NAME
# A → β
[define([LANG_INDEX], ]LB()
divert(END_OF_LANG_CODES)dnl
])

# map language codes to indexes
# A → β
divert(-1)

# A → β
define([CREATE_LANG_LIST], [

	# test if lang code exists
	ifdef([LANG_CODE_$1], [], [

		ROOT_ERROR([new lang code ‘$1’ found, open the ‘]TOC_FILE_NAME[’ and include it in the lang code list])
	])

	# create ordered list of languages according to the TOC_FILE_NAME
	divert(LANG_CODE_$1)dnl
	LANG_INDEX_ITEM([[$1]], [[LANG_$1]])
divert(END_OF_LANG_CODES)dnl
[define([LANG_INDEX_$1], ]eval(LANG_CODE_$1 - END_OF_TOC))
divert(-1)

	# loop end condition
	ifelse([$#], [1], [], [

		# recursive loop
		$0(shift($@))
	])
])

# creates a list of languages by TOC_FILE_NAME order
CREATE_LANG_LIST(ALL_LANGS)

# A → β
define([CREATE_TABLE_OF_CONTENT], [

	# test if file is defined
	ifdef([$1], [], [

		ROOT_ERROR([a new file ‘$1’ found, open the ‘]TOC_FILE_NAME[’ and include it to file list])
	])

	# create ordered list of languages according to the TOC_FILE_NAME
	divert(defn([$1]))dnl
	TABLE_OF_CONTENT_ITEM([[$1]], $[1])
divert(-1)

	# loop end condition
	ifelse([$#], [1], [], [

		# recursive loop
		$0(shift($@))
	])
])

# creates a list of files by TOC_FILE_NAME order
CREATE_TABLE_OF_CONTENT(FILE_LIST)
