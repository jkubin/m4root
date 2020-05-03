# __HEADER([Josef Kubin], [2019/09/01], [m4root])
# ___DESCR([the script modifies input source code for use in M4 source code and for resulting HTML page])
# ___POINT([problematic characters in source code must be processed first])

# hide M4 and HTML problematic characters to https://en.wikipedia.org/wiki/Escape_sequences_in_C
s/&/\\x26;/g
s/</\\x3c;/g
s/>/\\x3e;/g
s/\[/\\x5b;/g
s/]/\\x5d;/g

# transform nonprintable characters to printable UTF8 characters
s/\x02/␂/g
s/\x06/␆/g
