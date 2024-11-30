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
        Creditcard schuld
        Betaalregelingen
        Reserveringen

Resultatenrekeningen (Categorie&euml;n)

    Inkomsten:
        Salaris, uitkering
    Uitgaven:
        Boodschappen
        Vaste lasten
        Andere uitgaven

De gebruiker merkt hier, als het goed is, niets van: in elke boeking worden zowel de debet als credit zijde in
&eacute;&eacute;n keer, deels impliciet, opgenomen.

- het grootste deel van de boekingen gaat tussen een Categorie (Resultatenrekening dus) en een Rekening
  (Balansrekening). De naam van de boeking is dan de Categorie waarbij ook de betaalmethode (Betaalrekening, Contant
  geld of
  Creditcard) wordt aangegeven, met een configureerbare standaard waarde voor de rekening.
- bij een aantal boekingen verschuift geld tussen balansrekeningen, en hebben ze een eigen naam:
    - Aflossing betaalregeling: van Betaalrekening naar Betaalregeling, het rente- en kostendeel naar Anders (TODO hoe
      houden we dat eenvoudig ...)
    - Aflossen creditcard: van Betaalrekening naar Creditcard, voor de rente van Betaalrekening naar Anders
    - Besteding reservering: van Betaalrekening naar Reservering
    - Opname spaargeld: van Spaarrekening naar Betaalrekening
    - Storten spaargeld: van Betaalrekening naar Spaarrekening
    - Opname contant geld: van Betaalrekening naar Contant geld
