dnl vim:mps+=⟦\:⟧
dnl
dnl DO NOT EDIT! This file is generated automatically!
dnl
divert(-1)changequote(⟦,⟧)

__AUTHOR(⟦Josef Kubin⟧, ⟦2021,01,30⟧, ⟦https://github.com/jkubin/m4root⟧)
___DESCR(⟦the most general (root) rules for all scripts⟧)
__REASON(⟦script decomposition; NO repeated information anywhere else⟧)
___USAGE(⟦m4 root.m4 stem.m4 branch.m4 sub_branch.m4 leaf.m4 data.mc > output.file⟧)

# prerequisites for understanding M4
#
# https://en.wikipedia.org/wiki/Automata_theory
# https://en.wikipedia.org/wiki/Formal_grammar
#
# Formal Grammar (Chomsky type)
# G = (N, Σ, P, S)
# N: nonempty finite set of non-terminal symbols
# Σ: finite set of terminal symbols
#    N ∩ Σ = ø
# P: finite set of production rules
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
# production rules in M4
# A → β
# define(⟦A⟧, ⟦β⟧)
#
# A → ε
# define(⟦A⟧, ⟦⟧)
# define(⟦A⟧)

# adds LOUD alert for unsuspecting users
define(⟦DONTE⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧,
⟦DO NOT EDIT! This file is generated automatically!⟧)⟧)

# adds an unpaired quote symbol Left/Right:
# LL() → ⟦
# RR() → ⟧
#
define(⟦LL⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦changequote⟦dnl⟧
changequote(⟦,⟧)⟧)⟧)
define(⟦RR⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦changequote`'dnl⟦
⟧changequote(⟦,⟧)⟧)⟧)

# expands n-th argument (use Vim shortcuts Ctrl-a or Ctrl-x to change ARGn)
define(⟦ARG1⟧,	⟦$1⟧)
define(⟦ARG2⟧,	⟦$2⟧)
define(⟦ARG3⟧,	⟦$3⟧)
define(⟦ARG4⟧,	⟦$4⟧)
define(⟦ARG5⟧,	⟦$5⟧)
define(⟦ARG6⟧,	⟦$6⟧)
define(⟦ARG7⟧,	⟦$7⟧)
define(⟦ARG8⟧,	⟦$8⟧)
define(⟦ARG9⟧,	⟦$9⟧)

# selects n-th argument
define(⟦SARG1⟧,	⟦⟦$1⟧⟧)
define(⟦SARG2⟧,	⟦⟦$2⟧⟧)
define(⟦SARG3⟧,	⟦⟦$3⟧⟧)
define(⟦SARG4⟧,	⟦⟦$4⟧⟧)
define(⟦SARG5⟧,	⟦⟦$5⟧⟧)
define(⟦SARG6⟧,	⟦⟦$6⟧⟧)
define(⟦SARG7⟧,	⟦⟦$7⟧⟧)
define(⟦SARG8⟧,	⟦⟦$8⟧⟧)
define(⟦SARG9⟧,	⟦⟦$9⟧⟧)

# adds number of arguments (used for loops)
define(⟦NAR⟧, ⟦$#⟧)

# adds another universal pair of symbols that protects unwanted expansion
# (`paYr' is not a word from the dictionary)
define(⟦PAYR⟧, ⟦⟦$@⟧⟧)

# expands the last argument
# A(⟦$1⟧, ⟦$2⟧, …, ⟦$n⟧) → $$# → $n → β
define(⟦EXPAND_LAST_ARG⟧, ⟦define(⟦#⟧, ⟦$$#⟧)indir(⟦#⟧, $@)⟧)

# selects the last argument
# A(⟦$1⟧, ⟦$2⟧, …, ⟦$n⟧) → $$# → ⟦$n⟧
define(⟦SELECT_LAST_ARG⟧, ⟦define(⟦#⟧, ⟦⟦$$#⟧⟧)indir(⟦#⟧, $@)⟧)

# expands the last but one (there must be at least two arguments)
# A(⟦$1⟧, ⟦$2⟧, …, ⟦$n⟧) → $decr($#) → $(n-1) → β
define(⟦EXPAND_LAST_BUT_ONE⟧, ⟦define(⟦#⟧, $decr($#))indir(⟦#⟧, $@)⟧)

# selects the last but one (there must be at least two arguments)
# A(⟦$1⟧, ⟦$2⟧, …, ⟦$n⟧) → $decr($#) → ⟦$(n-1)⟧
define(⟦SELECT_LAST_BUT_ONE⟧, ⟦define(⟦#⟧, LL()$decr($#)⟦⟧RR())indir(⟦#⟧, $@)⟧)

# prints an informative message to stderr
define(⟦ROOT_INFO⟧, ⟦errprint(__file__:__line__⟦: info: $1
⟧)⟧)

# prints a warning message to stderr if something is strange
define(⟦ROOT_WARNING⟧, ⟦errprint(__file__:__line__⟦: warning: $1
⟧)⟧)

# aborts a script if something goes wrong and prints the reason to stderr
define(⟦ROOT_ERROR⟧, ⟦errprint(__file__:__line__⟦: error: $1
⟧)m4exit(1)⟧)
