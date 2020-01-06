# A → β
define([SENTENCE],     [NOUN_PHRASE[]VERB_PHRASE])
define([NOUN_PHRASE],  [DETERM[]NOUN])
define([NOUN_PHRASE2], [DETERM[]NOUN2])
define([VERB_PHRASE],  [VERB[]NOUN_PHRASE2])
define([NOUN],         [hello ])
define([NOUN2],        [world])

# A → ε
define([VERB])
define([DETERM])

# turn on debug mode in order to see how the tree is produced
debugmode([taeq])

divert(0)dnl
SENTENCE
