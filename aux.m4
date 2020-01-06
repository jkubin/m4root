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

# quot
# A → β
define([DQ], [ifelse([$#], [0], [[$0]], [&quot;])])

# apos
# A → β
define([AP], [ifelse([$#], [0], [[$0]], [&apos;])])

# offset level in TOC
# A → β
define([NBX], [&nbsp;&nbsp;])
define([NBY], [&nbsp;&nbsp;&nbsp;])
define([NBZ], [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;])

