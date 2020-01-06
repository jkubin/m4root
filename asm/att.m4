# A → β
define([SYNTAX])

# A → β
define([MOV], [

	divert(ASM_CODE)dnl
	mov	$$2, %$1
divert(-1)
])

# A → β
define([INT], [

	divert(ASM_CODE)dnl
	int	$$1
divert(-1)
])
