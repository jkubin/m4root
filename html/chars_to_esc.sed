# __HEADER([Josef Kubin], [2019/09/01], [m4root])
# ___DESCR([the script modifies input source code for use in M4 source code and for resulting HTML page])
# ___POINT([every source code must be processed first])

# Keep it first!
s/&/\&amp;/g

# hide M4 and html problematic characters
s/\[/\&#x5b;/g
s/]/\&#x5d;/g
s/</\&lt;/g
s/>/\&gt;/g

# transform nonprintable characters to printable UTF8 characters
s/\x02/␂/g
s/\x06/␆/g
