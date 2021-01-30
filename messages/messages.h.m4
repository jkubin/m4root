# A → β
define(⟦COUNTER⟧, defn(⟦COUNT_UP⟧))

# init counter
COUNTER(0)

# A → β
define(⟦ERROR⟧, ⟦

	divert(0)dnl
⟦#define $1	0x⟧eval(COUNTER, 16, 2)
divert(-1)
⟧)

divert(0)dnl
/*
 * DONTE()
 */

#ifndef __ERROR_H
#define __ERROR_H

divert(1)
#endif /* __ERROR_H */
divert(-1)
