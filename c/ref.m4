__HEADER(⟦Josef Kubin⟧, ⟦2020,05,16⟧)
___DESCR(⟦automaton for generating text references⟧)
__REASON(⟦two nodes to generate references⟧)

# REF(⟦name⟧, ⟦description⟧, ⟦URL⟧)
#      ___________      __________
# --->/ REF_FIRST \--->/ REF_NEXT \---.
#     \___________/    \__________/<--'
#
# β
define(⟦REF_FIRST⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	# set reference index, create symbol and an unique tuple
	define(⟦REF_COUNTER⟧, ⟦1⟧)
	define(⟦REF_IDENTIFIER⟧, defn(⟦NSP⟧, ⟦REF_ANCH⟧, ⟦REF_COUNTER⟧))
	define(⟦{$1|$2|$3}⟧, REF_COUNTER)

	# transition to the next node
	define(⟦$0⟧, defn(⟦REF_NEXT⟧))

	# create new entry for all references under the article
	divert(REFERENCE_ARRAY)dnl
char *reference[] = {
	"REF_COUNTER. $1⟦⟧ifelse(⟦$2⟧, ⟦⟧, ⟦⟧, ⟦, $2⟧)",
divert(REFERENCE_ARRAY_END)dnl
};
divert(REFERENCE_URL_ARRAY)dnl
char *reference_url[] = {
	"$3",
divert(REFERENCE_URL_ARRAY_END)dnl
};
divert(SIZE_OF_ARRAY)dnl
unsigned int references_len = ARRAY_SIZE(reference);
divert(CURRQU)popdef(⟦CURRQU⟧)dnl
[REF_COUNTER]dnl
⟧)

# β
define(⟦REF_NEXT⟧, ⟦pushdef(⟦CURRQU⟧, divnum)divert(-1)

	# test if the reference already exists
	ifdef(⟦{$1|$2|$3}⟧, ⟦

		divert(CURRQU)popdef(⟦CURRQU⟧)dnl
[REF_COUNTER]dnl
⟧, ⟦
		# increment the reference counter
		define(⟦REF_VALUE⟧, define(⟦REF_COUNTER⟧, incr(REF_COUNTER))REF_COUNTER)
		define(⟦REF_IDENTIFIER⟧, defn(⟦NSP⟧, ⟦REF_ANCH⟧, ⟦REF_VALUE⟧))
		define(⟦{$1|$2|$3}⟧, REF_VALUE)

		divert(REFERENCE_ARRAY)dnl
	"REF_VALUE. $1⟦⟧ifelse(⟦$2⟧, ⟦⟧, ⟦⟧, ⟦, $2⟧)",
divert(REFERENCE_URL_ARRAY)dnl
	"$3",
divert(CURRQU)popdef(⟦CURRQU⟧)dnl
[REF_VALUE]dnl
⟧)dnl
⟧)
