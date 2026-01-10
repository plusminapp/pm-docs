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
* voor leefgeld:
    * <u>aanvullen TOT</u> vult het potje aan tot het <u>budget</u> bedrag, op basis van de reserve aan het begin van de periode;
    * <u>aanvullen MET</u> vult het potje aan met het <u>budget</u> bedrag, ongeacht de reserve aan het begin van de periode; het biedt daarmee de mogelijkheid geld over periodes heen over te dragen;
* voor vaste lasten/aflossing: worden altijd aangevuld TOT (dus kan niet worden geconfigureerd)
* voor sparen: in 1ste instantie aangevuld MET; als er een doelbedrag is gesteld en het doelbedrag is (bijna) bereikt wordt het aangevuld TOT dat doelbedrag;

### Achterstand

* een <u>vaste last</u> of <u>aflossing</u> die <u>betaald</u> had moeten zijn maar dat nog niet is; <u>achterstand</u> wordt overgeheveld naar de volgende periode

### Aflossen

* een <u>vaste lasten</u> die een schuld vermindert

### Betaaldag

* de laatste dag in de maand dat de <u>betaling</u> mag worden gedaan

### Betaaldatum

* <u>betaaldag</u> in een periode; als de <u>betaaldag</u> > aantal dagen in de periode maand wordt de laatste dag van de maand de <u>betaaldatum</u>

### Betaalmiddelen

* <u>bankrekeningen</u> (zowel spaar- als betaalrekeningen), creditcards, contant geld

### Betaalmethode

* het <u>betaalmiddel</u> waarmee een potje kan worden gevuld (inkomen) of van waaruit van een potje kan worden betaald (uitgave); vooral bedoeld om de UI eenvoudiger te maken

### Budget

* eigenschap van elk potje, voor spaarpotje eventueel ‘wat over is einde periode’ waarbij de gebruiker zelf kan bepalen wat er ‘over’ is
* voor leefgeld: de begrenzing van de besteding per periode
* voor <u>vaste lasten</u>/aflossing: het bedrag dat wordt afgeschreven, als er wordt afgeschreven; m.a.w.: als er elke 3 maanden € 90 wordt afgeschreven is het <u>budget</u> € 90 ondanks dat er maandelijks maar € 30 opzij wordt gezet; zie ook <u>periodebudget</u>
* voor sparen: het bedrag dat maandelijks opzij wordt gezet; als er een doelbedrag met een doeldatum is gesteld wordt de gebruiker gewaarschuwd als met het <u>budget</u> het doelbedrag op de doeldatum niet wordt gehaald

### Budgethorizon

* datum tot wanneer de potjes zouden kunnen worden gevuld, dus altijd ná de <u>reserveringshorizon</u> en eventueel in een volgende periode

### Buffer

* geld waarover de gebruiker beschikt en dat niet is toegewezen aan een (spaar)<u>potje</u>; tevens vormt het een <u>buffer</u> voor onvoorziene uitgaven

### Leefgeld

* geld dat je kortcyclisch (dagelijks of wekelijks) nodig hebt voor je variabele kosten

### Periodebudget

* als een <u>vaste lasten</u> - of <u>aflossing</u> <u>potje</u> niet elke maand wordt gebruikt wordt de reservering geconverteerd naar een <u>periodebudget</u>, zodanig dat dit het maximum is van:
    * het jaarbedrag / 12
    * het bedrag zodanig dat er voor de eerstvolgende betaling voldoende is  
      *(benodigd – huidige reserve) / aantal maanden (incl de huidige maand) nog te gaan*

### Potjes voor nu

* <u>Leefgeld</u>, <u>vaste lasten</u> en Aflossing

### Potjes voor later

* Spaar<u>potjes</u>, dus <u>potjes</u> om te sparen

### Reserveringshorizon

* datum tot wanneer de <u>potjes</u> zijn gevuld
* in de app wordt de <u>reserveringshorizon</u> opgeslagen bij de betalingen die de reserveringen boeken;

### Reserveren

* het oormerken (= aan <u>potjes</u> toewijzen) van geld
* waarover je NU kan beschikken,
* met als doel dat, wanneer je het nodig hebt, je er nog steeds over beschikt

### Sparen

* het opzij zetten van een deel van je geld, met als doel het later gebruiken voor toekomstige uitgaven of onverwachte situaties, zodat er een financiële <u>buffer</u> ontstaat.
* <u>Sparen</u> kán een <u>budget</u> bedrag (je kunt ook gewoon wat ‘over’ is apart zetten)
* <u>Sparen</u> kán een doel hebben (met een doeldatum en een doelbedrag)

### Vaste lasten

* kosten waarvan je weet wanneer ze gaan komen en (binnen grenzen) hoeveel het zal zijn, en die samenhangen met een verplichting die je bent aangegaan
* <u>vaste lasten</u> kunnen eenmalige zijn, of (per 1, 2, 3, 4, 6 of 12 maanden) terugkerende kosten zijn
* <u>vaste lasten</u> hebben een <u>betaaldag</u>: als een <u>vaste last</u> had moeten zijn afgeschreven, en dat nog niet is, ontstaat een <u>achterstand</u>
* <u>vaste lasten</u> kunnen alleen in specifieke maanden worden afgeschreven (bijvoorbeeld GBLT wordt NIET in juni en juli afgeschreven)
* <u>vaste lasten</u> kunnen variëren (bijvoorbeeld een telefoonabonnement)