__AUTHOR(⟦Josef Kubin⟧, ⟦2020,01,14⟧)
___DESCR(⟦solution for html entities which must be hidden (+ special characters)⟧)
__REASON(⟦html entities and special characters⟧)

# WARNING: keep 1:1 consistency: spell.m4 refs.m4 txt.m4 man.m4 info.m4

# nbsp
# A → β
define(⟦NB⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦&nbsp;⟧)⟧)

# <
# A → β
define(⟦LT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦&lt;⟧)⟧)

# >
# A → β
define(⟦GT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦>⟧)⟧)

# &
# A → β
define(⟦AMP⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦&amp;⟧)⟧)

# "
# A → β
define(⟦DQ⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦&quot;⟧)⟧)

# '
# A → β
define(⟦AP⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦&apos;⟧)⟧)


# these characters are here due to C code generation

# \n
# A → β
define(⟦LF⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦\n⟧)⟧)

# "
# A → β
define(⟦DQT⟧, ⟦ifelse(⟦$#⟧, ⟦0⟧, ⟦⟦$0⟧⟧, ⟦"⟧)⟧)
