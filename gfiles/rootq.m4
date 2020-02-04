dnl vim:mps+=`\:'
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
divert(-1)

__HEADER(`Josef Kubin', `2018/10/15', `https://github.com/jkubin/m4root', `0, 0, 0')
___DESCR(`the most general (root) rules for all scripts')
___POINT(`script decomposition; NO repeated information anywhere else')
___USAGE(`m4 root.m4 stem.m4 branch.m4 sub_branch.m4 leaf.m4 data.mc > output.file')

# prerequisites for understanding M4
#
# https://en.wikipedia.org/wiki/Automata_theory
# https://en.wikipedia.org/wiki/Formal_grammar
#
# Formal Grammar (Chomsky type)
# G = (N, Σ, P, S)
# N: fin. set of non-terminal symbols
# Σ: fin. set of terminal symbols
#    N ∩ Σ = ø
# P: fin. set of production rules
#    (N ∪ Σ)* N (N ∪ Σ)* → (N ∪ Σ)*
# S: is the start symbol
#    S ∈ N
#
# https://en.wikipedia.org/wiki/Context-free_grammar
#
# production rules in Context-free grammar (type 2)
# P: A → β
#    A ∈ N
#    β ∈ (N ∪ Σ)*
#
# productions rules in M4
# A → β
# define(`A', `β')

# LOUD alert for unsuspecting users
define(`DONTE', `ifelse(`$#', `0', ``$0'',
`DO NOT EDIT! This file is generated automatically!')')

# expand n-th argument
# A(`$1', `$2', …, `$n'') → $1 | $2 | $3 | $4 → β
define(`FST', `ifelse(`$#', `0', ``$0'', `$1')')
define(`SND', `ifelse(`$#', `0', ``$0'', `$2')')
define(`TRD', `ifelse(`$#', `0', ``$0'', `$3')')
define(`FTH', `ifelse(`$#', `0', ``$0'', `$4')')

# same as previous, but utilises Vim shortcuts Ctrl-a or Ctrl-x to change ARGn
define(`ARG1',	`$1')
define(`ARG2',	`$2')
define(`ARG3',	`$3')
define(`ARG4',	`$4')
define(`ARG5',	`$5')
define(`ARG6',	`$6')
define(`ARG7',	`$7')
define(`ARG8',	`$8')
define(`ARG9',	`$9')

# select an argument
# A(`$1', `$2', …, `$n'') → `$1'
define(`SELECT_ARG1',	``$1'')
define(`SELECT_ARG1_WITHOUT_TRAILING_LF', `patsubst(``$1'', `\s*')')
# expand an argument
define(`EXPAND_ARG1_WITHOUT_TRAILING_LF', `patsubst(`$1', `\s*')')

# puts number of arguments
define(`NAR', `ifelse(`$#', `0', ``$0'', `$#')')

# puts additional pair of characters (against unwanted expansion)
# A(`$1', `$2', …, `$n'') → ``$1', `$2', …, `$n''
define(`PAIR', `ifelse(`$#', `0', ``$0'', ``$@'')')

# puts a specific additional pair of characters (against unwanted expansion)
define(`BRAC', `[$@]')
define(`NPRI', `$@')
define(`QUOT', ``$@'')
define(`UTFP', `〖$@〗')

# puts a left/right unpaired angular bracket, quotation mark, nonprintable or UTF-8 char
define(`LB', `[')
define(`RB', `]')
define(`LQ', `ifelse(`$#', `0', ``$0'', `changequote([,])format([%c], 96)changequote`'')')
define(`RQ', `ifelse(`$#', `0', ``$0'', `changequote([,])format([%c], 39)changequote`'')')
define(`LN', `')
define(`RN', `')
define(`LU', `〖')
define(`RU', `〗')

#' set aliases to unpaired control char for expansion control (universal macros)
# define(`LL', defn(`LQ'))
# define(`RR', defn(`RQ'))

# expand the last argument
# A(`$1', `$2', …, `$n'') → $$# → $n → β
define(`EXPAND_LAST', `define(`#', `$$#')indir(`#', $@)')

# select the last argument
# A(`$1', `$2', …, `$n'') → $$# → `$n'
define(`SELECT_LAST', `define(`#', ``$$#'')indir(`#', $@)')

# expand the last but one (there must be at least two arguments)
# A(`$1', `$2', …, `$n'') → $decr($#) → $(n-1) → β
define(`EXPAND_LASTB1', `define(`#', $decr($#))indir(`#', $@)')

# select the last but one (there must be at least two arguments)
# A(`$1', `$2', …, `$n'') → $decr($#) → `$(n-1)'
define(`SELECT_LASTB1', `define(`#', BRAC($decr($#)))indir(`#', $@)')

# print an informative message to stderr
define(`ROOT_INFO', `errprint(__file__:__line__`: info: $*
')')

# print warning message to stderr, if something is strange
define(`ROOT_WARNING', `errprint(__file__:__line__`: warning: $*
')')

# abort script if something goes wrong, print the reason to stderr
define(`ROOT_ERROR', `errprint(__file__:__line__`: error: $*
')m4exit(1)')

#       counters are automata
#      ______      ___________
# --->/ INIT \--->/ INCREMENT \---.
#     \______/    \_DECREMENT_/<--'
#

# tests automaton if it is initialized
# β₁
define(`TEST_ATM', `

	ifelse(`$#', `0', `

		ROOT_ERROR(`$0(…) must be initialized')
	')
')

# β₁β₂
define(`COUNT_UP', defn(`TEST_ATM')`

	# the INIT node defines a unique symbol as the internal counter value
	define(`$0_val', $1)

	# transition to the INCREMENT node
	define(`$0', `$0_val`'define(`$0_val', incr($0_val))')
')

# β₁β₂
define(`COUNT_DOWN', defn(`TEST_ATM')`

	# the INIT node defines a unique symbol as the internal counter value
	define(`$0_val', $1)

	# transition to the DECREMENT node
	define(`$0', `$0_val`'define(`$0_val', decr($0_val))')
')
