__HEADER([Josef Kubin], [2019/12/28], [root_cz])
___DESCR([specific definitions for each part of the series to avoid repeating the code])
___POINT([how to avoid keyword "include" (Makefile can't see included files)])

# A → β
define([INSERT_FILES_MESSAGES_QUEUES_MARKUP], [
	CONFIGURE_COMMAND_LINE(
[messages/],dnl			common sub-folder name (or use absolute paths)
[m4 ],dnl			command and its options
[rootb.m4],dnl			root file
[queues.m4],dnl			prefix files
[markup.m4, messages.mc],dnl	source file or comma separated source files
)
	INSERT_LIST_OF_FILES($@)
])

# A → β
define([INSERT_FILES_MESSAGES_MARKUP], [
	CONFIGURE_COMMAND_LINE(
[messages/],dnl			common sub-folder name (or use absolute paths)
[m4 ],dnl			command and its options
[rootb.m4],dnl			root file
[],dnl				prefix files
[markup.m4, messages.mc],dnl	source file or comma separated source files
)
	INSERT_LIST_OF_FILES($@)
])

# A → β
define([INSERT_FILES_MESSAGES_QUEUES_CODE], [
	CONFIGURE_COMMAND_LINE(
[messages/],dnl			common sub-folder name (or use absolute paths)
[m4 ],dnl			command and its options
[rootb.m4],dnl			root file
[],dnl				prefix files
[queues.m4, code.m4, messages.mc],dnl	source file or comma separated source files
)
	INSERT_LIST_OF_FILES($@)
])

# A → β
define([INSERT_FILES_MESSAGES_CODE], [
	CONFIGURE_COMMAND_LINE(
[messages/],dnl			common sub-folder name (or use absolute paths)
[m4 ],dnl			command and its options
[rootb.m4],dnl			root file
[],dnl				prefix files
[code.m4, messages.mc],dnl	source file or comma separated source files
)
	INSERT_LIST_OF_FILES($@)
])

# A → β
define([INSERT_FILES_MESSAGES_DOUBLEQ], [
	CONFIGURE_COMMAND_LINE(
[messages/],dnl			common sub-folder name (or use absolute paths)
[m4 ],dnl			command and its options
[rootb.m4],dnl			root file
[],dnl				prefix files
[doubleq.m4, messages.mc],dnl	source file or comma separated source files
)
	INSERT_LIST_OF_FILES($@)
])

# A → β
define([INSERT_FILES_MESSAGES_APOSTROPHE], [
	CONFIGURE_COMMAND_LINE(
[messages/],dnl			common sub-folder name (or use absolute paths)
[m4 ],dnl			command and its options
[rootb.m4],dnl			root file
[],dnl				prefix files
[apost.m4, messages.mc],dnl	source file or comma separated source files
)
	INSERT_LIST_OF_FILES($@)
])

# A → β
define([INSERT_FILES_RAW_MESSAGES], [
	CONFIGURE_COMMAND_LINE(
[messages/],dnl			common sub-folder name (or use absolute paths)
[m4 ],dnl			command and its options
[rootb.m4],dnl			root file
[],dnl				prefix files
[messages_raw.mc],dnl		source file or comma separated source files
)
	INSERT_LIST_OF_FILES($@)
])
