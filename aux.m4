__HEADER([Josef Kubin], [2019/12/07], [root_cz])
___DESCR([auxiliary macros])
___POINT([less typing])

# user command line: CMD() or CMD(path)
# A → β
define([CMD], [ifelse([$#], [0], [[$0]], [$1], [], [~RB()$], [[$1]RB()$])])

# root command line: ROO() or ROO(path)
# A → β
define([ROO], [ifelse([$#], [0], [[$0]], [$1], [], [~RB()[#]], [[$1]RB()[#]])])

# nbsp
# A → β
define([NB], [ifelse([$#], [0], [[$0]], [&nbsp;])])
define([NB2], [&nbsp;&nbsp;])

# quot
# A → β
define([DQ], [ifelse([$#], [0], [[$0]], ["])])

# apos
# A → β
define([AP], [ifelse([$#], [0], [[$0]], ['])])

# html problematic character '<'
# A → β
define([LT], [ifelse([$#], [0], [[$0]], [&lt;])])

# html problematic character '>'
# A → β
define([GT], [ifelse([$#], [0], [[$0]], [&gt;])])
