# __HEADER(⟦Josef Kubin⟧, ⟦2020/01/09⟧)
# ___DESCR(⟦transforms esc sequences to HTML entities or to ASCII⟧)
# __REASON(⟦post processing after M4 scripts⟧)

s/\\x26;/\&amp;/g
s/\\x3c;/\&lt;/g
s/\\x3e;/\&gt;/g
s/\\u27e6;/⟦/g
s/\\u27e7;/⟧/g
