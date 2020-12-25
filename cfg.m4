__HEADER([Josef Kubin], [2019/12/09], [root_cz])
___DESCR([configuration file for all generated files])
___POINT([one file to configure all generated files])

# /!\ in constant development /!\

# uncomment PROMPT() what you like more:
# [
# nice looking user command line PROMPT() ---> ~]$
# [
# nice looking user command line PROMPT(path) ---> path]$
#
# A → β
#define([PROMPT], [ifelse([$#], [0], [[$0]], [$1], [], [~RB()$], [[$1]RB()$])])

# or briefly PROMPT() ---> $
define([PROMPT], [ifelse([$#], [0], [[$0]], [$])])

# uncomment PROMPT_ROOT() what you like more:
# [
# nice looking root command line PROMPT_ROOT() ---> ~]#
# [
# nice looking root command line PROMPT_ROOT(path) ---> path]#
#
# A → β
#define([PROMPT_ROOT], [ifelse([$#], [0], [[$0]], [$1], [], [~RB()[#]], [[$1]RB()[#]])])

# or briefly PROMPT_ROOT() --->  #
define([PROMPT_ROOT], [ifelse([$#], [0], [[$0]], [[#]])])

# add all parts of the series
# A → ε
#define([ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES])

# a folder containing generated files such as root files, vim shortcut files and M4 plugins
# A → β
define([FOLDER_FOR_GENERATED_FILES], [gfiles/])

# default color for highlighting parts of the source code
# A → β
#define([DEFAULT_HIGHLIGHT_COLOR], [greenyellow])
define([DEFAULT_HIGHLIGHT_COLOR], [lawngreen])

################################################################################
#
# Technical Notes:
#
# max. length (32) of anchors is hard-coded in the file "refs.sed"
#
# namespace prefix
# A → β
define([NSP],		[m4-])
#define([NSP],		[foo-])
#define([NSP],		[usr-])
#define([NSP],		[pepa-])

# do not change it unless you know what you are doing
# A → β
define([#NSP], 		[#]defn([NSP]))
define([REF_ANCH],	[ref])
define([TOC_ALL_PARTS],	[all-parts])
define([TOC_ANCH],	[-toc])
define([TOC_REFS],	[links])

# or deactivate it completely
# /!\ risky, anchors and CSS class names _WILL_INTERFERE_ with the parent page /!\
# A → ε
#define([NSP])
