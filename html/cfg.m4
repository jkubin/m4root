__HEADER([Josef Kubin], [2019/12/09], [root_cz])
___DESCR([main configuration for the html template])
___POINT([one place to configure ALL generated web pages])

# /!\ in constant development /!\

# add all parts of the series
# A → ε
#define([ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES])

# β
define([BACK_TO_TOC],		[<a href="[#]defn([#ID], [TOC_ANCH])" title="defn([WORD_CONTENT])"></a>])
define([CHAPTER_INDEXES],	[<a href="[#]defn([#ID])" title="⚓">defn([#S0], [#S1], [#S2])</a>])
define([GO_BACK_UP],		[<a href="defn([#NSP], [TOC_ANCH])" title="defn([WORD_TOP])"></a>])

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
# - max. length (32) of html anchors is hard-coded in the sed file "refs.sed"
# - sed file "html/publish.sed" finally converts multibyte UTF-8 characters to HTML entities
#
################################################################################
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
