#import "calamus.typ": calamus, first-use, calamus-graph

#show: calamus.with(
  school: [Gymnázium Karola Štúra, Námestie slobody 5, 900 01 Modra],
  school-founder: [Bratislavský samosprávny kraj],
  title: [Názov práce],
  category-number: 11,
  category-name: [Informatika],
  authors: (
    [Meno Priezvisko],
    // [Second author],
  ),
  study-year: [septima],
  supervisor: [Meno Priezvisko],
  consultant: none,
  city: [Modra],
  year: 2027,
  declaration-date: [dd. mm. rrrr],

  declaration: (title) => [
    Vyhlasujem, že prácu stredoškolskej odbornej činnosti na tému
    #emph[#title], som vypracoval samostatne, s použitím uvedených
    literárnych zdrojov. Prácu som neprihlásil a ani
    neprezentoval v žiadnej inej súťaži, ktorá je pod gesciou Ministerstva
    školstva, výskumu, vývoja a mládeže Slovenskej republiky.
    Som si vedomý dôsledkov, ak uvedené údaje nie sú pravdivé.
  ],

  acknowledgements: [
    Rád by som sa poďakoval svojmu školiteľovi Jozefovi Steinhüblovi za odborné vedenie,
    cenné rady a pripomienky pri spracovaní tejto práce.

    Tiež by som rád poďakoval spoločnosti {spoločnost} za finančnú podporu pri realizácii praktickej časti mojej práce.
  ],

  abbreviations: (
    (short: "API", full: [Application Programming Interface]),
  ),

  list-of-figures: false,
  list-of-tables: false,
  list-of-graphs: false,

  introduction: [
    Tu napíšte stručné uvedenie do problematiky, dôvod výberu témy,
    hlavný cieľ a prínos práce.
  ],

  bibliography-file: path("references.bib"),

  // An optional Resume can be added here:
  // resume: [A short summary of the aims, methods and results.],

  // Optional appendices are placed after the bibliography:
  // appendices: (
  //   (title: [Technická dokumentácia], body: [Text prílohy.]),
  // ),
)

= Problematika a prehľad literatúry

Predstavte súčasný stav poznania, doterajšie riešenia a odborné zdroje.
Príklad citácie oficiálnej metodiky SOČ @siov2018.

== Existujúce riešenia

Tu patrí porovnanie relevantných riešení.

= Ciele práce

Sformulujte hlavný cieľ a čiastkové ciele, ktoré budete vyhodnocovať.

= Materiál a metodika

Popíšte vstupy, použité nástroje, zvolené metódy a reprodukovateľný postup.

= Výsledky práce

Predstavte vlastné výsledky, merania alebo vytvorené riešenie.

= Diskusia

Interpretujte výsledky, porovnajte ich s inými prácami a vysvetlite obmedzenia.

= Závery práce

Zhodnoťte splnenie cieľov, prínos a možnosti ďalšieho rozvoja.

= Zhrnutie

Stručne uveďte cieľ, metodiku a najdôležitejšie výsledky práce
(odporúčaných 10 až 15 riadkov podľa metodiky SOČ @siov2018).
