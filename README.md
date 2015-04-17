# Vadja sõnastiku muundamine EELex andmebaasiks

## Taustaks
Vadja keele sõnaraamatut (Eesti Keele Sihtasutus, 2013) koostati eri puhkudel u 20 aasta jooksul ja ei jõudnud kunagi EKI sõnastiku koostamissüsteemi [EELexi](http://eelex.eki.ee/). Selle ümberpanemine EELex XML-struktuuri võimaldaks eeskätt otsimootorit nagu teistelgi EKI sõnaraamatutel, aga samuti kõiki teisi XMLiga ja EELexiga kaasnevaid hüvesid.

Sõnaraamatu trükifailid on masinloetavad ja võimaldavad automaatset muundamist (transformeerimist) EELexi XML formaati.

Käesolev projekt hõlmab transformatsioonifaile ehk XSLT. Projekt on mõeldud järk-järguliselt arenevaks ja selle peamiseks tagasiside kanaliks on mõeldud tulev otsimootor ning projekti veateated ([Issues](https://github.com/keeleinstituut/vadja-eelex/issues)).

Üldine arengukäik:
1. eristada sõnastiku märksõnad ja seada nende vasteks kirje ülejäänud tekst
1.1 koondada homonüüminumbriga märksõnad kokku sama märksõnagrupi alla
2. eristada vaste teksti struktuuri
2.1. autorielement
2.2. külaelemendid

