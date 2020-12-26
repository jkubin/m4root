# __HEADER(⟦Josef Kubin⟧, ⟦2019/10/12⟧)
# ___DESCR(⟦common ASM source code for Intel and AT&T notation⟧)

# an arbitrarily long string from the command line to print
STRING([hello], defn([SYMBOL]))

# Linux 32-bit system call from file: /usr/include/asm/unistd_32.h
SYSCALL([sys_exit],  [1])
SYSCALL([sys_write], [4])

# this is a global label for the next block of code
GLOBAL_LABEL([main])

	# write syscall for write to the eax register
	MOV([eax], [sys_write])

	# write 1 to the ebx register; 1 means print to stdout
	MOV([ebx], [1])

	# write the pointer to the ecx register
	MOV([ecx], [hello])

	# write number of characters to print to the edx register
	MOV([edx], [sizeof_hello])

	# kernel interrupt
	INT([0x80])

	# write syscall for exit to the eax register
	MOV([eax], [sys_exit])

	# set exit code 0 to the ebx register
	MOV([ebx], [0])

	# kernel interrupt
	INT([0x80])
