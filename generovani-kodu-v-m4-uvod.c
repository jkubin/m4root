/*
 * DO NOT EDIT! This file is generated automatically!
 * generated: 20210124-11:14:18
 *
 * __SOURCE(⟦c/c.m4⟧, ⟦20210124-11:13:46⟧, ⟦6d01629⟧, ⟦6d01629⟧)
 * __SOURCE(⟦intro.mc⟧, ⟦20210124-10:18:49⟧, ⟦92feda7⟧, ⟦6d01629⟧)
 *
 * Generování kódu v M4: úvod
 */

#define ARRAY_SIZE(x)	(sizeof(x)/sizeof((x)[0]))

static char ch_para_0[] =
"Čtenáři tohoto seriálu se naučí psát skripty pro strojové generování kódu.\n"
"Strojově generovaný kód může být libovolně složitý a může obsahovat další vnitřní závislosti.\n"
"Vzájemně závislé soubory se složitým kódem jsou pro člověka jen těžce udržitelné v konzistentním stavu.\n"
"Je už nutné použít nějaký mechanismus pro generování kódu.\n"
"Generování kódu provádí nástroj určený pro transformaci textu – makro procesor.";

static char ch_para_1[] =
"Seriál je zaměřen na praktické použití univerzálního makro procesoru M4 (dále jen M4) pomocí malých příkladů.\n"
"Popisuje také teoretický základ všech implementací.\n"
"Cílem seriálu je seznámit čtenáře s tímto nástrojem a také programovacím jazykem.\n"
"Na co se používá, jak se v něm programuje a jaké jsou jeho výhody a nevýhody.";

static char ch_para_2[] =
"Úvodní díl popisuje základní principy jazyka na jednoduchých příkladech.\n"
"Všechny příklady používají přepisovací pravidla bezkontextové gramatiky.\n"
"Později se naučíme používat výstupní fronty,\n"
"automaty, asociativní paměti, zásobníky a zásobníkové automaty.\n"
"Naučíme se také psát testovací automaty pro testování vstupních dat.";

static char ch_para_3[] =
"Příklady pro čtenáře tvoří komplementární část seriálu a budou do jisté míry vytvářeny na základě podnětů v diskuzi pod článkem.\n"
"Na začátku každého dílu je popsána nějaká část jazyka M4 doplněná sadou příkladů na konci.\n"
"Každý díl je možné číst v libovolném pořadí.";

static char ch_para_4[] =
"Makro jazyky byly vynalezeny v době, kdy dominoval jazyk symbolických adres – JSA.\n"
"Zdrojový kód JSA velmi často obsahuje shodné sekvence instrukcí odlišující se pouze hodnotami operandů.\n"
"Shodné sekvence instrukcí je možné seskupit do jednoho slova, nebo-li makro instrukce.\n"
"Jméno obvykle popisuje účel skryté sekvence instrukcí.\n"
"Makro instrukce se přeloží makro procesorem na původní sekvenci instrukcí, která se posléze přeloží do spustitelného strojového kódu.\n"
"Programování v JSA pomocí makro instrukcí je jednodušší, rychlejší a méně náchylné k lidským chybám.";

static char ch_para_5[] =
"Později byly makro jazyky použity k rozšíření kompilovaných programovacích jazyků, protože umožnily psát zdrojový kód na vyšší úrovni abstrakce než jakou poskytuje samotný programovací jazyk.\n"
"Rychlost, výkonnost a efektivita složitého programovacího jazyka nižší úrovně je zachována díky makro jazykům.\n"
"Avšak je důležité dobře rozumět všem vrstvám kódu.";

static char ch_para_6[] =
"Základní myšlenku přepisování textových řetězců s argumenty, které se přepíší do dalších rekurzivně přepisovatelných řetězců, představil\n"
"Christopher Strachey ve svém\n"
"GPM[1] v roce 1965.\n"
"Další generace makro procesorů M3 a M4 původní GPM v podstatě už jen rozšiřovaly.\n"
"Základní myšlenka původního návrhu ale zůstala stejná.";

