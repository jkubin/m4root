# vim:mps+=\:

#  is a non printable character 0x02 START OF TEXT (STX)
#  is a non printable character 0x06 ACKNOWLEDGE (ACK)

# set the non-printable characters
changequote(,)

define(NPRI, $@)

# create C array
define(ARRAY, patsubst(defn(SYMBOL), ., '\&', ))

# escape backslash: '\' ---> '\\'
define(ARRAY, patsubst(NPRI(defn(ARRAY)), \\, \\\\))

# escape single quote character: ''' ---> '\''
define(ARRAY, patsubst(NPRI(defn(ARRAY)), ''', '\\''))

# send resulting ARRAY into output queue #1
divert(1)dnl
defn(ARRAY)dnl	<--- use defn([because of # charater])
divert(-1)

# set the previous square brackets back
changequote([,])

divert(0)dnl
/*
 * DONTE()
 */

char array_test[[]] =
{undivert(1)};
