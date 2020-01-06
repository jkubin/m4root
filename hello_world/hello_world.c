/*
 * DO NOT EDIT! This file is generated automatically!
 */

#include <stdio.h>      /* SYMBOL */

#define SYMBOL

char string[] = "Hello, world!";

int main(void)
{

#ifdef SYMBOL				/* comment to M4 */
	puts("[Hello, world!]");	/* note: symbol inside brackets */
#endif

	printf("%s\n", string);

	return 0;
}