static char ch_para_7[] =
"Dennis Ritchie převzal základní myšlenku GPM a napsal vylepšený makro procesor pro generování zdrojového kódu programovacího jazyka C (1972), který sám navrhl.\n"
"Nový makro procesor napsal pro minipočítač AP-3, odtud jméno M3.\n"
"Tento přímý předchůdce současného M4 dokázal výrazně ušetřit těžkou a časově náročnou práci, čímž zaujal vývojáře programující v jiných jazycích (FORTRAN, COBOL, PL/I, …).\n"
"Vývojáři upravovali M3 pro tyto jazyky čímž ho proměnili na univerzálně použitelný makro procesor M4.";

static char ch_para_8[] =
"Makro procesor M3 rozšířil také Jim E. Weythman, autor programové konstrukce, která se používá téměř v každém M4 skriptu:";

static char ch_para_9[] =
"Brian Kernighan makro procesor M3 rozšířil na preprocesor jazyka FORTRAN 66,\n"
"aby mohl vytvořit hybridní jazykovou nadstavbu pojmenovanou RATFOR[2].\n"
"Základní programové konstrukce této nadstavby (podmínky, cykly) jsou stejné jako v jazyce C.\n"
"Programování v RATFOR-u se tak podobá programování v „céčku“.\n"
"Makro procesor zdrojový kód překládá zpátky do FORTRAN-u, poté kompilátor provede překlad do strojového kódu.";

static char ch_para_10[] =
"Uživatelský manuál[3] zmiňuje ještě další, zde neuvedené spoluautory.\n"
"Bylo by tedy značně nespravedlivé napsat, že autory makro procesoru M4 (1977) jsou pouze dva lidé.";

static char ch_para_11[] =
"Dnes existuje několik implementací lišící se od původní implementace spíše drobnostmi.\n"
"Nejrozšířenější implementace M4 je GNU M4 používaná pro Autotools\n"
"a pro překlad jednoduchého konfiguračního souboru sendmail.mc na složitý sendmail.cf.\n"
"Autorem této implementace z roku 1990 je René Seindal.\n"
"Následující příkaz nainstaluje m4:";

static char ch_para_12[] =
"Podrobný popis klíčových slov se nachází v dokumentaci[4]:";

static char ch_para_13[] =
"Základem jazyka M4 je bezkontextová gramatika, automaty, zásobníky a výstupní fronty.\n"
"Pro pochopení jazyka M4 je proto velmi důležité rozumět základním pojmům teorie formálních jazyků –\n"
"co jsou terminální symboly (stručně terminály) a neterminální symboly (stručně neterminály).\n"
"Zmíněné pojmy si podrobněji vysvětlíme někdy později.\n"
"Cílem tohoto úvodního dílu je hlavně ukázat praktické použití M4 na příkladech.";

static char ch_para_14[] =
"Bezkontextová gramatika (krátce CFG) je formální gramatika, ve které mají všechna přepisovací pravidla tvar A → β.\n"
"Neterminál A se přepíše na libovolně dlouhý řetězec β složený z neterminálů N nebo terminálů Σ.\n"
"Kleeneho hvězda znamená, že se neterminál A může přepsat na ε (přepisovací pravidlo A → ε).";

static char ch_para_15[] =
"Přepisovací pravidla M4 jsou stejná jako přepisovací pravidla bezkontextové gramatiky.";

static char ch_para_16[] =
"Všechna klíčová slova M4 jsou neterminály (makra), provedou nějakou akci a přepíší se na ε nebo jiný symbol.\n"
"Všechna klíčová slova lze přejmenovat nebo úplně vypnout.\n"
"Tato vlastnost je velmi důležitá pro režim preprocesoru.";

