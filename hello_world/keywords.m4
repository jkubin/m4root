# A → B
define([A], [B])

# B → C
define([B], [C])

# C → D
define([C], [D])

divert(0)dnl
# A → ε
ifelse([

This is an example of multiline comment
as a side effect of the ifelse() keyword.

])The keyword [ifelse([…])] with multiline text inside has disappeared to ε!

# D → SYMBOL
A B C D define([D], [SYMBOL])A B C D

# A comment	<--- visible to output
dnl A		<--- not visible to output
A

# how the production rules work
[# ifdef([SYMBOL], [A], [not defined]) → A → B → C → D → SYMBOL → ]defn([SYMBOL])
ifdef([SYMBOL], [A], [not defined])
