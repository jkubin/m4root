# 2019/12/22 Josef Kubin
#
# convert problematic multibyte UTF8 characters (CMS refuses them) to HTML entities

s/🐛/\&#x1f41b;/g
s/🐜/\&#x1f41c;/g
s/🐝/\&#x1f41d;/g
s/👍/\&#x1f44d;/g
s/👎/\&#x1f44e;/g
s/💡/\&#x1f4a1;/g
s/🔗/\&#x1f517;/g
s/🕱/\&#x1f571;/g
s/🛈/\&#x1f6c8;/g
s/🠑/\&#x1f811;/g
s/🡅/\&#x1f845;/g

#s/❕/\&#x2755;/g
