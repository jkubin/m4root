# vim:mps+=`\:'
#
# C and quoutes

# SYMBOL _must_ be without any `' characters
# A → β
define(`ARRAY', patsubst(defn(`SYMBOL'), `.', ``RR()\&`'RR(), ''))

# a tool to instantly see string length
# A → β
define(`MY_RULER', defn(`RULER_DEC'))
#define(`MY_RULER', defn(`RULER_HEX'))
MY_RULER(32)

divert(0)dnl
/*
 * DONTE()
 */

#include <stdio.h>

char chr = 'x';

char array[] = {ARRAY};

char string[] =
/* MY_RULER */
  "SYMBOL";

int main(void)
{
	/*    MY_RULER */
	puts("'SYMBOL'");	/* symbol inside quotes */

	printf("%s\n", string);

	return 0;
}
