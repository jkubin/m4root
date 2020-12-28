__HEADER(⟦Josef Kubin⟧, ⟦2019/12/09⟧)
___DESCR(⟦configuration file for all generated files⟧)
__REASON(⟦one file to configure all generated files⟧)

# /!\ in constant development /!\

# A → β
define(⟦AUTHOR_NAME⟧,		⟦Josef Kubín⟧)
# associative image
define(defn(⟦AUTHOR_NAME⟧),	⟦pepa.png⟧)
define(⟦AUTHOR_NAME_SHORT⟧,	⟦jkubin⟧)

# A → β
define(⟦AUTHOR_SHORT_DESCRIPTION⟧, LANGW(⟦dnl _first_language_
PERSON(⟦AUTHOR_NAME⟧) vystudoval Fakultu⟦⟧NB()informatiky Masarykovy univerzity v Brně, zabýval se teoretickou informatikou a⟦⟧NB()programováním hardware.
Pracuje ve společnosti Red⟦⟧NB()Hat v⟦⟧NB()ABBREV(⟦GSS⟧, ⟦Global Support Services⟧).
⟧,
⟦dnl _next_language_
PERSON(⟦AUTHOR_NAME⟧) graduated from the Faculty of Informatics, Masaryk University, where he studied theoretical computer science and hardware programming.
Works at Red⟦⟧NB()Hat in⟦⟧NB()ABBREV(⟦GSS⟧, ⟦Global Support Services⟧).
⟧))

# uncomment what you like more:
# PROMPT() ---> ~]$
# PROMPT(path) ---> path]$
#
# A → β
#define(⟦PROMPT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$1⟧, ⟦⟧, ⟦~]$⟧, ⟦⟦$1⟧]$⟧)⟧)

# or briefly PROMPT() ---> $
define(⟦PROMPT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$⟧)⟧)

# uncomment what you like more:
# PROMPT_ROOT() ---> ~]#
# PROMPT_ROOT(path) ---> path]#
#
# A → β
#define(⟦PROMPT_ROOT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦$1⟧, ⟦⟧, ⟦~]⟦#⟧⟧, ⟦⟦$1]⟧⟦#⟧⟧)⟧)

# or briefly PROMPT_ROOT() --->  #
define(⟦PROMPT_ROOT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦⟦#⟧⟧)⟧)

# add all parts of the series
# A → ε
#define(⟦ADD_LINKS_TO_ALL_PARTS_OF_THE_SERIES⟧)

# a folder containing generated files such as root files, vim shortcut files and M4 plugins
# A → β
define(⟦FOLDER_FOR_GENERATED_FILES⟧, ⟦gfiles/⟧)

# default color for highlighting parts of the source code
# A → β
#define(⟦DEFAULT_HIGHLIGHT_COLOR⟧, ⟦greenyellow⟧)
define(⟦DEFAULT_HIGHLIGHT_COLOR⟧, ⟦lawngreen⟧)

################################################################################
# Here is a configuration for namespace.
#
# Technical Notes:
#
# max. length (32) of anchors is hard-coded in the file "refs.sed"
#
# namespace prefix
# A → β
define(⟦NSP⟧,		⟦m4-⟧)
#define(⟦NSP⟧,		⟦foo-⟧)
#define(⟦NSP⟧,		⟦usr-⟧)
#define(⟦NSP⟧,		⟦pepa-⟧)

# do not change it unless you know what you are doing
# A → β
define(⟦#NSP⟧, 		⟦#⟧defn(⟦NSP⟧))
define(⟦REF_ANCH⟧,	⟦ref⟧)
define(⟦TOC_ALL_PARTS⟧,	⟦all-parts⟧)
define(⟦TOC_ANCH⟧,	⟦-toc⟧)
define(⟦TOC_REFS⟧,	⟦links⟧)

# or deactivate it completely
# /!\ risky, anchors and CSS class names _WILL_INTERFERE_ with the parent page /!\
# A → ε
#define(⟦NSP⟧)
