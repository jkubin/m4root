# A → β
define([OUT_QUEUE], defn([COUNT_UP]))
OUT_QUEUE(1)

# A → β
define([SYSCALL_TBL], OUT_QUEUE)
define([DATA_TBL],    OUT_QUEUE)
define([GLOBALS],     OUT_QUEUE)
define([ASM_CODE],    OUT_QUEUE)

# A → β
define([STRING], [

	# expand special argument
	define([OFFSET_$1], [offset $1])

	# compute length
	define([sizeof_$1], incr(len([$2])))

	divert(DATA_TBL)dnl
$1:
	.string "$2\n"
divert(-1)
])

# A → β
define([SYSCALL], [

	divert(SYSCALL_TBL)dnl
$1=$2
divert(-1)
])

# A → β
define([GLOBAL_LABEL], [

	divert(GLOBALS)dnl
	.global $1
divert(ASM_CODE)dnl
$1:
divert(-1)
])

