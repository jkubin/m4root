# ___TITLE(⟦Josef Kubin⟧, ⟦2020,05,19⟧)
# ___DESCR(⟦the script modifies input source code for M4 processing⟧)
# __REASON(⟦problematic characters must be hidden⟧)

# hide M4 problematic characters to https://en.wikipedia.org/wiki/Escape_sequences_in_C
s/⟦/\\u27e6;/g
s/⟧/\\u27e7;/g

# replace non-printable characters with UTF-8 printable characters
y/\x00\x01\x02\x03\x04\x05\x06\x0c\x0d/␀␁␂␃␄␅␆␌␍/
