# defines a counter for output queues
# A → β
define([QUEUE_INDEX], defn([COUNT_UP]))

# initial index of the first output queue
QUEUE_INDEX(0)

# symbolic names for indices of output queues
# A → β
define([QUERY_QU],     QUEUE_INDEX)
define([QUERY_END],    QUEUE_INDEX)
define([ERROR_QU],     QUEUE_INDEX)
define([ERROR_END],    QUEUE_INDEX)
define([WARNING_QU],   QUEUE_INDEX)
define([WARNING_END],  QUEUE_INDEX)
# Keep it last!
define([LAST_QUEUE],   QUEUE_INDEX)

# names of message types
# A → β
define([WARNING_NAME], [warning])
define([ERROR_NAME],   [error])
define([QUERY_NAME],   [query])