static char ch_para_17[] =
"Výchozí dvojice znaků `' v M4 řídí expanzi neterminálů.\n"
"Klíčové slovo changequote() je může změnit na jiné znaky, například {[], ␂␆, ⟦⟧}.\n"
"Neterminály, které nechceme (ihned) expandovat, jsou obklopeny touto dvojicí znaků.\n"
"Při průchodu makro procesorem jsou všechny symboly mezi touto dvojicí znaků terminálními symboly a vnější dvojice znaků je odstraněna.\n"
"Další průchod již způsobí expanzi původně chráněných neterminálů.\n"
"Dvojice řídících znaků se nastavuje na začátku kořenového souboru.";

static char ch_para_18[] =
"Automaty slouží jako „přepínače“ pravidel gramatiky.\n"
"Používají přepisovací pravidla gramatiky jako uzly a mění své stavy podle vstupních symbolů.\n"
"Aktuálně používané přepisovací pravidlo produkuje do výstupní fronty (nebo do několika výstupních front)\n"
"specifický kód, dokud automat nepřejde do jiného uzlu s jiným přepisovacím pravidlem.\n"
"Příklady generujících automatů jsou ukázány v příloze.";

static char ch_para_19[] =
"Výstupní fronty jsou dočasné úložiště pro části výsledného kódu.\n"
"Tyto části výsledného kódu jsou produkovány přepisovacími pravidly gramatiky, které přepisují vstupní symboly.\n"
"Klíčové slovo divert(ℤ) nastavuje aktuální výstupní frontu.\n"
"Na závěr jsou všechny neprázdné fronty vypsány ve vzestupném pořadí na standardní výstup a složí výsledný kód z částí kódu.\n"
"Výstupní fronty jsou ukázány v příloze.";

static char ch_para_20[] =
"M4 se používá ke generování zdrojového kódu libovolného programovacího jazyka nebo jako preprocesor jakéhokoliv zdrojového kódu.";

static char ch_para_21[] =
"M4 transformuje vstupní data ze souborů .mc na výsledná data následujícím příkazem:";

static char ch_para_22[] =
"Během načítání souborů jsou prováděny dvě základní operace:";

static char ch_para_23[] =
"Soubory input1.mc a input2.mc obsahují vstupní data ve specifickém formátu, který umožňuje jejich transformaci na výstupní data podle pravidel v předchozích .m4 souborech.\n"
"Datové soubory .mc obvykle neobsahují žádná transformační pravidla.";

static char ch_para_24[] =
"Vstupní data mohou také přicházet z kolony:";

static char ch_para_25[] =
"Vyzkoušejte: Příklady generování kódu";

static char ch_para_26[] =
"M4 může pracovat v režimu preprocesoru a může být také součástí kolony.\n"
"Vstupní zdrojový kód jím prochází beze změny s výjimkou neterminálních symbolů.\n"
"Nalezené neterminály jsou expandovány na terminály a odchází spolu se zdrojovým kódem na výstup.\n"
"M4 může rozšířit jakýkoliv jiný jazyk, kde je preprocesor nedostatečný (bez rekurze) nebo žádný.\n"
"Důležité je zvolit vhodný levý znak pro řízení expanze neterminálů, který nesmí kolidovat se znakem vstupního zdrojového kódu.\n"
"Kolize znaku je ale snadno řešitelná regulárním výrazem.";

static char ch_para_27[] =
"Konfliktní znak ` ze vstupního zdrojového kódu je skryt do makra `'LL().\n"
"Prázdný pár řídících znaků `' před makrem LL() slouží jako oddělovač symbolů.\n"
"Při průchodu zdrojového kódu makro procesorem se makro `'LL() přepíše zpátky na původní znak ` a prázdný pár `' je odstraněn.";

static char ch_para_28[] =
"Vyskytují-li se ve vstupním kódu komentáře # nebo dnl, je nutné je skrýt.\n"
"Znaky `' vypnou původní význam komentářů a budou odebrány při průchodu makro procesorem.\n"
"Komentáře M4 # a dnl jsou skryty mezi výchozí znaky: `#' `dnl'";

static char ch_para_29[] =
"Použijeme-li pro řízení expanze neterminálů hranaté závorky, stejným způsobem je skryta levá [ hranatá závorka.\n"
"Vše ostatní platí jako pro výchozí znaky `'.";

