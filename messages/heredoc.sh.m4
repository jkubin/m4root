# A → β
# β
define(⟦ERROR⟧, ⟦

	divert(0)dnl
$2
divert(-1)
⟧)

# A → β
define(⟦QUERY⟧, defn(⟦ERROR⟧))
define(⟦WARNING⟧, defn(⟦ERROR⟧))

divert(0)dnl
#!/bin/bash
#
⟦#⟧ DONTE()

cat << EOF
divert(1)dnl
EOF
divert(-1)
