# C

divert(0)dnl
/*
 * DONTE()
 */

#include <stdio.h>      /* SYMBOL */

#define SYMBOL

char string[[]] = "SYMBOL";

int main(void)
{

#ifdef SYMBOL				/* comment to M4 */
	puts("LB()SYMBOL]");	/* note: symbol inside brackets */
#endif

	printf("%s\n", string);

	return 0;
}
