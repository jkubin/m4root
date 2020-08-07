# an external command

# A → β
define([DATE], esyscmd([date '+[[%-d. %-m. %Y], [%FT%R:%S%:z], [%Y%m%d-%R:%S], [%Y%m%d-%R:%S.%N],]']))

define([PODROBNY], SARG1(DATE))
define([DATUM], SARG2(DATE))
define([PRESNY], SARG3(DATE))

nastrkat do nejakeho datumu carky

divert(0)dnl
[PODROBNY]: PODROBNY
[DATUM]: DATUM
[PRESNY]: PRESNY
