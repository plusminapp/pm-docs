# Toewijzen

## Toewijzen, de uitgangspunten
* [toewijzen](8-woordenlijst.md#toewijzen) wordt gestart door de gebruiker; natuurlijke momenten daarvoor zijn de periode start en als er nieuw inkomen is ontvangen; (hiervoor kunnen we in de app een signaal geven)
* als er tekorten zijn in potjes vanuit de vorige periode moet de gebruiker die eerst [aanvullen](8-woordenlijst.md#aanvullen-tot-of-aanvullen-met); dat kan (in de app) ook geautomatiseerd waarbij de tekorten in mindering worden gebracht op de [buffer](8-woordenlijst.md#buffer)
* [toewijzen](8-woordenlijst.md#toewijzen) gebruikt alleen geld dat in de [buffer](8-woordenlijst.md#buffer) (en dus niet in (spaar)potjes) zit en waar de gebruiker dus over kan beschikken (dus geen toekomstig inkomen); de som van de potjes is dus altijd de som van de [betaalmiddelen](8-woordenlijst.md#betaalmiddelen); het is wel toegestaan om geld over te hevelen van het ene naar het andere potje
* elk potje heeft een positief geheel getal (1, 2, 3, 4, ...) als prioriteit, waarbij 1 de hoogste prioriteit is; het is aan te raden de [Big Five](8-woordenlijst.md#big-five-vaste-lasten) de hoogste prioriteit te geven; 
* [toewijzen](8-woordenlijst.md#toewijzen) verdeelt het beschikbare geld (de [buffer](8-woordenlijst.md#buffer)) in volgorde van prioriteit over de [potjes voor nu](8-woordenlijst.md#potjes-voor-nu)
* [toewijzen](8-woordenlijst.md#toewijzen) houdt GEEN rekening met handmatige verplaatsingen van geld tussen potjes in de huidige periode;
* [toewijzen](8-woordenlijst.md#toewijzen) vult de potjes tot het einde van de [buffer](8-woordenlijst.md#buffer) of tot het volgende (verwachte) inkomsten moment; bij het einde van de [buffer](8-woordenlijst.md#buffer) wordt de laatste dag, vóór het einde van de [buffer](8-woordenlijst.md#buffer), helemaal gevuld en de daarop volgende (die dus niet volledig kan worden gevuld) blijft leeg; deze dag "vóór het einde van de [buffer](8-woordenlijst.md#buffer)" of "voor het volgende inkomstenmoment" is de [toewijzingshorizon](8-woordenlijst.md#toewijzingshorizon)
* als [vaste lasten](8-woordenlijst.md#vaste-lasten) kunnen variëren reserveer je het maximum dat je kwijt denkt te zijn; een vaste last wordt [aangevuld TOT](8-woordenlijst.md#aanvullen-tot-of-aanvullen-met) dus de elke periode wordt het bedrag van de vorige periode daadwerkelijk gereserveerd
* na het toewijzen krijgt de gebruiker (in de app) terugkoppeling of het gelukt is; als het niet is gelukt krijgt de gebruiker terugkoppeling **wat** er niet is gelukt; na het toewijzen kan de gebruiker handmatig de potjes herverdelen
* het is aan te raden spaarpotjes een lage prioriteit (dus een hoog getal) te geven
* het is aan te raden de spaarpotjes op (een) spaarrekening(en) te zetten, in de app wordt dit inzichtelijk gemaakt

## Toewijzen, het algoritme

TODO


## **Noten/vragen**

* wat is het verschil tussen langcyclische [vaste lasten](8-woordenlijst.md#vaste-lasten) (meer dan 1 maand) en [sparen](8-woordenlijst.md#sparen)?
* moet de gebruiker zelf de [toewijzingshorizon](8-woordenlijst.md#toewijzingshorizon) kunnen aanpassen?
* hoe omgaan met het wijzigen van het [budget](8-woordenlijst.md#budget) van een rekening? voor welke periodes is dit relevant?
* bij een potje met [aanvullen TOT](8-woordenlijst.md#aanvullen-tot-of-aanvullen-met), en een nagekomen betaling in de vorige periode, moet dat dan worden meegenomen in de (her)berekening van de toewijzing voor dat potje in de huidige periode? of het extra betaalde bedrag gewoon toevoeven aan de reserve?