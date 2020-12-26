# A → β
# β
define(⟦ERROR⟧, ⟦

	divert(0)dnl
echo "$2"
divert(-1)
⟧)

# A → β
define(⟦QUERY⟧, defn(⟦ERROR⟧))
define(⟦WARNING⟧, defn(⟦ERROR⟧))

divert(0)dnl
#!/bin/bash
#
⟦#⟧ DONTE()

divert(-1)
