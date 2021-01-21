__AUTHOR(⟦Josef Kubin⟧, ⟦2019,12,16⟧)
___DESCR(⟦⟧)
__REASON(⟦⟧)

# β
define(⟦COW⟧, ⟦🐄define(⟦$0⟧, defn(⟦DOG⟧))⟧)
define(⟦DOG⟧, ⟦🐕define(⟦$0⟧, defn(⟦PIG⟧))⟧)
define(⟦PIG⟧, ⟦🐖define(⟦$0⟧, defn(⟦RAT⟧))⟧)
define(⟦RAT⟧, ⟦🐀define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦TUX⟧, ⟦🐧define(⟦$0⟧, defn(⟦ANT⟧))⟧)
define(⟦ANT⟧, ⟦🐜define(⟦$0⟧, defn(⟦COW⟧))⟧)

# β
define(⟦APPLE⟧, ⟦🍏define(⟦$0⟧, defn(⟦RAT⟧))⟧)
define(⟦MELON⟧, ⟦🍉define(⟦$0⟧, defn(⟦ANT⟧))⟧)
define(⟦LEMON⟧, ⟦🍋define(⟦$0⟧, defn(⟦COW⟧))⟧)
define(⟦PEAR⟧,  ⟦🍐define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦BANAN⟧, ⟦🍌define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦PEACH⟧, ⟦🍑define(⟦$0⟧, defn(⟦TUX⟧))⟧)

# β
define(⟦TREE⟧, ⟦🌲define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦PALM⟧, ⟦🌴define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦ROSE⟧, ⟦🌹define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦HERB⟧, ⟦🌿define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦LEAF⟧, ⟦🍁define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦BLOOM⟧,⟦🌼define(⟦$0⟧, defn(⟦TUX⟧))⟧)

define(⟦MOON⟧, ⟦🌛define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦STAR⟧, ⟦🌟define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦SUN⟧,  ⟦🌞define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦RAINB⟧,⟦🌈define(⟦$0⟧, defn(⟦TUX⟧))⟧)
define(⟦CLOUD⟧,⟦⛅define(⟦$0⟧, defn(⟦TUX⟧))⟧)

MOON

define(⟦FOUR⟧, ⟦🍀define(⟦$0⟧, defn(⟦TUX⟧))⟧)

ifelse(⟦
🔥 FIRE
🌊 WATER
 RAIN
define(⟦RAIN⟧, ⟦⛆define(⟦$0⟧, defn(⟦TUX⟧))⟧)
 RAINBOW
🌁 FOGGY
🌫FOG

🐛 BUG
🐝 BEE
🐜 ANT
🐏 RAM
💣 BOMB

MOON🌝
SUN
STAR
CLOUD


🌿 HERB (U+1F33F)
🍀 FOUR LEAF CLOVER (U+1F340)
🌰 CHESTNUT (U+1F330)
🌱 SEEDLING (U+1F331)
🌲 EVERGREEN TREE (U+1F332)
🌳 DECIDUOUS TREE (U+1F333)
🌴 PALM TREE (U+1F334)
🌵 CACTUS (U+1F335)
🌶  HOT PEPPER (U+1F336)
🌷 TULIP (U+1F337)
🌸 CHERRY BLOSSOM (U+1F338)
🌹 ROSE (U+1F339)
🌺 HIBISCUS (U+1F33A)
🌻 SUNFLOWER (U+1F33B)
🌼 BLOSSOM (U+1F33C)
🌽 EAR OF MAIZE (U+1F33D)
🌾 EAR OF RICE (U+1F33E)
🌿 HERB (U+1F33F)
🍀 FOUR LEAF CLOVER (U+1F340)
🍁 MAPLE LEAF (U+1F341)
⟧)dnl comment

# A → β
define(⟦SYMBOL⟧, defn(⟦PIG⟧))

# A → β
define(⟦ERROR⟧, ⟦

	divert(0)dnl
SYMBOL
divert(-1)
⟧)

# A → β
define(⟦QUERY⟧, ⟦
⟧)
