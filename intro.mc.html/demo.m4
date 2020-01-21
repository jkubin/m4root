__HEADER([Josef Kubin], [2020/01/12], [intro.mc.html])
___DESCR([introductory parts have specific demands for files])
___POINT([specific file (not for general use)])

# INSERT_FILES_HELLO_WORLD([q], [qnames])
# A → β
define([INSERT_FILES_HELLO_WORLD], [
	CONFIGURE_COMMAND_LINE(
[hello_world/],dnl			common sub-folder name (or use absolute paths)
[m4 -DSYMBOL='Hello, world!' ],dnl	command and its options
[root$1.m4],dnl				root file
)
	INSERT_LIST_OF_FILES([$2.m4], [hello_world.$2])
])

# INSERT_FILES_PREPROC([b], [file.c])
# A → β
define([INSERT_FILES_PREPROC], [
	CONFIGURE_COMMAND_LINE(
[preproc/],dnl				common sub-folder name (or use absolute paths)
[m4 -DSYMBOL='Hello, world!' ],dnl	command and its options
[root$1.m4],dnl				root file
)
	INSERT_LIST_OF_FILES([$2.m4], [$2], [preproc.$2])
])

# INSERT_FILES_MESSAGES([one.m4], [two.m4], [three.m4], …, [output.file])
# A → β
define([INSERT_FILES_MESSAGES], [
	CONFIGURE_COMMAND_LINE(
[messages/],dnl				common sub-folder name (or use absolute paths)
[m4 ],dnl				command and its options
[rootb.m4],dnl				root file
[],dnl					prefix files
[messages.mc],dnl			source file or comma separated source files
)
	INSERT_LIST_OF_FILES($@)
])
