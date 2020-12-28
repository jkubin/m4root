__HEADER(⟦Josef Kubin⟧, ⟦2019/12/22⟧)
___DESCR(⟦the project is in constant development; to avoid frustrating innocent users a version number is used⟧)
__REASON(⟦stops source.mc processing if the major version number is different⟧)

# MAJOR change means an incompatible change
# MINOR change means a backward compatible change
# PATCH change means a backward compatible bug fixes

# A → β
define(⟦__TPLVER⟧, ⟦

	ifdef(⟦VERSION_MAJOR_$1⟧, ⟦

		# prints nothing or a warning
		VERSION_MAJOR_$1
	⟧, ⟦
		ROOT_ERROR(⟦your ‘⟧__file__⟦’ is too different to process⟧)
	⟧)

	# prints nothing or an informative message
	VERSION_MINOR_$2

	# the patch number is not tested
⟧)

# A → β
define(⟦VERSION_MAJOR_1⟧, ⟦

	# ROOT_INFO(⟦template is under development⟧)
⟧)
