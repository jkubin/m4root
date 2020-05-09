# __HEADER([Josef Kubin], [2019/09/01], [m4root])
# ___DESCR([the script modifies input source code for use in M4 source code and for resulting HTML page])
# ___POINT([problematic characters in source code must be processed first])

# hide M4 and HTML problematic characters to https://en.wikipedia.org/wiki/Escape_sequences_in_C
s/&/\\x26;/g
s/</\\x3c;/g
s/>/\\x3e;/g
s/\[/\\x5b;/g
s/]/\\x5d;/g

# replace non-printable characters with UTF-8 printable characters
s/\x00/␀/g
s/\x01/␁/g
s/\x02/␂/g
s/\x03/␃/g
s/\x04/␄/g
s/\x05/␅/g
s/\x06/␆/g
s/\x0c/␌/g
s/\x0d/␍/g
