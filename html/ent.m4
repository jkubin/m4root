__HEADER([Josef Kubin], [2020/01/14], [html])
___DESCR([solution for html entities which must be hidden])
___POINT([html entities])

# nbsp
# A → β
define([NB], [ifelse([$#], [0], [[$0]], [&nbsp;])])
define([NB2], [&nbsp;&nbsp;])

# '<'
# A → β
define([LT], [ifelse([$#], [0], [[$0]], [&lt;])])

# '>'
# A → β
define([GT], [ifelse([$#], [0], [[$0]], [&gt;])])

# in normal html content does not matter
# but for title="…" is already solved in block.m4

# quot
# A → β
define([DQ], [ifelse([$#], [0], [[$0]], ["])])

# apos
# A → β
define([AP], [ifelse([$#], [0], [[$0]], ['])])
