/*
 * DO NOT EDIT! This file is generated automatically!
 */

#include <stdio.h>	/* CPP SYMBOL */

#define SYMBOL		/* CPP SYMBOL */
#define SAF(x)		((x) * ((x) - 1))	/* CPP SYMBOL */
#define ORD(x)		CPP SYMBOL x

int a = SAF (1 + 1);	/* CPP */
int b = (2 + 2) * (2 + 2)	/* SAF_M4 Hello, world! */;	/* M4 */
char chr = 'x';
char foo[] = "Let's say: 'Hello, world!'";
char bar[] = "ORD_M4 'Hello, world!' (args, are, ignored)";

static void define (char *s) { puts(s);}
static void ifelse (char *s) { puts(s);}

int main(void)
{

#ifdef SYMBOL			/* SYMBOL */
	puts("`Hello, world!'");	/* note: LL()SYMBOL */
#endif

	define (foo);		/* Hello, world! */
	ifelse (bar);		/* Hello, world! */

	return 0;
}
