# vim:mps+=\:

# create C array
define(ARRAY, patsubst(defn(SYMBOL), ., '\&', ))

# escape backslash: '\' ---> '\\'
define(ARRAY, patsubst(PAYR(defn(ARRAY)), \\, \\\\))

# escape single quote character: ''' ---> '\''
define(ARRAY, patsubst(PAYR(defn(ARRAY)), ''', '\\''))

# escape backslash: \ ---> \\
define(STRING, patsubst(PAYR(defn(SYMBOL)), \\, \\\\))

# escape quote: " ---> \"
define(STRING, patsubst(PAYR(defn(STRING)), ", \\"))

divert(0)dnl
/*
 * DONTE()
 */

char array_test[] =
{ARRAY};

char array_test2[] =
"STRING";
