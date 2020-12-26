# __HEADER(⟦Josef Kubin⟧, ⟦2020/05/19⟧, ⟦m4root⟧)
# ___DESCR(⟦the script modifies input source code for M4 processing⟧)
# __REASON(⟦problematic characters must be hidden⟧)

# hide M4 problematic characters to https://en.wikipedia.org/wiki/Escape_sequences_in_C
gsub(/\[/, "\\x5b;")
gsub(/]/, "\\x5d;")

# replace non-printable characters with UTF-8 printable characters
gsub(/\x00/, "␀")
gsub(/\x01/, "␁")
gsub(/\x02/, "␂")
gsub(/\x03/, "␃")
gsub(/\x04/, "␄")
gsub(/\x05/, "␅")
gsub(/\x06/, "␆")
gsub(/\x0c/, "␌")
gsub(/\x0d/, "␍")
