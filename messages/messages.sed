/^[]/{
s/\[/[[/g
s/]/]]/g
s/\[/[]LB()/g
s/]]/[]RB()/g
s/"/[]QU()/g
s/&/[]AMP()/g
s/</[]LT()/g
s/>/[]GT()/g
s/\\/[]BS()/g
s///g
}
