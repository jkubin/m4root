__HEADER([Josef Kubin], [2019/12/09], [root_cz])
___DESCR([main configuration of html template])
___POINT([one place to configure ALL generated web pages])

# /!\ in constant development /!\

# add all parts of the series
# A → ε
#define([ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES])

# A → β
# β
define([RETURN_TO_TOC], NB()[AH([☰], defn([WORD_CONTENT]), [jmp], [#]ADD_ID_RULE(TOCP-defn([#ID])))])
# or disable the links to TOC (if you do not like it)
# A → ε
#define([RETURN_TO_TOC])

# links pointing to the top of the page; possible chars: 🠑ꜛ↑⇈⇧↾↿↟⤒
# β
#define([ESCAPE_FROM_TOC], NB2()[AH([🡅], defn([WORD_TOP]), [top], [#])])

# TODO: link to other language (not finished yet, if finished ever)
# β
#define([SWITCH_LANG], NB()[<a href="[#]">SUP([(en)])</a>])

# anchor sign for captions and chapters (choose what you like)
# β
define([ANCHOR_SIGN], [ title="⚓"])
#define([ANCHOR_SIGN], [ title="🔗"])

# add a reference link to the heading
# β
define([REFERENCE_TO_HEADLINE], [<a href="[#]NSP()defn([#ID])"]defn([ANCHOR_SIGN])[>»</a>]NB())

# a folder containing generated files such as root files, vim shortcut files and M4 plugins
# A → β
define([FOLDER_FOR_GENERATED_FILES], [gfiles/])

################################################################################
#
# Technical Notes:
#
# - max. length (32) of html anchors is hard-coded in the sed file "anchors.sed"
# - sed file "html/publish.sed" finally converts multibyte UTF-8 characters to HTML entities
#
################################################################################
#
# HTML configuration (do not change it unless you know what you are doing):
#
# Table Of Content Prefix; caption; refs; all parts of the series
# A → β
define([TOCP],		[toc])
define([TOC_TOP],	[toc-capt])
define([TOC_REFS],	[refs])
define([TOC_ALL_PARTS],	[all-parts])

# namespace prefix
# /!\ keep trailing non word character or empty brackets /!\
# A → β
define([NSP],		[m4-])
#define([NSP],		[usr-])
#define([NSP],		[foo[]])	<--- if no hyphen-minus, use empty brackets
# or disable it (risky, anchors and CSS may interfere with the parent page)
# A → ε
#define([NSP])