static char ch_para_30[] =
"Komentáře M4 # a dnl jsou skryté mezi závorkami: [#] [dnl]";

static char ch_para_31[] =
"Pro řízení expanze neterminálů lze použít netisknutelné znaky ␂ (0x02) a ␆ (0x06).\n"
"Tyto znaky nemohou kolidovat s tisknutelnými znaky zdrojového kódu.";

static char ch_para_32[] =
"Komentáře M4 # a dnl jsou skryty mezi netisknutelné znaky: ␂#␆ ␂dnl␆";

static char ch_para_33[] =
"Expanzi neterminálů může také řídit vhodně zvolený pár UTF-8 znaků.\n"
"Běžný zdrojový kód takové znaky neobsahuje, proto nemusíme řešit kolizi levého řídícího ⟦ znaku.\n"
"UTF-8 znaky nabízí podobné výhody jako netisknutelné znaky.";

static char ch_para_34[] =
"Komentáře M4 # a dnl jsou skryty mezi UTF-8 znaky: ⟦#⟧ ⟦dnl⟧";

static char ch_para_35[] =
"Vyzkoušejte: Příklady preprocesoru";

static char ch_para_36[] =
"Smíšený režim je kombinací předchozích režimů a je používán hlavně na pokusy.\n"
"Data nejsou oddělena od transformačních pravidel.\n"
"Listový soubor leaf.m4 obsahuje definice těchto pravidel spolu se vstupními daty.";

static char ch_para_37[] =
"Vyzkoušejte: M4: příklady";

static char ch_para_38[] =
"Pro úspěšné zvládnutí tohoto makro jazyka je důležité splnit několik předpokladů.\n"
"M4 není jednoduchý jazyk, protože není možné v něm myslet a programovat jako v běžném programovacím jazyce.\n"
"Nejdůležitější je uvědomit si, že se v něm programují přepisovací pravidla gramatiky.\n"
"Každý řetězec je buď terminální nebo neterminální symbol včetně všech klíčových slov jazyka (symboly # a , jsou speciální případy neterminálů).";

static char ch_para_39[] =
"Základem všech gramatik jsou přepisovací pravidla, jejichž podobu obecně popisuje:";

static char ch_para_40[] =
"Formální gramatika popisuje podmnožiny\n"
"přepisovacích pravidel formálního jazyka.\n"
"Jedna z podmnožin se jmenuje bezkontextová gramatika,\n"
"krátce CFG.\n"
"Jak již bylo dříve zmíněno, přepisovací pravidla CFG pracují stejně jako přepisovací pravidla jazyka M4.\n"
"Některý z následujících dílů seriálu se podrobněji zaměří na formální gramatiky.";

static char ch_para_41[] =
"Schopnost používat převážně dvoustavové automaty je zásadní věc pro psaní jednoduchých M4 skriptů, protože převážná většina skriptů používá malé automaty.";

static char ch_para_42[] =
"Pořadí vstupních symbolů nebo jejich kontext lze otestovat automatem.\n"
"Splňují-li vstupní symboly požadované vlastnosti, automat skončí v uzlu s dvojitým kroužkem, kterým se označuje akceptující stav.";

static char ch_para_43[] =
"Předchozí automat lze zapsat jako ASCII art doprovázející M4 skript:";

static char ch_para_44[] =
"Vstupní symboly mění uzly automatu, čímž zároveň mění přepisovací pravidla pro generování kódu.\n"
"Příklad generujícího automatu naleznete v příloze:";

static char ch_para_45[] =
"Dobře navržený generátor kódu se obvykle skládá z několika menších souborů, jejichž pořadí, závislosti a parametry se zapisují do souboru Makefile.\n"
"Dobrá znalost tvorby Makefile je proto základním předpokladem pro zvládnutí M4.\n"
"Čtení a údržba zdrojového kódu celkově zabere vždy více času než jeho tvorba.\n"
"Dobře strukturovaný Makefile proto zásadním způsobem přispívá k celkové přehlednosti výsledného generátoru kódu.";

