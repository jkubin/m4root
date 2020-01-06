# an external command

# A → β
define([DATE], esyscmd([date '+[[%-d. %-m. %Y], [%FT%R:%S%:z], [%Y%m%d-%R:%S], [%Y%m%d-%R:%S.%N],]']))

define([PODROBNY], FST(DATE))
define([DATUM], SND(DATE))
define([PRESNY], TRD(DATE))

nastrkat do nejakeho datumu carky

divert(0)dnl
[PODROBNY]: PODROBNY
[DATUM]: DATUM
[PRESNY]: PRESNY
