# Verwerking betalingen

### Betalingen Model

De zichtbare informatie die bij een betaling wordt vastgelegd is in zijn meest eenvoudige vorm:

- datum, bedrag, omschrijving en categorie
- de bron en de bestemming van de betaling
- de stand van de rekeningen/contant geldt op de laatste boekingsdatum

Als de betalingen van de bank via een camt053 bestand worden ingelezen worden in dat geval ook de volgende
velden bewaard (als extra ondersteuning bij het, eventueel geautomatiseerd, toewijzen van de categorie):

- referentie, tegenrekening, naam_tegenrekening, betalingskenmerk, omschrijving_bank en status

Ten slotte wordt, omdat het systeem de betalingen van meerdere gebruikers vastlegd, bij de betaling ook de
betreffende hulpvrager opgeslagen.

### Categorie&euml;n

PlusMin onderscheidt de volgende categorie&euml;n:

- **Inkomsten**: Salaris, uitkering, AOW, ...
- **Boodschappen**: Voedsel, schoonmaakmiddelen, ...
- **Vaste lasten**: Huur, hypotheek, gemeente belastingen, energie, water, verzekeringen, wegenbelasting, ...
- **Anders**: Kleding, variabele vervoerskosten, niet vergoede medische kosten, persoonlijke verzorging, cadeautjes,
  identiteitsbewijs, ...
- **Betaalregelingen**: Betalingen voor een betaalregeling
- **Reserveren**: Storting op/opname van de spaarrekening

### Bron en bestemming

De app legt de bron (waarmee werd betaald?) en de bestemming (aan wie is betaald?) van de betaling vast:

|                    | Bron                          | Bestemming                                   |
|--------------------|-------------------------------|----------------------------------------------|
| **Extern**         | bij inkomsten                 | bij betalingen                               |
| **Betaalrekening** | betaling met een pin of Ideal | bij inkomsten                                |
| **Spaarrekening**  | opname van spaargeld          | storting van spaargeld                       |
| **Contant geld**   | betaling met contant geld     | opname van contant geld uit een geldautomaat |

### Bron en bestemming per categorie

| Categorie           | Standaard ontvangst (+)         | Standaard betaling (-)          | Bijzonderheden                     |
|---------------------|---------------------------------|---------------------------------|------------------------------------|
| Inkomsten           | Extern -> Betaalrekening*       | nvt                             |                                    |
| Boodschappen        | nvt                             | Betaalrekening* -> Extern       |                                    |
| Vaste lasten        | nvt                             | Betaalrekening* -> Extern       |                                    |
| Anders              | nvt                             | Betaalrekening* -> Extern       |                                    |
| Betalingsregelingen | nvt                             | Betaalrekening* -> Extern       | welke betaalregeling werd afgelost |
| Reserveren          | Spaarrekening -> Betaalrekening | Betaalrekening -> Spaarrekening |                                    |
| Contant geld        | Contant geld -> Betaalrekening  | Betaalrekening -> Contant geld  |                                    |

\* Voor de categorie&euml;n Inkomsten, Boodschappen, Vaste lasten, Anders en Betalingsregelingen kan bij het
boeken ook gekozen worden voor Contant geld i.p.v. Betaalrekening. 