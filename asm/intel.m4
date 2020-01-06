define([SYNTAX], [
.intel_syntax noprefix
])

# A → β
define([MOV], [

	define([SOURCE], ifdef([OFFSET_$2], [offset $2], [$2]))

	divert(ASM_CODE)dnl
	mov	$1, SOURCE
divert(-1)
])

# A → β
define([INT], [

	divert(ASM_CODE)dnl
	int	$1
divert(-1)
])
