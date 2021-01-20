# creates the final asm code

divert(0)dnl
# vim:ft=asm
[#] DONTE()
SYNTAX
undivert(SYSCALL_TBL)dnl

.section .data
undivert(DATA_TBL)dnl

.section .text
