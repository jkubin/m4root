# A → β
# β
define(⟦ERROR⟧, ⟦

	# transition to the next node
	define(⟦$0⟧, defn(⟦NEXT_ITEM⟧))

	divert($0_QU)dnl
	<$0_NAME>
		<item>
			<name>⟦$1⟧</name>
			<value>$2</value>
		</item>
divert($0_END)dnl
	</$0_NAME>
divert(-1)
⟧)

# β
define(⟦NEXT_ITEM⟧, ⟦

	divert($0_QU)dnl
		<item>
			<name>⟦$1⟧</name>
			<value>$2</value>
		</item>
divert(-1)
⟧)

# A → β
define(⟦QUERY⟧,        defn(⟦ERROR⟧))
define(⟦WARNING⟧,      defn(⟦ERROR⟧))

divert(0)dnl
<!-- DONTE() -->
<?xml version="1.0" encoding="utf-8"?>
<messages>
divert(LAST_QUEUE)dnl
</messages>
divert(-1)
