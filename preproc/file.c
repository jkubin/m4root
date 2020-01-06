/*
 * DONTE()
 */

#include <stdio.h>	/* CPP SYMBOL */

#define SYMBOL		/* CPP SYMBOL */
#define SAF(x)		((x) * ((x) - 1))	/* CPP SYMBOL */
#define ORD(x)		CPP SYMBOL x

int a = SAF (1 + 1);	/* CPP */
int b = SAF(2 + 2);	/* M4 */
char chr = 'x';
char foo[] = "Let's say: 'SYMBOL'";
char bar[] = "ORD (args, are, ignored)";

static void define (char *s) { puts(s);}
static void ifelse (char *s) { puts(s);}

int main(void)
{

#ifdef SYMBOL			/* SYMBOL */
	puts("LQ()SYMBOL'");	/* note: `LQ()SYMBOL' */
#endif

	define (foo);		/* SYMBOL */
	ifelse (bar);		/* SYMBOL() */

	return 0;
}
