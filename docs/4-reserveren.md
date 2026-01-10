# **Reserveren en stand**

### Reserveren, de uitgangspunten
* reserveren wordt gestart door de gebruiker; natuurlijke momenten daarvoor zijn de periode start en als er nieuw inkomen is ontvangen; (hiervoor kunnen we in de app een signaal geven)
* als er tekorten zijn in potjes vanuit de vorige periode moet de gebruiker die eerst aanvullen; dat kan (in de app) ook geautomatiseerd waarbij de tekorten in mindering worden gebracht op de buffer
* reserveren heeft als scope de huidige periode; daarbij moet erop worden gelet dat er aan het eind van de periode, op basis van de gebudgetteerde uitgaven, voldoende saldo over is om de  start van de volgende periode, tot de eerste gebudgetteerde inkomsten, te overbruggen
* reserveren gebruikt alleen geld dat in de buffer (en dus niet in (spaar)potjes) zit en waar de gebruiker dus over kan beschikken (dus geen toekomstig inkomen); de som van de potjes is dus altijd de som van de betaalmiddelen; het is wel toegestaan om geld over te hevelen van het ene naar het andere potje
* reserveren verdeelt het beschikbare geld (de buffer) in *chronologische* volgorde over de potjes voor nu, dag voor dag
* reserveren houdt GEEN rekening met handmatige verplaatsingen van geld tussen potjes in de huidige periode;
* reserveren vult de potjes tot het einde van de buffer of tot het einde van de periode; bij het einde van de buffer wordt de laatste dag, vóór het einde van de buffer, helemaal gevuld en de daarop volgende (die dus niet volledig kan worden gevuld); deze dag "vóór het einde van de buffer" is de reserveringshorizon
* als vaste lasten kunnen variëren reserveer je het maximum dat je kwijt denkt te zijn; een vaste last wordt aangevuld TOT dus de elke periode wordt het bedrag van de vorige periode daadwerkelijk gereserveerd
* als de potjes voor nu gevuld zijn t/m de laatste dag van een periode worden de spaarpotten gevuld (tenzij een spaarpot een doeldatum in de huidige periode heeft, dan wordt die op die dag gevuld); hou hierbij wel rekening met de benodigde reserve voor het begin van de volgende periode
* het is aan te raden de spaarpotjes op (een) spaarrekening(en) te zetten, in de app wordt dit inzichtelijk gemaakt

### **Reserveren, het algoritme**

1. bereken de openingsstand van de periode; stop als er potjes zijn met een negatieve reserve en vraag de gebruiker te verevenen
2. (her)berekenen wat het leefgeld per dag moet zijn o.b.v. de leefgeld budgetten
3. vanaf de laatste reserveringsDag+1 -> einde periode, per dag itereren, zolang er voldoende geld in de buffer zit om een dag helemaal te vullen:
          1. vaste lasten op die dag berekenen
          2. leefgeld per dag daarbij optellen
          3. als vaste lasten + leefgeld <= buffer: aan de betreffende potjes toevoegen
4. als er nog geld in de buffer zit, bereken het minimum van de cashflow van de volgende periode, rekening houdend met geplande inkomsten; breng dat in mindering op de buffer; vul dan de spaarpotje; als er onvoldoende over is voor alle spaarpotjes, stop dan en waarschuw de gebruiker
   
* _periodestart verevenen_: vul de potjes met een negatief saldo uit de vorige periode vanuit de buffer aan; gebruik als reserveringshorizon = periodeStartdatum-1 (dus einde van de vorige periode)

### **Stand van de potjes**

Onderstaand een voorstel voor de terugkoppeling aan de gebruiker hoe een potje er voor staat; voor elke sub-bullet (º) moet nog een naam en een kleur worden gekozen.

* universeel:
    * potje staat in de min, dus reserve < 0
* leefgeld
    * verwacht niet uit te komen, reserve - nog nodig < 0
    * verwacht wel uit te komen, reserve - nog nodig > 0  
      (waarbij nog nodig: dagbudget *  dagen nog te gaan in de periode)
* vaste lasten, aflossing:
    * achterstand  
      (periodebudget - periodebetaling) > 0 && vandaag > betaaldatum
* vaste lasten, aflossing, sparen:
    * minder toegewezen dan het budget
    * meer toegewezen dan het budget

### **Noten/vragen**

* wat is het verschil tussen langcyclische vaste lasten (meer dan 1 maand) en sparen?
* moet de gebruiker zelf de reserveringshorizon kunnen aanpassen?
* hoe omgaan met het wijzigen van het budget van een rekening? voor welke periodes is dit relevant?