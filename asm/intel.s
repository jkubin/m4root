# vim:ft=asm
# DO NOT EDIT! This file is generated automatically!

.intel_syntax noprefix

sys_exit=1
sys_write=4

.section .data
hello:
	.string "Hello, world!\n"

.section .text
	.global main
main:
	mov	eax, sys_write
	mov	ebx, 1
	mov	ecx, offset hello
	mov	edx, 14
	int	0x80
	mov	eax, sys_exit
	mov	ebx, 0
	int	0x80
