# Woordenlijst

<!-- TOC -->
* [Aanvullen TOT of aanvullen MET](#aanvullen-tot-of-aanvullen-met)
* [Achterstand](#achterstand)
* [Aflossen](#aflossen)
* [Betaaldag](#betaaldag)
* [Betaaldatum](#betaaldatum)
* [Betaalmiddelen](#betaalmiddelen)
* [Betaalmethode](#betaalmethode)
* [Budget](#budget)
* [Budgethorizon](#budgethorizon)
* [Buffer](#buffer)
* [Leefgeld](#leefgeld)
* [Periodebudget](#periodebudget)
* [Potjes voor nu](#potjes-voor-nu)
* [Potjes voor later](#potjes-voor-later)
* [Reserveringshorizon](#reserveringshorizon)
* [Reserveren](#reserveren)
* [Sparen](#sparen)
* [Vaste lasten](#vaste-lasten)
<!-- TOC -->

### Aanvullen TOT of aanvullen MET

* eigenschap van potjes
* voor [leefgeld](#leefgeld):
    * [aanvullen TOT](#aanvullen-tot-of-aanvullen-met) vult het potje aan tot het [budget](#budget) bedrag, op basis van de reserve aan het begin van de periode;
    * [aanvullen MET](#aanvullen-tot-of-aanvullen-met) vult het potje aan met het [budget](#budget) bedrag, ongeacht de reserve aan het begin van de periode; het biedt daarmee de mogelijkheid geld over periodes heen over te dragen;
* voor [vaste lasten](#vaste-lasten)/[aflossing](#aflossen): worden altijd aangevuld TOT (dus kan niet worden geconfigureerd)
* voor [sparen](#sparen): in 1ste instantie aangevuld MET; als er een doelbedrag is gesteld en het doelbedrag is (bijna) bereikt wordt het aangevuld TOT dat doelbedrag;

### Achterstand

* een [vaste last](#vaste-lasten) of [aflossing](#aflossen) die betaald had moeten zijn maar dat nog niet is; [achterstand](#achterstand) wordt overgeheveld naar de volgende periode

### Aflossen

* een [vaste last](#vaste-lasten) die een schuld vermindert

### Betaaldag

* de laatste dag in de maand dat de betaling mag worden gedaan

### Betaaldatum

* [betaaldag](#betaaldag) in een periode; als de [betaaldag](#betaaldag) > aantal dagen in de periode maand wordt de laatste dag van de maand de [betaaldatum](#betaaldatum)

### Betaalmiddelen

* bankrekeningen (zowel spaar- als betaalrekeningen), creditcards, contant geld

### Betaalmethode

* het [betaalmiddel](#betaalmiddelen) waarmee een potje kan worden gevuld (inkomen) of van waaruit van een potje kan worden betaald (uitgave); vooral bedoeld om de UI eenvoudiger te maken

### Budget

* eigenschap van elk potje, voor spaarpotje eventueel ‘wat over is einde periode’ waarbij de gebruiker zelf kan bepalen wat er ‘over’ is
* voor [leefgeld](#leefgeld): de begrenzing van de besteding per periode
* voor [vaste lasten](#vaste-lasten)/[aflossing](#aflossen): het bedrag dat wordt afgeschreven, als er wordt afgeschreven; m.a.w.: als er elke 3 maanden € 90 wordt afgeschreven is het [budget](#budget) € 90 ondanks dat er maandelijks maar € 30 opzij wordt gezet; zie ook [periodebudget](#periodebudget)
* voor [sparen](#sparen): het bedrag dat maandelijks opzij wordt gezet; als er een doelbedrag met een doeldatum is gesteld wordt de gebruiker gewaarschuwd als met het [budget](#budget) het doelbedrag op de doeldatum niet wordt gehaald

### Budgethorizon

* datum tot wanneer de potjes zouden kunnen worden gevuld, dus altijd ná de [reserveringshorizon](#reserveringshorizon) en eventueel in een volgende periode

### Buffer

* geld waarover de gebruiker beschikt en dat niet is toegewezen aan een (spaar)potje; tevens vormt het een [buffer](#buffer) voor onvoorziene uitgaven

### Leefgeld

* geld dat je kortcyclisch (dagelijks of wekelijks) nodig hebt voor je variabele kosten

### Periodebudget

* als een [vaste lasten](#vaste-lasten) - of [aflossing](#aflossen) potje niet elke maand wordt gebruikt wordt de reservering geconverteerd naar een [periodebudget](#periodebudget), zodanig dat dit het maximum is van:
    * het jaarbedrag / 12
    * het bedrag zodanig dat er voor de eerstvolgende betaling voldoende is  
      *(benodigd – huidige reserve) / aantal maanden (incl de huidige maand) nog te gaan*

### Potjes voor nu

* [Leefgeld](#leefgeld), [vaste lasten](#vaste-lasten) en [Aflossing](#aflossen)

### Potjes voor later

* Spaarpotjes, dus potjes om te sparen

### Reserveringshorizon

* datum tot wanneer de potjes zijn gevuld
* in de app wordt de [reserveringshorizon](#reserveringshorizon) opgeslagen bij de betalingen die de reserveringen boeken;

### Reserveren

* het oormerken (= aan potjes toewijzen) van geld
* waarover je NU kan beschikken,
* met als doel dat, wanneer je het nodig hebt, je er nog steeds over beschikt

### Sparen

* het opzij zetten van een deel van je geld, met als doel het later gebruiken voor toekomstige uitgaven of onverwachte situaties, zodat er een financiële [buffer](#buffer) ontstaat.
* [Sparen](#sparen) kán een [budget](#budget) bedrag (je kunt ook gewoon wat 'over' is apart zetten)
* [Sparen](#sparen) kán een doel hebben (met een doeldatum en een doelbedrag)

### Vaste lasten

* kosten waarvan je weet wanneer ze gaan komen en (binnen grenzen) hoeveel het zal zijn, en die samenhangen met een verplichting die je bent aangegaan
* [vaste lasten](#vaste-lasten) kunnen eenmalige zijn, of (per 1, 2, 3, 4, 6 of 12 maanden) terugkerende kosten zijn
* [vaste lasten](#vaste-lasten) hebben een [betaaldag](#betaaldag): als een vaste last had moeten zijn afgeschreven, en dat nog niet is, ontstaat een [achterstand](#achterstand)
* [vaste lasten](#vaste-lasten) kunnen alleen in specifieke maanden worden afgeschreven (bijvoorbeeld GBLT wordt NIET in juni en juli afgeschreven)
* [vaste lasten](#vaste-lasten) kunnen variëren (bijvoorbeeld een telefoonabonnement)