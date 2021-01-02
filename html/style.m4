__HEADER(⟦Josef Kubin⟧, ⟦2019/12/24⟧)
___DESCR(⟦combine selectors and creates a style sheet (in the reserved namespace)⟧)
__REASON(⟦the style sheet contains only the things that are actually used⟧)

# three nested loops combine selectors for a ruleset
# A → β
define(⟦CSS_SELECTORS_COMBINE⟧, ⟦CSS_SELECTORS_MIDDLE_LOOP($@)⟦⟧ifelse(NAR($1), ⟦1⟧, ⟦⟧, ⟦$0(PAYR(shift($1)), ⟦$2⟧, ⟦$3⟧)⟧)⟧)
define(⟦CSS_SELECTORS_MIDDLE_LOOP⟧, ⟦CSS_SELECTORS_INNER_LOOP($@)⟦⟧ifelse(NAR($2), ⟦1⟧, ⟦⟧, ⟦$0(⟦$1⟧, PAYR(shift($2)), ⟦$3⟧)⟧)⟧)
define(⟦CSS_SELECTORS_INNER_LOOP⟧, ⟦CSS_EPSILON_FIRST⟦⟧SARG1($1)⟦⟧CSS_SELECTORS_MIDDLE($2)⟦⟧SARG1($3)⟦⟧ifelse(NAR($3), ⟦1⟧, ⟦⟧, ⟦$0(⟦$1⟧, ⟦$2⟧, PAYR(shift($3)))⟧)⟧)
define(⟦CSS_SELECTORS_MIDDLE⟧, ⟦ifelse(⟦$1⟧, ⟦⟧, ⟦⟧, ⟦pushdef(defn(⟦CSS_TYPE⟧)⟦$1⟧, defn(⟦CSS_RULE_SET_KEY⟧))defn(⟦CSS_TYPE⟧, ⟦NSP⟧)⟦$1⟧⟧)⟧)

