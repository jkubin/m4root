__HEADER([Josef Kubin], [2020/01/14], [html])
___DESCR([solution for html entities which must be hidden])
___POINT([html entities])

# nbsp
# A → β
define([NB], [ifelse([$#], [0], [[$0]], [&nbsp;])])
define([NB2], [&nbsp;&nbsp;])

# <
# A → β
define([LT], [ifelse([$#], [0], [[$0]], [&lt;])])

# >
# A → β
define([GT], [ifelse([$#], [0], [[$0]], [&gt;])])

# &
# A → β
define([AMP], [ifelse([$#], [0], [[$0]], [&amp;])])

# "
# A → β
define([DQ], [ifelse([$#], [0], [[$0]], [&quot;])])

# '
# A → β
define([AP], [ifelse([$#], [0], [[$0]], [&apos;])])
