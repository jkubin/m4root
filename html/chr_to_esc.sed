# __HEADER(⟦Josef Kubin⟧, ⟦2019,09,01⟧)
# ___DESCR(⟦the script modifies input source code for use in M4 source code and for resulting HTML page⟧)
# __REASON(⟦problematic characters in source code must be processed first⟧)

# hide M4 and HTML problematic characters to https://en.wikipedia.org/wiki/Escape_sequences_in_C
s/&/\\x26;/g
s/</\\x3c;/g
#s/>/\\x3e;/g	no need hide for HTML5
s/⟦/\\u27e6;/g
s/⟧/\\u27e7;/g

# replace non-printable characters with UTF-8 printable characters
y/\x00\x01\x02\x03\x04\x05\x06\x0c\x0d/␀␁␂␃␄␅␆␌␍/
