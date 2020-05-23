# __HEADER([Josef Kubin], [2020/05/19], [m4root])
# ___DESCR([the script modifies input source code for M4 processing])
# ___POINT([problematic characters must be hidden])

# hide M4 problematic characters to https://en.wikipedia.org/wiki/Escape_sequences_in_C
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
