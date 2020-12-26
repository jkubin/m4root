# A → β
define(⟦ERROR⟧, ⟦

	divert(0)dnl
⟦$1⟧="$2"
divert(-1)
⟧)

divert(0)dnl
; DONTE()

SARG1(esyscmd(⟦date '+⟦[hello_%Y%m%d]⟧,'⟧))
divert(-1)
