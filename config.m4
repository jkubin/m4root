__AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,09⟧)
___DESCR(⟦global configuration file for all generated files⟧)
__REASON(⟦one file to configure everything⟧)

# /!\ in constant development /!\

# A → β
define(⟦AUTHOR_NAME⟧,		⟦Josef Kubín⟧)
define(defn(⟦AUTHOR_NAME⟧),	⟦pepa.png⟧)	<--- an image of the author associated with the author's name
define(⟦AUTHOR_NAME_SHORT⟧,	⟦jkubin⟧)
define(⟦FAVORITE_SERVER_NAME⟧,	⟦www.root.cz⟧)

# A → β
define(⟦AUTHOR_SHORT_DESCRIPTION⟧, LANG(⟦
PERSON(⟦AUTHOR_NAME⟧) vystudoval Fakultu⟦⟧NB()informatiky Masarykovy univerzity v Brně, zabýval se teoretickou informatikou a⟦⟧NB()programováním hardware.
Pracuje ve společnosti Red⟦⟧NB()Hat v⟦⟧NB()ABBREV(⟦GSS⟧, ⟦Global Support Services⟧).
⟧,dnl _next_language_
⟦
PERSON(⟦AUTHOR_NAME⟧) graduated from the Faculty of Informatics, Masaryk University, where he studied theoretical computer science and hardware programming.
Works at Red⟦⟧NB()Hat in⟦⟧NB()ABBREV(⟦GSS⟧, ⟦Global Support Services⟧).
⟧))

# uncomment what you like more:
# PRMT() ---> ~]$
# PRMT(path) ---> path]$
#define(⟦PRMT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$1⟧, ⟦⟧, ⟦~]$⟧, ⟦⟦$1⟧]$⟧)⟧)

# or briefly PRMT() ---> $
define(⟦PRMT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$⟧)⟧)

# uncomment what you like more:
# PRMT_ROOT() ---> ~]#
# PRMT_ROOT(path) ---> path]#
#define(⟦PRMT_ROOT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$1⟧, ⟦⟧, ⟦~]⟦#⟧⟧, ⟦⟦$1]#⟧⟧)⟧)

# or briefly PRMT_ROOT() --->  #
define(⟦PRMT_ROOT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦⟦#⟧⟧)⟧)

# add all parts of the series
# A → ε
#define(⟦ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES⟧)

# a folder containing generated files such as root files, vim shortcut files and M4 plugins
# A → β
define(⟦FOLDER_FOR_GENERATED_FILES⟧, ⟦gfiles/⟧)

# default color for highlighting parts in the HTML code (mouse highlights a source code)
# A → β
#define(⟦DEFAULT_HIGHLIGHT_COLOR⟧, ⟦greenyellow⟧)
define(⟦DEFAULT_HIGHLIGHT_COLOR⟧, ⟦lawngreen⟧)

################################################################################
# namespace prefix configuration for anchors, CSS, ...
# A → β
define(⟦NSP⟧,		⟦m4-⟧)
#define(⟦NSP⟧,		⟦pepa-⟧)
#
# or deactivate it completely, if you know what are you doing
# /!\ risky, anchors and CSS class names _WILL_INTERFERE_ with the parent page /!\
# A → ε
#define(⟦NSP⟧)

# do not change it unless you know what you are doing
# A → β
define(⟦#NSP⟧, 		⟦#⟧defn(⟦NSP⟧))
define(⟦REF_ANCH⟧,	⟦ref⟧)
define(⟦TOC_ALL_PARTS⟧,	⟦all-parts⟧)
define(⟦TOC_ANCH⟧,	⟦-toc⟧)
define(⟦TOC_REFS⟧,	⟦links⟧)

# Technical note:
# max. length (32) for anchors is hard-coded in the file "refs.sed"
# the limit is artificial and can be extended to any length
