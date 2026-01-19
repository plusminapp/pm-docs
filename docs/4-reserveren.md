# Reserveren

### Reserveren, de uitgangspunten
* [reserveren](8-woordenlijst.md#reserveren) wordt gestart door de gebruiker; natuurlijke momenten daarvoor zijn de periode start en als er nieuw inkomen is ontvangen; (hiervoor kunnen we in de app een signaal geven)
* als er tekorten zijn in potjes vanuit de vorige periode moet de gebruiker die eerst [aanvullen](8-woordenlijst.md#aanvullen-tot-of-aanvullen-met); dat kan (in de app) ook geautomatiseerd waarbij de tekorten in mindering worden gebracht op de [buffer](8-woordenlijst.md#buffer)
* [reserveren](8-woordenlijst.md#reserveren) heeft als scope de huidige periode; daarbij moet erop worden gelet dat er aan het eind van de periode, op basis van de gebudgetteerde uitgaven, voldoende saldo over is om de  start van de volgende periode, tot de eerste gebudgetteerde inkomsten, te overbruggen
* [reserveren](8-woordenlijst.md#reserveren) gebruikt alleen geld dat in de [buffer](8-woordenlijst.md#buffer) (en dus niet in (spaar)potjes) zit en waar de gebruiker dus over kan beschikken (dus geen toekomstig inkomen); de som van de potjes is dus altijd de som van de [betaalmiddelen](8-woordenlijst.md#betaalmiddelen); het is wel toegestaan om geld over te hevelen van het ene naar het andere potje
* [reserveren](8-woordenlijst.md#reserveren) verdeelt het beschikbare geld (de [buffer](8-woordenlijst.md#buffer)) in *chronologische* volgorde over de [potjes voor nu](8-woordenlijst.md#potjes-voor-nu), dag voor dag
* [reserveren](8-woordenlijst.md#reserveren) houdt GEEN rekening met handmatige verplaatsingen van geld tussen potjes in de huidige periode;
* [reserveren](8-woordenlijst.md#reserveren) vult de potjes tot het einde van de [buffer](8-woordenlijst.md#buffer) of tot het einde van de periode; bij het einde van de [buffer](8-woordenlijst.md#buffer) wordt de laatste dag, vóór het einde van de [buffer](8-woordenlijst.md#buffer), helemaal gevuld en de daarop volgende (die dus niet volledig kan worden gevuld) blijft leeg; deze dag "vóór het einde van de [buffer](8-woordenlijst.md#buffer)" is de [reserveringshorizon](8-woordenlijst.md#reserveringshorizon)
* als [vaste lasten](8-woordenlijst.md#vaste-lasten) kunnen variëren reserveer je het maximum dat je kwijt denkt te zijn; een vaste last wordt [aangevuld TOT](8-woordenlijst.md#aanvullen-tot-of-aanvullen-met) dus de elke periode wordt het bedrag van de vorige periode daadwerkelijk gereserveerd
* als de [potjes voor nu](8-woordenlijst.md#potjes-voor-nu) gevuld zijn t/m de laatste dag van een periode worden de spaarpotten gevuld (tenzij een spaarpot een doeldatum in de huidige periode heeft, dan wordt die op die dag gevuld); hou hierbij wel rekening met de benodigde reserve voor het begin van de volgende periode
* het is aan te raden de spaarpotjes op (een) spaarrekening(en) te zetten, in de app wordt dit inzichtelijk gemaakt

### **Reserveren, het algoritme**

1. bereken de openingsstand van de periode; stop als er potjes zijn met een negatieve reserve en vraag de gebruiker te verevenen
2. (her)berekenen wat het [leefgeld](8-woordenlijst.md#leefgeld) per dag moet zijn o.b.v. de [leefgeld](8-woordenlijst.md#leefgeld) [budgetten](8-woordenlijst.md#budget)
3. vanaf de laatste reserveringsDag+1 -> einde periode, per dag itereren, zolang er voldoende geld in de [buffer](8-woordenlijst.md#buffer) zit om een dag helemaal te vullen:
          1. [vaste lasten](8-woordenlijst.md#vaste-lasten) op die dag berekenen en [leefgeld](8-woordenlijst.md#leefgeld) per dag daarbij optellen; 
          3. als [vaste lasten](8-woordenlijst.md#vaste-lasten) + [leefgeld](8-woordenlijst.md#leefgeld) <= [buffer](8-woordenlijst.md#buffer): aan de betreffende potjes toevoegen en van de buffer aftrekken
4. als er nog geld in de [buffer](8-woordenlijst.md#buffer) zit, bereken het minimum van de cashflow van de volgende periode, rekening houdend met geplande inkomsten; breng dat in mindering op de [buffer](8-woordenlijst.md#buffer); vul dan de spaarpotje; als er onvoldoende over is voor alle spaarpotjes, stop dan en waarschuw de gebruiker
   
* _periodestart verevenen_: vul de potjes met een negatief saldo uit de vorige periode vanuit de [buffer](8-woordenlijst.md#buffer) aan; gebruik als [reserveringshorizon](8-woordenlijst.md#reserveringshorizon) = periodeStartdatum-1 (dus einde van de vorige periode)


### **Noten/vragen**

* wat is het verschil tussen langcyclische [vaste lasten](8-woordenlijst.md#vaste-lasten) (meer dan 1 maand) en [sparen](8-woordenlijst.md#sparen)?
* moet de gebruiker zelf de [reserveringshorizon](8-woordenlijst.md#reserveringshorizon) kunnen aanpassen?
* hoe omgaan met het wijzigen van het [budget](8-woordenlijst.md#budget) van een rekening? voor welke periodes is dit relevant?
* bij een potje met [aanvullen TOT](8-woordenlijst.md#aanvullen-tot-of-aanvullen-met), en een nagekomen betaling in de vorige periode, moet dat dan worden meegenomen in de (her)berekening van de reservering voor dat potje in de huidige periode? of het extra betaalde bedrag gewoon toevoeven aan de reserve?