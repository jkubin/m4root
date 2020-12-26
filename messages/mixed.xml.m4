# A → β
# β
define(⟦ERROR⟧, ⟦

	divert(0)dnl
	<$0_NAME>
		<name>⟦$1⟧</name>
		<value>$2</value>
	</$0_NAME>
divert(-1)
⟧)

# A → β
define(⟦QUERY⟧, defn(⟦ERROR⟧))
define(⟦WARNING⟧, defn(⟦ERROR⟧))

divert(0)dnl
<!-- DONTE() -->
<?xml version="1.0" encoding="utf-8"?>
<messages>
divert(1)dnl
</messages>
divert(-1)
