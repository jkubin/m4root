# C

# A → β
define([ARRAY], patsubst(defn([SYMBOL]), [.], [['\&', ]]))

# A → β
define([MY_RULER_A], defn([RULER_HEX]))
define([MY_RULER_B], defn([RULER_DEC]))
define([MY_RULER_C], defn([RULER_DEC]))

# temporarily redefine the original ruler macro
pushdef([📏hex], [ifelse([$1], [1], [1],
	[indir([$0], decr($1))    eval($1 % 16, 16)])])

MY_RULER_A(13)

popdef([📏hex])

MY_RULER_B(14)
MY_RULER_C(15)

divert(0)dnl
/*
 * DONTE()
 */

#include <stdio.h>

char chr = 'x';

char array[[]] =
/* MY_RULER_A */
 {ARRAY};

char string[[]] =
/* MY_RULER_B */
  "SYMBOL";

int main(void)
{
	/*    MY_RULER_C */
	puts("LB()SYMBOL]");	/* note: symbol inside brackets */

	printf("%s\n", string);

	return 0;
}
