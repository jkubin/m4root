# __AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,22⟧)
# ___DESCR(⟦converts problematic multi-byte UTF-8 characters (CMS refuses them) to HTML entities⟧)
# __REASON(⟦the final processing of the generated HTML⟧)

s/🍉/\&#x1f349;/g
s/🍎/\&#x1f34e;/g
s/🍐/\&#x1f350;/g
s/🐛/\&#x1f41b;/g
s/🐜/\&#x1f41c;/g
s/🐝/\&#x1f41d;/g
s/🐱/\&#x1f431;/g
s/🐶/\&#x1f436;/g
s/🐷/\&#x1f437;/g
s/👍/\&#x1f44d;/g
s/👎/\&#x1f44e;/g
s/💡/\&#x1f4a1;/g

