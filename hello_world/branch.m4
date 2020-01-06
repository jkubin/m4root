# A → β
define([HELLO], [HELLO_$1])

# A → β
define([HELLO_0], [Hello, world!])
define([HELLO_1], [Ahoj světe!])
define([HELLO_2], [Ahoj svet!])
define([HELLO_3], [Hallo Welt!])
define([HELLO_4], [Bonjour le monde!])
define([HELLO_5], [Ciao mondo!])
define([HELLO_6], [Witaj świecie!])
define([HELLO_7], [Γειά σου Κόσμε!])
define([HELLO_8], [Привет, мир!])
define([HELLO_9], [Привіт Світ!])

divert(0)dnl
HELLO(BRANCH)
[HELLO(BRANCH)] → [HELLO](BRANCH) → HELLO_$1 → HELLO_[]BRANCH → HELLO(BRANCH)
