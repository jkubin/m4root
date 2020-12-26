# __HEADER(⟦Josef Kubin⟧, ⟦2019/12/22⟧, ⟦m4root⟧)
# ___DESCR(⟦convert problematic multi-byte UTF-8 characters (CMS refuses them) to HTML entities⟧)
# __REASON(⟦converts multi-byte UTF-8 characters to HTML entities for Content Management System⟧)

s/🐛/\&#x1f41b;/g
s/🐜/\&#x1f41c;/g
s/🐝/\&#x1f41d;/g
s/👍/\&#x1f44d;/g
s/👎/\&#x1f44e;/g
s/💡/\&#x1f4a1;/g