#      CSS_EPSILON_FIRST
#      ___      ___
# --->/ ε \--->/ , \---.
#     \___/    \___/<--'
#
# process CSS class definitions
# A → β
define(⟦CSS_CLASS_RULE_SET⟧, ⟦

	ifdef(⟦class{$1.$2.$3}key⟧, ⟦

		ROOT_ERROR(⟦the rule set ‘$0($@)’ is redefined⟧)
	⟧)

	# reset automaton
	define(⟦CSS_EPSILON_FIRST⟧, ⟦define(⟦CSS_EPSILON_FIRST⟧, ⟦⟦,⟧⟧)⟧)

	# set auxiliary macro
	define(⟦CSS_RULE_SET_KEY⟧, ⟦class{$1.$2.$3}key⟧)

	# once the CSS rule set is written to stylesheet, it undefine itself (therefore it cannot be duplicated)
	# A → β
	define(defn(⟦CSS_RULE_SET_KEY⟧), ⟦undefine(⟧LL()defn(⟦CSS_RULE_SET_KEY⟧)RR()⟦)divert(INTERNAL_STYLE_DATA)⟧pushdef(⟦CSS_TYPE⟧, ⟦.⟧)CSS_SELECTORS_COMBINE(⟦$1⟧, ⟦$2⟧, ⟦$3⟧)popdef(⟦CSS_TYPE⟧)⟦{patsubst(patsubst(patsubst(⟦⟦⟦$4⟧⟧⟧, ⟦#⟧, ⟦⟦#⟧⟧), ⟦
⟧), ⟦;*⟧)}divert(-1)
	⟧)

	# If the second argument is empty, it inserts the rule set directly into the CSS
	ifelse(⟦$2⟧, ⟦⟧, ⟦

		ADD_STYLE_TAG()

		# add the rule set to stylesheet
		indir(defn(⟦CSS_RULE_SET_KEY⟧))
	⟧)
⟧)

#      CSS_EPSILON_FIRST
#      ___      ___
# --->/ ε \--->/ , \---.
#     \___/    \___/<--'
#
# process CSS id definitions
# A → β
define(⟦CSS_ID_RULE_SET⟧, ⟦

	ifelse(⟦$2⟧, ⟦⟧, ⟦

		ROOT_ERROR(⟦the second argument cannot be empty ‘$0(⟦$1⟧, ⟦$2⟧, …)’⟧)
	⟧)

	ifdef(⟦id{$1#$2#$3}key⟧, ⟦

		ROOT_ERROR(⟦the rule set ‘$0($@)’ is redefined⟧)
	⟧)

	# reset automaton
	define(⟦CSS_EPSILON_FIRST⟧, ⟦define(⟦CSS_EPSILON_FIRST⟧, ⟦⟦,⟧⟧)⟧)

	# set auxiliary macro
	define(⟦CSS_RULE_SET_KEY⟧, ⟦id{$1#$2#$3}key⟧)

	# once the CSS rule set is written to stylesheet, it undefine itself (therefore it cannot be duplicated)
	# A → β
	define(defn(⟦CSS_RULE_SET_KEY⟧), ⟦undefine(⟧LL()defn(⟦CSS_RULE_SET_KEY⟧)RR()⟦)divert(INTERNAL_STYLE_DATA)⟧pushdef(⟦NSP⟧)pushdef(⟦CSS_TYPE⟧, ⟦⟦#⟧⟧)CSS_SELECTORS_COMBINE(⟦$1⟧, ⟦$2⟧, ⟦$3⟧)popdef(⟦CSS_TYPE⟧, ⟦NSP⟧)⟦{patsubst(patsubst(patsubst(⟦⟦⟦$4⟧⟧⟧, ⟦#⟧, ⟦⟦#⟧⟧), ⟦
⟧), ⟦;*⟧)}divert(-1)
	⟧)
⟧)

# A → β
define(⟦ADD_CSS_RULE_SET⟧, ⟦

	popdef(⟦$1⟧)

	# loop end condition
	ifdef(⟦$1⟧, ⟦

		# left recursion
		$0(⟦$1⟧, defn(⟦$1⟧))
	⟧, ⟦

		# A → ε
		define(⟦$1⟧)
	⟧)

	ifdef(⟦$2⟧, ⟦

		indir(⟦$2⟧)
	⟧)
⟧)

#      _______________      __________
# --->/ ADD_STYLE_TAG \--->/ undefine \
#     \_______________/    \__________/
#
# A → β
define(⟦ADD_STYLE_TAG⟧, ⟦

	undefine(⟦$0⟧)

	divert(INTERNAL_STYLE_DATA)dnl
<style>dnl
divert(INTERNAL_STYLE_END)dnl
</style>
divert(-1)
⟧)

# A → β
define(⟦ADD_CLASS_ITEM⟧, ⟦

	ifdef(⟦.$1⟧, ⟦

		ifelse(defn(⟦.$1⟧), ⟦⟧, ⟦⟧, ⟦

			ADD_STYLE_TAG()

			ADD_CSS_RULE_SET(⟦.$1⟧, defn(⟦.$1⟧))
		⟧)
	⟧, ⟦

		ROOT_ERROR(⟦unknown class ‘.$1’⟧)
	⟧)

	ifelse(⟦$#⟧, ⟦1⟧, ⟦⟧, ⟦

		# right recursion
		$0(shift($@))
	⟧)
⟧)

# if the class name(s) was used once, write only the class name(s)
# A → β
define(⟦ADD_CLASS⟧, ⟦ifdef(⟦$0 $1⟧, ⟦⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	# process class value(s)
	ADD_CLASS_ITEM(patsubst(⟦$1⟧, ⟦ +⟧, ⟦,⟧))

	# define class name(s)
	define(⟦$0 $1⟧, defn(⟦NSP⟧)patsubst(⟦$1⟧, ⟦ +⟧, ⟦ defn(⟦NSP⟧)⟧))

	divert(CURRQU)popdef(⟦CURRQU⟧)dnl
⟧)defn(⟦$0 $1⟧)⟧)

# A → β
define(⟦ADD_ID_ANCH⟧, ⟦ADD_ID_RULE(defn(defn(⟦FILE_PREFIX⟧).anch.⟦$1⟧))⟧)
define(⟦ADD_ID_MONO⟧, ⟦ADD_ID_RULE(defn(__file__.mono.⟦$1⟧))⟧)

define(⟦ADD_ID_RULE⟧, ⟦ifdef(⟦$0 $1⟧, ⟦⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	ifelse(⟦$1⟧, ⟦⟧, ⟦

		ROOT_WARNING(⟦id string is empty⟧)
	⟧)

	ifelse(defn(⟦⟦#⟧$1⟧), ⟦⟧, ⟦⟧, ⟦

		ADD_STYLE_TAG()

		ADD_CSS_RULE_SET(⟦⟦#⟧$1⟧, defn(⟦⟦#⟧$1⟧))
	⟧)

	define(⟦$0 $1⟧, ⟦$1⟧)

	divert(CURRQU)popdef(⟦CURRQU⟧)dnl
⟧)defn(⟦$0 $1⟧)⟧)