static char ch_para_46[] =
"Zvládnutí editoru Vim[5] je důležitým předpokladem pro pohodlí a rychlost psaní kódu M4.\n"
"Vim zkratky, definované klíčovým slovem iabbrev, ušetří velké množství zbytečně napsaného textu.\n"
"Tyto zkratky také významně snižují výskyt téměř neviditelných chyb způsobených nepárovou závorkou, čímž šetří ztracený čas vynaložený na ladění kódu.";

static char ch_para_47[] =
"M4 obvykle nejde zcela zvládnout přes víkend, zvláště chybí-li základy[6]\n"
"teorie automatů a formálních gramatik.\n"
"Ke zvládnutí jazyka M4 je nutné v něm programovat delší období a napsat množství špatného (složitého) M4 kódu, který z vlastní vůle přepíšete kvůli lepšímu nápadu.\n"
"Tímto způsobem je možné postupně získat praxi.";

static char ap_para_0[] =
"Vstupní zdrojový kód je podobný CSV, který se převede na libovolně složitý cílový kód jiného jazyka pomocí CFG, automatů a výstupních front.\n"
"Zásobníky v příkladech nejsou použity.\n"
"Vstupní zdrojový kód obsahuje speciální znaky, které je nutné skrýt:";

static char ap_para_1[] =
"Tento příklad nepoužívá výstupní fronty, pouze vypisuje CSV oddělené znakem TAB na standardní výstup.";

static char ap_para_2[] =
"Příklad používá makro COUNT_UP ze souboru countu.m4, jehož β se zkopíruje do pravé strany makra COUNTER.\n"
"Během první expanze COUNTER proběhne inicializace jeho startovací hodnoty.\n"
"Další expanze vrátí číselný terminální symbol a proběhne zvýšení vnitřního pomocného (globálního) symbolu o jedničku.\n"
"COUNTER je malý automat.";

static char ap_para_3[] =
"Každý typ výstupního kódu vyžaduje úpravu speciálních znaků.\n"
"Klíčové slovo jazyka M4 patsubst() je nevhodné pro tento úkol.\n"
"Všechny speciální znaky vstupního souboru proto napřed skryjeme do vhodně pojmenovaných maker pomocí regulárních výrazů.";

static char ap_para_4[] =
"Příklad používá jednu výstupní frontu na znaky }; pro uzavření pole na konci skriptu.";

static char ap_para_5[] =
"Příklad spustí externí příkaz date a jeho výstup umístí do hranatých závorek.\n"
"Výstupem externího příkazu jsou dvě položky oddělené čárkou.\n"
"Makro SARG1() vybere první položku, protože druhá položka obsahuje nežádoucí znak nového řádku LF (0x0a).";

static char ap_para_6[] =
"Příklad používá makro COUNTER pro číslování výsledných CPP maker a jednu výstupní frontu.\n"
"Fronta číslo 1 obsahuje direktivu preprocesoru #endif pro zakončení hlavičkového souboru.\n"
"Převod dekadické hodnoty počítadla na dvoumístné hex-a číslo provádí klíčové slovo eval().";

static char ap_para_7[] =
"Příklad používá malý automat NEW_LINE pro generování znaku nového řádku \\n a jednu výstupní frontu číslo 1 do které se vloží znaky \"; pro uzavření výsledného řetězce.\n"
"Poprvé se NEW_LINE přepíše na ε, podruhé a dále se přepíše na \\n.";

static char ap_para_8[] =
"Tento příklad je podobný předchozímu, avšak každý řetězec je na novém řádku.";

static char ap_para_9[] =
"Příklad používá dvě výstupní fronty.\n"
"Fronta číslo 1 obsahuje odstavce,\n"
"fronta číslo 2 uzavírací značky HTML stránky.\n"
"Navigační odkazy nemusí být nikde uloženy, jdou přímo na výstup.\n"
"Zprávy typu QUERY a WARNING jsou zpracovány stejně jako zprávy typu ERROR.";

