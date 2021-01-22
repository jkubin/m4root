__AUTHOR(⟦Josef Kubin⟧, ⟦2021,01,21⟧)
___DESCR(⟦an example of a Push-Down Automata (PDA)⟧)
__REASON(⟦how to remember the state of an automaton⟧)
        ,------------------.
      __V_      ____      _|__
 --->/ 🐱 \--->/ 🐶 \--->/ 🐷 \
     \____/    \____/    \____/
# β
define(⟦CAT⟧, ⟦🐱define(⟦$0⟧, defn(⟦DOG⟧))⟧)
define(⟦DOG⟧, ⟦🐶define(⟦$0⟧, defn(⟦PIG⟧))⟧)
define(⟦PIG⟧, ⟦🐷define(⟦$0⟧, defn(⟦CAT⟧))⟧)
        ,------------------.
      __V_      ____      _|__
 --->/ 🍎 \--->/ 🍉 \--->/ 🍐 \
     \____/    \____/    \____/
# β
define(⟦APP⟧, ⟦🍎define(⟦$0⟧, defn(⟦MEL⟧))⟧)
define(⟦MEL⟧, ⟦🍉define(⟦$0⟧, defn(⟦PEA⟧))⟧)
define(⟦PEA⟧, ⟦🍐define(⟦$0⟧, defn(⟦APP⟧))⟧)
        ,------------------.
      __V_      ____      _|__
 --->/ 🐜 \--->/ 🐝 \--->/ 🐛 \
     \____/    \____/    \____/
# β
define(⟦ANT⟧, ⟦🐜define(⟦$0⟧, defn(⟦BEE⟧))⟧)
define(⟦BEE⟧, ⟦🐝define(⟦$0⟧, defn(⟦BUG⟧))⟧)
define(⟦BUG⟧, ⟦🐛define(⟦$0⟧, defn(⟦ANT⟧))⟧)

# A → β
define(⟦PUSH⟧, ⟦pushdef(⟦SYM⟧, defn(⟦$1⟧))⟧)
define(⟦POP⟧,  ⟦popdef(⟦SYM⟧)⟧)

# define a symbol with the starting node CAT
# A → β
define(⟦SYM⟧,  defn(⟦CAT⟧))

divert(0)dnl
SYM SYM PUSH(⟦APP⟧)SYM SYM PUSH(⟦ANT⟧)SYM SYM
SYM SYM POP()SYM SYM POP()SYM SYM POP()SYM
