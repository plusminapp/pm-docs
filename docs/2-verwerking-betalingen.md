# Verwerking betalingen

## Inleiding

Het verwerken van betalingen is de kern van de app.

### Betalingen Model

De zichtbare informatie die bij een betaling wordt vastgelegd is in zijn meest eenvoudige vorm:

- datum, bedrag, omschrijving en categorie
- de bron en de bestemming van de betaling
- de stand van de rekeningen/contant geld op de laatste boekingsdatum

Omdat de betalingen van de bank via een camt053 bestand kunnen worden ingelezen worden in dat geval ook de volgende velden bewaard:

- referentie, tegenrekening, naam_tegenrekening, betalingskenmerk, omschrijving_bank en status 

Ten slotte wordt, omdat het systeem de betalingen van meerdere gebruikers vastlegd, wordt bij de betaling ook de betreffende gebruiker (met rol 'hulpvrager') opgeslagen.

### Categorie&euml;n
PlusMin onderscheidt de volgende categorie&euml;n:

- **Inkomen**: Salaris, uitkering, AOW, ...
- **Boodschappen**: Voedsel, schoonmaakmiddelen, ...
- **Vaste lasten**: Huur, hypotheek, gemeente belastingen, enrgie, water, verzekeringen, ...
- **Variabele lasten**: Kleding, ...
- **Aflossing**: Betalingen voor een betaalregeling
- **Sparen**: Storting op/opname van de spaarrekening

### Bron en bestemming
De app legt de bron van de betaling vast (waarmee werd betaald?):

- **Extern**: bij Inkomsten
- **Betaalrekening**: betaling met een pin of Ideal
- **Contant geld**: betaling met contant geld
- **Spaarrekening**: opname van spaargeld

Daarnaast legt de app de bestemming van de betaling vast (aan wie is betaald?):

- **Extern**:
- **Betaalrekening**: bij Inkomsten
- **Contant geld**: opname van contant geld uit een geldautomaat
- **Spaarrekening**: storting van spaargeld

### Bron en bestemming per categorie

| Categorie       | Standaard ontvangst (+)         | Standaard betaling (-)          | Bijzonderheden                     |
|-----------------|---------------------------------|---------------------------------|------------------------------------|
| Inkomen         | Extern -> Betaalrekening        | nvt                             |                                    |
| Boodschappen    | nvt                             | Betaalrekening -> Extern        |                                    |
| Vaste lasten    | nvt                             | Betaalrekening -> Extern        |                                    |
| Variabele laste | nvt                             | Betaalrekening -> Extern        |                                    |
| Aflossing       | nvt                             | Betaalrekening -> Extern        | welke betaalregeling werd afgelost |
| Sparen          | Spaarrekening -> Betaalrekening | Betaalrekening -> Spaarrekening |                                    |
| Contant geld    | Contant geld -> Betaalrekening  | Betaalrekening -> Contant geld  |                                    |

Voor de categorie&euml;n Inkomen, Boodschappen, Vaste lasten, Variabele lasten en Aflossing kan bij het boeken ook
gekozen worden voor Contant geld ipv. Betaalrekening. 