static char ap_para_10[] =
"Příklad ukazuje větvení gramatikou, argumenty maker se ignorují.\n"
"Vstupní neterminály se přepisují na terminály ERROR → 🐛,\n"
"QUERY → 🐜,\n"
"WARNING → 🐝.";

static char ap_para_11[] =
"Proměnná $0 se nahradí za jméno makra a zřetězí se s dalším symbolem.\n"
"Nově vzniklý neterminál se přepíše na odpovídající terminální symbol (číslo fronty nebo jméno).";

static char ap_para_12[] =
"Příklad používá dvě výstupní fronty a jeden generující automat.\n"
"První chybová zpráva ERROR(⟦…⟧) ve stavu ERROR vygeneruje záhlaví se závorkami a vypíše na výstup první záznam.\n"
"Automat přejde do stavu NEXT_ITEM což je β pravidlo.\n"
"Následující chybové zprávy ve stavu NEXT_ITEM pouze vypisují na výstup jednotlivé záznamy.\n"
"Na závěr výstupní fronty číslo 1 a 2 vypíšou znaky ] a }} čímž zakončí výsledný JSON.";

static char ap_para_13[] =
"Příklad zpracovává další zprávy typu QUERY a WARNING.\n"
"Používá tři automaty a šest výstupních front.\n"
"Generujeme-li složitější zdrojový kód, brzy narazíme na problém udržení konzistence indexů pro výstupní fronty.\n"
"Abychom se vyhnuli zmatku, pojmenujeme si fronty a místo čísel používáme jména.\n"
"Abychom nemuseli definovat podobná pravidla, zkopírujeme si pravou stranu ERROR (je to také β pravidlo) do pravé strany pravidel QUERY a WARNING.";

static char ap_para_14[] =
"Během vývoje se často mění pořadí a počet výstupních front, což také vyžaduje častou změnu jejich indexů.\n"
"Indexy je proto vhodné generovat.\n"
"Můžeme pak používat prakticky neomezený počet front.\n"
"Následující příklad ukazuje, jak se tyto indexy generují.";

static char ap_para_15[] =
"Příklad používá tři automaty a dvě výstupní fronty číslo 2 a 4 definované v odděleném souboru.\n"
"Názvy INI sekcí jsou generovány řetězením symbolů (viz. větvení).\n"
"Příklad používá stejný soubor pro výstupní fronty jako příklad pro generování JSON.";

static char ap_para_16[] =
"Příklad používá jednu výstupní frontu číslo 1 pro uzavírací značku </messages>.";

static char ap_para_17[] =
"Příklad seskupuje zprávy podle jejich typu pomocí výstupních front.";

static char ap_para_18[] =
"Direktivy CPP jsou pro M4 jednořádkový komentář, což brání nežádoucí expanzi stejně pojmenovaných maker.\n"
"Definujeme-li bezpečnější makro SAF(), stejně pojmenované makro SAF () nebude přepsáno.\n"
"Jmenný prostor CPP tak může být zcela oddělen od jmenného prostoru M4.\n"
"Problematický znak ` je skryt do makra LL().\n"
"Apostrof ' ve zdrojovém kódu ničemu nevadí.\n"
"Apostrof uvnitř makra ORD() je skryt do makra RR().\n"
"Všimněte si jmen funkcí define () nebo ifelse () a kde je expandován SYMBOL.";

static char ap_para_19[] =
"CSS používá znak # pro kódy barev, což je také začátek jednořádkového M4 komentáře.\n"
"Klíčové slovo changecom(/*,*/) nastaví víceřádkový komentář /* … */ a přepíše se na ε.\n"
"Komentáře se vypínají stejným klíčovým slovem changecom bez parametrů.";

static char ap_para_20[] =
"Bash používá oba znaky, ` a [.\n"
"Nechceme-li je skrývat do makra LL(), můžeme použít pro řízení expanze neterminálů netisknutelné znaky, viz. příklad:";

static char ap_para_21[] =
"Uvnitř hranatých závorek [… se neterminály neexpandují …].\n"
"Proto je levá hranatá závorka [ nahrazena makrem LL() z kořenového souboru.";

