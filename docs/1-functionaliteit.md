# Funtionele beschrijving

## Boekhoudkundige basis

#### Inleiding

PlusMin is gebaseerd op het [dubbel boekhouden](https://nl.wikipedia.org/wiki/Dubbel_boekhouden) waarbij elke betaling
op zijn minst op twee verschillende manieren wordt geadministreerd, en waarbij elke boeking in evenwicht moet zijn.
Hierbij worden de rekeningen opgesplitst in balansrekeningen en resultatenrekeningen.

Balansrekeningen (Rekeningen)

    Bezittingen:
        Betaalrekening
        Spaarrekening
        Contant geld
    Schulden:
        Creditcard (schuld)
        Betaalregelingen
        Reserveringen

Resultatenrekeningen (Categorie&euml;n)

    Inkomsten:
        (Salaris, uitkering, ...)
    Uitgaven:
        Boodschappen
        Vaste lasten
        Andere uitgaven

In PlusMin merkt de gebruiker hier niets van: in elke geregistreerde betaling worden zowel de debet als credit zijde in
&eacute;&eacute;n keer opgenomen: de dubbele boeking lijkt daardoor een enkelvoudige boeking. PlusMin onderscheidt 10
betalingssoorten, waarbij zowel de debet als credit zijde van de boeking worden bepaald. Het bedrag kan daardoor
altijd als positief getal worden opgegeven.

De 10 betalingssoorten met de debet en credit rekening:

| BetalingsSoort          | Debet           | Credit           |
|-------------------------|-----------------|------------------|
| Inkomsten               | Inkomsten       | _Betaalmethode_  |
| Boodschappen            | _Betaalmethode_ | Boodschappen     |
| Vaste lasten            | _Betaalmethode_ | Vaste lasten     |
| Andere uitgave          | _Betaalmethode_ | Andere uitgave   |
| Aflossen betaalregeling | _Betaalmethode_ | Betaalregelingen |
| Aflossen creditcard     | Betaalrekening  | Creditcard       |
| Besteding reservering   | _Betaalmethode_ | Reservering      |
| Opname spaargeld        | Spaarrekening   | Betaalrekening   |
| Storten spaargeld       | Betaalrekening  | Spaarrekening    |
| Opname contant geld     | Betaalrekening  | Contant geld     |

Daar waar '_Betaalmethode_' wordt gebruikt moet de gebruiker kiezen tussen Betaalrekening, Creditcard of Contant geld.

Onderstaand diagram geeft deze 10 betalingssoorten schematisch weer, waarbij de pijl van debet naar credit wijst.

![](./img/PM-betalingssoort-schema.png)

PlusMin staat toe voor elke rekening meerdere varianten te configureren. Als er meerdere varianten van een rekening
zijn, moet de gebruiker de betreffende variant kiezen. Hierdoor wordt de gebruikersinteractie complexer. Er moet hier
daarom terughoudend mee worden omgegaan.

#### Eenvoud versus juistheid

Bij PlusMin gaat eenvoud boven juistheid. De administratie is voor de hulpvrager, hoeft geen accountantscontrole te
ondergaan en is niet bedoeld voor de belastingdienst. Het moet de hulpvrager inzicht geven in geldstromen om zo meer
grip te krijgen op haar/zijn financi&euml;n. Als er aan het eind van de maand minder in kas is dan volgens de
administratie zou moeten is dat jammer, maar geen wezenlijk probleem. Dat laat overigens onverlet dat het wel een
gespreksonderwerp kan zijn tussen de vrijwilliger en de hulpvrager.

Op basis van deze prioriteit is gekozen om aflossing altijd in 1 boeking te doen. Bij aflossen wordt (soms) een deel van
geld besteed aan rente/kosten en een deel aan het verminderen van schuld; dit zou moeten leiden tot 2 boekingen in de
administratie. Terwille van de eenvoud wordt de fout die dat gevolg heeft geaccepteerd. Zie [aflossen](#aflossen).

De boekhoudkundige verwerking van reserveringen worden automagisch opgebouwd op basis van het defini&euml;ren van
een [Reservering](#reserveren). Ook een betaalregeling of [betaalachterstand](#aflossen) wordt apart opgevoerd. De stand
van beide rekeningen moet in een openingsbalans, tijdens de initi&euml;le configuratie, worden opgevoerd.

Een belangrijk voordeel van de boekhoudkundige aanpak is de eenvoud waarmee periodiek een balanstotaal kan worden
berekend, wat een goede maat is voor de financi&euml;le gezondheid. Door deze periodieke meting in de tijd uit te zetten
is de voortgang helder inzichtelijk en kan een schatting worden gedaan wanneer een doel (bijvoorbeeld schuldenvrij of
een buffer van een bepaalde hoogte) kan worden bereikt.

Een ander voordeel van de gehanteerde methode is dat alle bedragen (m.u.v. een paar heel uitzonderlijke gevallen) als
positieve getallen kunnen worden ingevoerd: de app bepaald waar het bij en waar het af moet worden gehaald.
Uitzonderingen zijn negatieve uitgaven (bijvoorbeeld een pakketje dat retour wordt gestuurd en waarvoor geld wordt
ontvangen). Dit kan als een negatieve betaling worden geboekt, maar ook als het als inkomsten wordt geboekt gaat het,
zolang het uitzondering en niet regel is, niet in een keer helemaal mis.

TODO: is dit B1 taalgebruik? of andersom: hoe maken we hier B1 taal van? Volgens ChatGPT:

- Inkomsten
- Boodschappen
- Vaste lasten
- Andere uitgave
- Betaling van een afgesproken bedrag
- Betalen van je creditcardschuld
- Geld gebruiken dat je apart hebt gezet
- Geld van je spaarrekening halen
- Geld op je spaarrekening zetten
- Opname contant geld

## Groeimodel

Zoals in de beschrijving van de [motivatietheorie](index.md#motivatietheorie) is aangegeven, moet de administratie
mee kunnen groeien met de hulpvrager. In de app worden de volgende niveaus onderscheiden:

- basis niveau: verwerken van betalingen, periodeafsluitingen en weergave van de stand
- niveau 1: aflossen
- niveau 1: budgetteren/reserveren
- niveau 2: signaleren

![Groeimodel](./img/PM-groeimodel.png)

## Verwerking betalingen

#### Betalingen Model

De informatie die bij een betaling wordt gevraagd is:

- de betalingssoort
- bij een betalingssoort met een betaalmethode: de betaalmethode (Betaalrekening, Creditcard of Contant geld)
- een rekening met meerdere varianten (bijvoorbeeld 2 betaalregelingen): de variant van de rekening
- datum
- omschrijving
- bedrag

De [stand](#stand) van de balansrekeningen op de laatste boekingsdatum kan worden gebruikt om te controleren of alle
betaling correct zijn verwerkt. Met de stand op de resultaatrekeningen kan worden getoetst of de budgetten toereikend
zijn.

Als de betalingen van de bank via een camt053 bestand worden ingelezen worden in dat geval ook de volgende
velden bewaard (als extra ondersteuning bij het, eventueel geautomatiseerd, toewijzen van de Categorie):

- referentie, tegenrekening, naam_tegenrekening, betalingskenmerk, omschrijving_bank en status

Ten slotte wordt, omdat het systeem de betalingen van meerdere gebruikers vastlegd, bij de betaling ook de
betreffende hulpvrager opgeslagen.

#### Views

PlusMin biedt de mogelijkheid om te kiezen op welke manier je de transacties kunt bekijken.

| view naam             | visualisatie                             | velden                                                                               | opmerking                                                                            |
|-----------------------|------------------------------------------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| dagboek               | chronologisch overzicht alle boekingen   | header: ???<br/>per regel: datum/omschrijving/bedrag/betalingssoort/betaald met      | "betalingssoort" en 'betaald met' als iconen                                         |
| bankboek              | chronologisch overzicht alle boekingen   | header: totaal<br/>per regel: datum/omschrijving/bedrag/betalingssoort/betaalmethode | betalingssoort/betaalmethode als iconen<br/>verbijzondering van &lt;per rekening&gt; |
| &lt;per categorie&gt; | chronologisch overzicht van de categorie | header: totaal<br/>per regel: datum/omschrijving/bedrag                              |                                                                                      |
| &lt;per rekening&gt;  | chronologisch overzicht van de rekening  | header: totaal<br/>per regel: datum/omschrijving/bedrag                              |                                                                                      |

Zo kan ook, als voorbeeld, een view als onderstaande spreadsheet (als voorlopig onderdeel van het ecosysteem) worden
opgebouwd:

![](./img/PM-excel.png)

De gebruiker kan meerdere views naast elkaar openen om het overzicht te vergroten.

## Budgetteren

Een budget is een geoormerkte uitgave binnen 1 inkomsten cyclus waarvoor een bedrag wordt gereserveerd. Voor alle
rekeningen, met uitzondering van de bezittingen, kan een budget wordt opgesteld. Deze rekeningen worden de
budgetrekeningen genoemd:

- Creditcard (schuld)
- Betaalregelingen
- Reserveringen
- Inkomsten
- Boodschappen
- Vaste lasten
- Andere uitgaven

Bij het inrichten van PlusMin kan per budgetrekening een budget worden vastgelegd. Hierbij kan het Nibud worden gebruikt
voor referentie getallen. Een budget kan worden opgebouwd uit meerdere deelbudgetten (Vaste lasten = huur +
gas/licht/water + verzekeringen + gemeente belastingen + ...).

Van een budget wordt aangegeven wanneer, inclusief een frequentie, en met welke bedrag het wordt uitgegeven; een
'continu'e uitgave wordt geleidelijk uitgegeven (bijvoorbeeld boodschappen), van een 'voorspelbare' uitgave heeft een
periode (bijvoorbeeld per week, maand of trimester) en een moment in die periode.

Enkele voorbeelden (zonder de bedragen):

- huur (vaste lasten): elke maand, 1x per maand, op de 1ste
- gas/elektra (vaste lasten): elke maand, 1x per maand, op de 4de
- boodschappen (boodschappen): continu
- koffie/taart met de fietsclub (anders): elke week op zondag
- aflossing betaalregeling1 (aflossing): elke maand op de 2de vrijdag van de maand

Naast budgetten zijn ook het [aflossingsschema](#aflossen) van de betaalregelingen en de [reserveringen](#reserveren)
bepalend voor de beschikbare financi&euml;le ruimte per periode.

(TODO nog verder uitwerken)

## Reserveren

Een reservering is een geoormerkt bedrag dat nodig is om aan een toekomstige (het overstijgt een inkomsten cyclus)
verplichting te voldoen. Voorbeelden: een verzekeringspremie die jaarlijks wordt betaald of een spaardoel, bijvoorbeeld
een nieuwe wasmachine. Het is een bewuste, expliciete beperking van de bestedingsruimte.

Het verschil tussen een budget en een reservering is de periode die het bestrijkt: zodra het de inkomstenperiode
overstijgt is het een reservering en wordt er, periodiek, automatisch een bedrag op de Reserveringen rekening geboekt.

PlusMin berekent per reservering het benodigde bedrag, lineair, om op de einddatum voldoende te hebben gespaard. Hierbij
wordt een referentiedatum genomen, meestal het eind van de huidige inkomstenperiode. Een repeterende reservering
(voorbeeld: verzekeringspremie elke 6 maanden) wordt automatisch opnieuw aangemaakt als de einddatum is bereikt en het
eindbedrag is opgenomen.

In het kader van de financiële educatie is het aan te raden de reservering op de spaarrekening te laten storten; de
besteedbare ruimte is dan beschikbaar op de betaalrekening. Voor de hulpvrager zijn de spaarrekening en de reservering
dan synoniem geworden. Als er op de spaarrekening onvoldoende geld staat voor de reserveringen leidt dat daarom tot een
[signaal](#signaleren).

Een reservering wordt bij de configuratie opgevoerd:

- de uitgave Resultaatrekening
- een nadere omschrijving/naam
- een startdatum (saldo = 0) of een saldo op een datum
- een einddatum
- een eindbedrag

## Aflossen

Aflossen is het afbetalen van een schuld. Bij aflossen wordt een deel van geld besteed aan rente/kosten en een deel aan
het verminderen van schuld. Dit maakt aflossen inherent ingewikkeld. De vrijwilliger moet hier goed over worden
ge&iuml;nstrueerd en voor de hulpvrager moet het glashelder zijn wat er van haar hem wordt verwacht.

Bij een creditcard worden de kosten/rente aan de schuld van de card toegevoegd; deze toevoeging aan de schuld moet
worden geboekt als een boeking van 'Creditcard' naar 'Andere uitgave'; hiermee wordt de schuld op de creditcard
automatisch opgehoogd en gaat dat dus goed.

Bij betaalregelingen wordt vaak een bedrag per maand afgesproken. De rente kan in de loop van de tijd wisselen en de
rente en kosten zijn niet altijd transparant. De looptijd van de afbetaling is dan niet op voorhand precies te bepalen.
PlusMin kiest ervoor deze complexiteit (in het kader van eenvoud boven juistheid) plat te slaan: de afbetaling moet
worden geconfigureerd als 'benadering'; het afbetaalde bedrag wordt volledig in mindering gebracht op de schuld. Bij de
restschuld wordt aangegeven dat dit een 'benadering' is die periodiek moet wordt gecorrigeerd op basis van informatie
van de schuldeiser.

Indien het binnen de competentie van de hulpvrager past kan er altijd voor worden gekozen de aflossing uit te splitsen
in 2 boekingen: de aflossing als 'aflossen betaalregeling' de rente/kosten als 'andere uitgave'; de som van de boekingen
is dan het overgemaakte bedrag. Bij een annu&iuml;teit moet er rekening worden gehouden dat de rente en de kosten in de
loop van de tijd wijzigen. Het is altijd aan te raden bij de schuldeiser na te gaan of de PlusMin app nog klopt.

Per betaalregeling (en een creditcard?) met openstaande schuld wordt bij de configuratie opgevoerd:

- de periode waarmee wordt afgelost, en wanneer in die periode (zie toelichting bij [Budgetteren](#budgetteren))
- het saldo op de startdatum
- het bedrag
- 'precies' of 'benadering'

Bij een betaalregeling wordt bovendien opgenomen:

- een omschrijving
- aanvullende informatie zoals dossiernummers bij betrokken instanties en telefoonnummers van contactpersonen

TODO: betaalregeling is eigenlijk niet het juiste woord want het kan ook over een 'gewone' schuld gaan waar geen
expliciete betaalregeling is afgesproken

## Stand

De stand van zaken gevisualiseerd: een grafische weergave van

- de saldi van de balansrekeningen; reserveringen en betaalregelingen uitgesplitst
- het balanstotaal uitgezet in de tijd
- de reserveringen met inzicht in de mate waarin het zal worden gehaald
- de afbetalingsregelingen met inzicht in de resterende looptijd
- de uitputting van Boodschappen, Vaste lasten en Andere uitgaven ten opzichte de te verwachten uitputting ervan

TODO: nog iets anders?

## Afsluiten van een periode

PlusMin gaat ervan uit dat periodiek de vrijwilliger en hulpvrager samen zitten om de voortgang te bekijken en
bespreken, en om een nieuwe periode te openen.

- er wordt een balans opgemaakt en bewaard; dit wordt gebruikt voor de [stand](#stand)
- er wordt een nieuwe openingsbalans opgemaakt, op basis van de eindbalans van de vorige periode; de balans kan dus
  afwijken
- de resultaatrekeningen worden geschoond (de informatie wordt verwijderd om het afbreuk risico bij een hack te
  beperken; de informatie blijft grotendeels in de bank- en creditcard apps beschikbaar)
- de ruimte van de budgetten wordt besproken en eventueel gewijzigd
- de voortgang op reserveringen en aflossingen wordt besproken en eventueel opnieuw ingedeeld (bijvoorbeeld: een
  reservering waarvan de einddatum wordt uitgesteld om een gemiste afbetaling op een schuld in te halen)

TODO: verder uitwerken

## Signaleren

#### Periodiciteit

Om goed te kunnen signaleren gaat PlusMin uit van een periodiciteit van de inkomsten, bijvoorbeeld elke maand of per 4
weken. Vooralsnog houdt PlusMin geen rekening met variabele inkomsten (ZZP-er) of meerdere inkomsten bronnen met een
verschillende periodiciteit. Er moet dan worden begroot met geschatte waarden en misschien moeten de signalen dan uit
worden gezet ...

#### Verwachte problemen met de uitputting van het budget

Om te bepalen of er voldoende is gespaard berekend PlusMin ook de ruimte op het moment van de berekening; hierbij wordt
het einde van de huidige inkomsten periode als uitgangspunt genomen. Alle nog te verwachten uitgaven in de resterende
periode worden berekend:

- continue uitgaven worden lineair afgeschreven om het verwachte restbedrag te berekenen
- voor periodieke betalingen wordt gecheckt of die al hebben plaatsgevonden (TODO hoe herkennen we die?); alle nog te
  verwachten periodieke uitgaven worden opgeteld
- de benodigde reserveringen voor de einddatum van de inkomstenperiode worden berekend

De som van deze 3 posten wordt vergeleken met de som van de saldi van de rekeningen; indien er op rekeningen 'rood' mag
worden gestaan kan de som van het rood staan eventueel ook worden getoond om acute cash problemen aan te zien komen.

Voor vaste lasten wordt periodiek een signaal afgegeven dat gecheckt moet worden of er een wijziging heeft
plaatsgevonden, bijvoorbeeld een jaar na de laatste wijziging.

## Gebruiker

#### Rollen en aanmaken gebruikers

Er zijn 3 rollen:

- co&ouml;rdinator
- vrijwilliger
- hulpvrager

De co&ouml;rdinator voert andere co&ouml;rdinatoren, vrijwilligers en hulpvragers op in Asgardeo. Hiermee kan een
gebruiker inloggen op de app. Als de gebruiker nog niet bestaat wordt deze automatisch aangemaakt, zonder profiel. De
gebruiker kan daarna zijn eigen profiel (m.u.v. de rollen) al aanpassen. Door het gebrek aan rol kan de nieuwe gebruiker
verder nog niets.

Voor andere co&ouml;rdinatoren en vrijwilligers wijst de co&ouml;rdinator ook de rollen toe. Voor hulpvragers is dit
optioneel: zodra een vrijwilliger een hulpvrager onder de hoede neemt wordt de hulpvrager rol automatisch toegewezen.

#### Profiel

Het profiel van de gebruiker omvat:

- het e-mailadres
- de bijnaam
- de rol(len)
- voor de hulpvrager de vrijwilliger die begeleidt
- voor de vrijwilliger de hulpvragers die zij/hij begeleidt
- de [reserveringen](#reserveren)
- de [betaalregelingen](#aflossen)
- de rekeningen (betaalrekening, spaarrekening, contant en/of creditcard)
- de standaard rekening per categorie
- standaard inkomsten/uitgaven view(s)
- een aantal functionele toggles:
    - wel of geen signalen
    - ??? TODO
