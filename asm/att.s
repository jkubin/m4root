# vim:ft=asm
# DO NOT EDIT! This file is generated automatically!

sys_exit=1
sys_write=4

.section .data
hello:
	.string "Hello, world!\n"

.section .text
	.global main
main:
	mov	$sys_write, %eax
	mov	$1, %ebx
	mov	$hello, %ecx
	mov	$14, %edx
	int	$0x80
	mov	$sys_exit, %eax
	mov	$0, %ebx
	int	$0x80
