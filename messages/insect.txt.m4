# A → β
# β
define([ERROR], [

	divert(0)dnl
$0_INSECT[]dnl
divert(-1)
])

# A → β
define([QUERY],   defn([ERROR]))
define([WARNING], defn([ERROR]))
define([ERROR_INSECT],   [🐛])
define([QUERY_INSECT],   [🐜])
define([WARNING_INSECT], [🐝])