static char ap_para_22[] =
"Počítadla COUNT_UP a COUNT_DOWN jsou definována v souboru countu.m4.\n"
"Neterminály [… uvnitř závorek …] nebudou expandovány, pouze se odeberou vnější závorky.\n"
"Nutno použít makro LL() z kořenového souboru.";

static char ap_para_23[] =
"Prázdný pár [] (nebo prázdný symbol v závorkách [ε]) slouží jako oddělovač symbolů.\n"
"Závorky kolem znaku komentáře [#] vypnou jeho původní význam, stejně jako vypnou význam silnějšího M4 komentáře\n"
"[dnl].\n"
"Vypnou také původní význam čárky [,] jako oddělovače argumentů maker.\n"
"Tyto symboly se stanou obyčejnými terminálními symboly bez jakéhokoliv vedlejšího efektu.";

static char ap_para_24[] =
"Univerzální výstraha DONTE se ignoruje bez závorek, stejně jako LL, RR, …\n"
"Taková makra explicitně vytváří vývojář skriptů, prohlédněte si kořenový soubor root1b.m4.";

char *chapters_paragraphs[] = {
	ch_para_0,
	ch_para_1,
	ch_para_2,
	ch_para_3,
	ch_para_4,
	ch_para_5,
	ch_para_6,
	ch_para_7,
	ch_para_8,
	ch_para_9,
	ch_para_10,
	ch_para_11,
	ch_para_12,
	ch_para_13,
	ch_para_14,
	ch_para_15,
	ch_para_16,
	ch_para_17,
	ch_para_18,
	ch_para_19,
	ch_para_20,
	ch_para_21,
	ch_para_22,
	ch_para_23,
	ch_para_24,
	ch_para_25,
	ch_para_26,
	ch_para_27,
	ch_para_28,
	ch_para_29,
	ch_para_30,
	ch_para_31,
	ch_para_32,
	ch_para_33,
	ch_para_34,
	ch_para_35,
	ch_para_36,
	ch_para_37,
	ch_para_38,
	ch_para_39,
	ch_para_40,
	ch_para_41,
	ch_para_42,
	ch_para_43,
	ch_para_44,
	ch_para_45,
	ch_para_46,
	ch_para_47,
};
char *appendix_paragraph[] = {
	ap_para_0,
	ap_para_1,
	ap_para_2,
	ap_para_3,
	ap_para_4,
	ap_para_5,
	ap_para_6,
	ap_para_7,
	ap_para_8,
	ap_para_9,
	ap_para_10,
	ap_para_11,
	ap_para_12,
	ap_para_13,
	ap_para_14,
	ap_para_15,
	ap_para_16,
	ap_para_17,
	ap_para_18,
	ap_para_19,
	ap_para_20,
	ap_para_21,
	ap_para_22,
	ap_para_23,
	ap_para_24,
};
char *chapter[] = {
	"1 Úvod",
	"1.1 Příklady pro čtenáře",
	"2 Historie makro jazyků",
	"3 Základy jazyka M4",
	"3.1 Bezkontextová gramatika",
	"3.2 Automaty",
	"3.3 Výstupní fronty",
	"4 Hlavní použití M4",
	"4.1 Generování kódu",
	"4.2 Preprocesor",
	"5 Předpoklady pro zvládnutí M4",
	"5.1 Základy gramatik",
	"5.2 Základy automatů",
	"5.3 (GNU) make",
	"5.4 Vim",
	"5.5 Talent a čas",
};
char *appendix[] = {
	"A Příklady generování kódu",
	"A.1 ⟦⟧ Vstupní zdrojový kód",
	"A.2 ⟦⟧ CSV: nejjednodušší příklad",
	"A.3 ⟦⟧ CSV: počítadlo",
	"A.4 💡 Úpravy speciálních znaků",
	"A.5 ⟦⟧ C: výstupní fronta",
	"A.6 ⟦⟧ INI: externí příkaz",
	"A.7 ⟦⟧ .h: hex počítadlo",
	"A.8 ⟦⟧ C: malý automat",
	"A.9 ⟦⟧ C: malý automat 2",
	"A.10 ⟦⟧ HTML: výstupní fronty",
	"A.11 ⟦⟧ Větvení gramatikou",
	"A.12 ⟦⟧ JSON: generující automat",
	"A.12.1 ⟦⟧ JSON: pojmenované fronty",
	"A.12.2 ⟦⟧ JSON: generované indexy front",
	"A.13 ⟦⟧ INI: nespojitý index front",
	"A.14 ⟦⟧ XML: smíšené zprávy",
	"A.15 ⟦⟧ XML: oddělené zprávy",
	"A.16 ⟦⟧ Bash $ echo \"řetězec\"",
	"A.17 ⟦⟧ Bash $ echo 'řetězec'",
	"B Příklady preprocesoru",
	"B.1 `' Preprocesor jazyka C a M4",
	"B.2 `' CSS: vložení souboru, komentář",
	"B.3 ␂␆ Bash: netisknutelné znaky",
	"C M4: příklady",
	"C.1 [] JSON: levá závorka [",
	"C.2 [] Bash: počítadla",
	"C.3 [] .h: závorky [], [,], [#], [dnl]",
	"C.4 [] AWK: příklady bezpečnějších maker",
	"D Proč používat M4 a proč ne?",
	"D.1 👍 Proč generovat kód v M4",
	"D.2 👎 Proč se vyhnout M4",
};
char *bridgehead[] = {
	"GPM (General Purpose Macro-generator)",
	"M3",
	"M4",
	"GNU M4",
	"Přepisovací pravidla M4",
	"Řízení expanze neterminálů",
	"`' Výchozí znaky",
	"[] Hranaté závorky",
	"␂␆ Netisknutelné znaky",
	"⟦⟧ UTF-8 znaky",
	"Smíšený režim",
	"Formální gramatika (Chomského typu)",
	"Testovací automat",
	"Generující automat",
	"Upravený vstupní kód",
	"⟦⟧ Převodní soubor pro XML, XSLT, HTML",
	"⟦⟧ Převodní soubor pro C, JSON, INI: \"řetězec\"",
	"⟦⟧ Převodní soubor pro Bash: \"řetězec\"",
	"⟦⟧ Převodní soubor pro Bash: 'řetězec'",
	"⟦⟧ Převodní soubor pro CSV, M4 (vrátí všechny znaky zpátky)",
	"Větvení gramatikou – základní princip",
};
char *reference[] = {
	"1. A General Purpose Macro-generator, Computer Journal 8, 3 (1965), 225–41",
	"2. RATFOR — A Preprocessor for a Rational Fortran, Brian W. Kernighan",
	"3. The M4 Macro Processor, Bell Laboratories (1977)",
	"4. GNU M4 - GNU macro processor, Free Software Foundation",
	"5. Vim – všudypřítomný textový editor, který edituje text rychlostí myšlenky",
	"6. Automaty a formální jazyky I, Učební text FI MU",
	"7. Automaty a gramatiky, Michal Chytil, 1. vydání, Praha, 331 s. 1984.",
};
char *reference_url[] = {
	"http://dx.doi.org/10.1093/comjnl/8.3.225",
	"https://wolfram.schneider.org/bsd/7thEdManVol2/ratfor/ratfor.pdf",
	"https://wolfram.schneider.org/bsd/7thEdManVol2/m4/m4.pdf",
	"https://www.gnu.org/software/m4/manual/",
	"https://www.vim.org/",
	"https://is.muni.cz/elportal/estud/fi/js06/ib005/Formalni_jazyky_a_automaty_I.pdf",
	"https://is.muni.cz/publication/173173",
};
unsigned int chapters_paragraphs_len = ARRAY_SIZE(chapters_paragraphs);
unsigned int chapters_len = ARRAY_SIZE(chapter);
unsigned int references_len = ARRAY_SIZE(reference);
unsigned int appendix_len = ARRAY_SIZE(appendix);
unsigned int appendix_paragraphs_len = ARRAY_SIZE(appendix_paragraph);
