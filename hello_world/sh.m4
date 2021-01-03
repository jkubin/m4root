# A → β
define([LEFT], [$[#]])
define([OP], [-eq])
define([RIGHT], [0])

# define two counters
# A → β
define([__COUNTUP__], defn([COUNT_UP]))
define([__COUNTDN__], defn([COUNT_DOWN]))

# init counters
__COUNTUP__(10)
__COUNTDN__(10)

divert(0)dnl
#!/bin/bash
#
[#] DONTE()

if [ LEFT OP RIGHT ]
then
	echo '__COUNTUP__] SYMBOL LL()__COUNTDN__'
fi

if test LEFT OP RIGHT
then
	echo '__COUNTUP__] SYMBOL LL()__COUNTDN__'
fi

if LL()LL() LEFT OP RIGHT ]]
then
	echo '__COUNTUP__] SYMBOL LL()__COUNTDN__'
fi