- het opbouwen van reserveringen gebeurt 'automagisch' op basis van de startdatum of het huidige saldo, de einddatum en
  het gewenste eindbedrag (zie [Reserveren](#reserveren))
- boekingen tussen resultaatrekeningen worden niet ondersteund; meestal zijn dat correctieboekingen die in de context
  van PlusMin niet relevant zijn.

TODO: is er meer??? en TODO: hoe noemen we de dingen ...

Een belangrijk voordeel van de boekhoudkundige aanpak is de eenvoud waarmee periodiek een balanstotaal kan worden
berekend, wat een goede maat is voor de financi&euml;le gezondheid. Door deze periodieke meting in de tijd uit te zetten
is de voortgang helder inzichtelijk en kan een schatting worden gedaan wanneer een doel (bijvoorbeeld schuldenvrij of
een buffer van een bepaalde hoogte) kan worden bereikt.

Een ander voordeel van de gehanteerde methode is dat alle bedragen (m.u.v. een paar heel uitzonderlijke gevallen) als
positieve getallen kunnen worden ingevoerd: de app bepaald waar het bij en waar het af moet worden gehaald.
Uitzonderingen zijn negatieve uitgaven (bijvoorbeeld een pakketje dat retour wordt gestuurd en waarvoor geld wordt
ontvangen). Dit kan als een negatieve betaling worden geboekt, maar ook als het als inkomsten wordt geboekt gaat het, zolang
het uitzondering en niet regel is, niet in een keer helemaal mis.

#### Namen

Bij een betaling moet de gebruiker een 'naam' aangeven (zie de [Inleiding](#inleiding)) en heeft zij/hij de keuze uit:

- Inkomsten
- Boodschappen
- Vaste lasten
- Andere uitgave
- Aflossing betaalregeling
- Aflossen creditcard
- Besteding reservering
- Opname spaargeld
- Storten spaargeld
- Opname contant geld

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

## Verwerking betalingen

#### Betalingen Model

De informatie die bij een betaling wordt gevraagd is:

- de naam van de betaling (zie [Name](#namen)); bij een Categorie boeking de rekening waar het wordt af/bijgeschreven
- bedrag, bij aflossing 2 bedragen (aflossing en rente/kosten; alternatief: afgeloste bedrag en nieuwe saldo van de
  betaalregeling?)
- datum en omschrijving

De stand van de balansrekeningen op de laatste boekingsdatum kan worden gebruikt om te controleren of alle betaling
correct zijn verwerkt.

Als de betalingen van de bank via een camt053 bestand worden ingelezen worden in dat geval ook de volgende
velden bewaard (als extra ondersteuning bij het, eventueel geautomatiseerd, toewijzen van de Categorie):

- referentie, tegenrekening, naam_tegenrekening, betalingskenmerk, omschrijving_bank en status

Ten slotte wordt, omdat het systeem de betalingen van meerdere gebruikers vastlegd, bij de betaling ook de
betreffende hulpvrager opgeslagen.

#### Views

PlusMin biedt de mogelijkheid om te kiezen op welke manier je de INKOMSTEN/UITGAVEN kunt bekijken.

| view naam             | visualisatie                             | velden                                                  |
|-----------------------|------------------------------------------|---------------------------------------------------------|
| &lt;per categorie&gt; | chronologisch overzicht van de categorie | header: totaal<br/>per regel: datum/bedrag/omschrijving |
| &lt;per rekening&gt;  | chronologisch overzicht van de rekening  | header: totaal<br/>per regel: datum/bedrag/omschrijving |

Zo kan ook, als voorbeeld, een view als onderstaande spreadsheet worden opgebouwd:
![](./img/excel.png)

De gebruiker kan meerdere views naast elkaar openen om het overzicht te vergroten.

## Budgetteren

Bij het inrichten van PlusMin moet per **categorie** een budget worden vastgelegd. Hierbij kan het Nibud worden gebruikt
voor referentie getallen. Een categorie kan worden opgebouwd uit meerdere budgetten (Vaste lasten = huur +
gas/licht/water + verzekeringen + gemeente belastingen + ...).

Van een budget kan worden aangegeven wanneer, inclusief een frequentie, en met welke bedrag het wordt uitgegeven; een
'continu'e uitgave wordt geleidelijk uitgegeven (bijvoorbeeld boodschappen), van een 'voorspelbare' uitgave heeft een
periode (bijvoorbeeld per week, maand of trimester) en een moment in die periode.

Enkele voorbeelden (zonder de bedragen):

- huur (vaste lasten): elke maand, 1x per maand, op de 1ste
- gas/elektra (vaste lasten): elke maand, 1x per maand, op de 4de
- boodschappen (boodschappen): continu
- koffie/taart met de fietsclub (anders): elke week op zondag
- aflossing betaalregeling1 (aflossing): elke maand op de 2de vrijdag van de maand

Naast het bugetteren per Categorie zijn ook het aflossingsschema van de betaalregelingen en de reserveringen bepalend.

(TODO nog verder uitwerken)

## Reserveren

Een reservering is een geoormerkt bedrag dat nodig is om aan een toekomstige verplichting (verzekeringspremie die
jaarlijks wordt betaald) of spaardoel (een nieuwe wasmachine) te voldoen.

Een reservering wordt bepaald door:

- de Categorie en een nadere omschrijving/naam
- een startdatum (saldo = 0) of een saldo op een datum
- een einddatum
- een eindbedrag

PlusMin berekent per reservering het benodigde bedrag, lineair, om op de einddatum voldoende te hebben gespaard. Hierbij
wordt een referentiedatum genomen, meestal het eind van de huidige inkomstenperiode.

Een repeterende reservering (voorbeeld: verzekeringspremie elke 6 maandan) wordt automatisch opnieuw aangemaakt als de
einddatum is bereikt en het eindbedrag is opgenomen.

## Aflossen

Per betaalregeling (schuld):

- de periode waarmee wordt afgelost, en wanneer in die periode (zie toelichting bij [Budgetteren](#budgetteren))
- het saldo op de startdatum
- het bedrag
- de berekening van de rente/kosten

TODO: verder uitwerken

## Stand

De stand van zaken gevisualiseerd: een grafische weergave van

- het balanstotaal uitgezet in de tijd
- de reserveringen met inzicht in de mate waarin het zal worden gehaald
- de afbetalingsregelingen met inzicht in de looptijd

TODO: verder uitwerken

## Afsluiten van een periode

PlusMin gaat ervan uit dat periodiek de vrijwilliger en hulpvrager samen zitten om de voortgang te bekijken en
bespreken, en om een nieuwe periode te openen.

- er wordt een balans opgemaakt en bewaard
- de resultaatrekeningen worden geschoond (de informatie wordt verwijderd om het afbreuk risico te beperken)

TODO: verder uitwerken

## Signalen

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

TODO: visualisatie van de uitputting van het budget

#### Individuele signalen

Naast de verwachte uitputting van het budget in het totaal zijn er ook signalen op individuele budgetten:

- een 'continu' budget dat proportioneel al meer heeft uitgegeven dan de verstreken periode doet verwachten (te veel
  uitgegeven aan boodschappen)
- een 'voorspelbare' uitgave die nog niet is uitgegeven terwijl dat niet overeenkomt met de verwachting (de huur is op
  de 3de nog niet afgeschreven)

TODO: visualisatie van individuele signalen

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
- de betaalmogelijkheden (betaalrekening, spaarrekening, contant, creditcard) en de standaard rekening per categorie
- standaard inkomsten/uitgaven view(s)
- een aantal functionele toggles:
    - wel of geen signalen
    - ??? TODO
