# creates final asm code

m4wrap([
	divert(0)dnl
# vim:ft=asm
[#] DONTE()
SYNTAX
undivert(SYSCALL_TBL)dnl

.section .data
undivert(DATA_TBL)dnl

.section .text
])
