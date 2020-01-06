# A → β
define([ERROR_SUM], 0)
define([QUERY_SUM], 0)
define([WARNING_SUM], 0)

# A → β
define([ERROR], [

	define([$0_SUM], incr($0_SUM))
])

# A → β
define([QUERY], defn([ERROR]))
define([WARNING], defn([ERROR]))

m4wrap([
	divert(0)dnl
[ERROR  QUERY  WARNING]
format([%-7s%-7s%s], ERROR_SUM, QUERY_SUM, WARNING_SUM)
])
