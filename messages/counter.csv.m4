# A → β
define(⟦COUNTER⟧, defn(⟦COUNT_UP⟧))

# init counter
COUNTER(1)

# A → β
define(⟦ERROR⟧, ⟦

	divert(0)dnl
ERR_⟦⟧COUNTER	⟦$1	$2⟧
divert(-1)
⟧)
