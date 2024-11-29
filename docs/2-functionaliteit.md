# Funtionele beschrijving

## Gebruiker

### Rollen en aanmaken gebruikers

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

### Profiel

Het profiel van de gebruiker omvat:

- het e-mailadres
- de bijnaam
- de rollen
- voor de hulpvrager de vrijwilliger die begeleidt
- voor de vrijwilliger de hulpvragers die zij/hij begeleidt
- de rekeningen (zie [Bron en bestemming](#bron-en-bestemming))
- een aantal functionele toggles:
    - wel of geen signalen
    - de standaard rekening per categorie (zie [Bron en bestemming](#bron-en-bestemming))
    - standaard inkomsten/uitgaven view(s)
    - ??? TODO

## Verwerking betalingen

### Betalingen Model

De zichtbare informatie die bij een betaling wordt vastgelegd is in zijn meest eenvoudige vorm:

- datum, bedrag, omschrijving en categorie (zie [Categorie&euml;n](#categorieen))
- de bron en de bestemming van de betaling (zie [Bron en bestemming](#bron-en-bestemming))
- de stand van de rekeningen/contant geldt op de laatste boekingsdatum

Als de betalingen van de bank via een camt053 bestand worden ingelezen worden in dat geval ook de volgende
velden bewaard (als extra ondersteuning bij het, eventueel geautomatiseerd, toewijzen van de categorie):

- referentie, tegenrekening, naam_tegenrekening, betalingskenmerk, omschrijving_bank en status

Ten slotte wordt, omdat het systeem de betalingen van meerdere gebruikers vastlegd, bij de betaling ook de
betreffende hulpvrager opgeslagen.

### Categorie&euml;n

PlusMin onderscheidt de volgende categorie&euml;n (de voorbeelden zijn niet uitputtend):

- **Inkomsten**: Salaris, uitkering, AOW, ...
- **Boodschappen**: Voedsel, schoonmaakmiddelen, ...
- **Vaste lasten**: Huur, hypotheek, gemeente belastingen, energie, water, verzekeringen, wegenbelasting, ...
- **Anders**: Kleding, variabele vervoerskosten, niet vergoede medische kosten, persoonlijke verzorging, cadeautjes,
  identiteitsbewijs, ...
- **Betaalregelingen**: Betalingen voor een betaalregeling
- **Reservering**: Storting op/opname van de spaarrekening

### Bron en bestemming

De app legt de bron (waarmee werd betaald?) en de bestemming (aan wie is betaald?) van de betaling vast:

|                    | Als bron                      | Als bestemming                               |
|--------------------|-------------------------------|----------------------------------------------|
| **Extern**         | bij inkomsten                 | bij betalingen                               |
| **Betaalrekening** | betaling met een pin of Ideal | bij inkomsten                                |
| **Spaarrekening**  | opname van spaargeld          | storting van spaargeld                       |
| **Creditcard**     | betaling met een creditcard   | afbetalen van de creditcard schuld           |
| **Contant geld**   | betaling met contant geld     | opname van contant geld uit een geldautomaat |
| **Betaalregeling** | nvt?                          | aflossing                                    |

### Bron en bestemming per categorie

Op basis van de categorie wordt bepaald wat de bron en wat de bestemming kan zijn:

| Categorie          | Standaard ontvangst (+)         | Standaard betaling (-)          | Bijzonderheden                     |
|--------------------|---------------------------------|---------------------------------|------------------------------------|
| Inkomsten          | Extern -> Betaalrekening*       | nvt                             |                                    |
| Boodschappen       | nvt                             | Betaalrekening* -> Extern       |                                    |
| Vaste lasten       | nvt                             | Betaalrekening* -> Extern       |                                    |
| Anders             | nvt                             | Betaalrekening* -> Extern       |                                    |
| Aflossing          | nvt                             | Betaalrekening* -> Extern       | welke betaalregeling werd afgelost |
| Opname/Reservering | Spaarrekening -> Betaalrekening | Betaalrekening -> Spaarrekening |                                    |
| Contant geld       | Contant geld -> Betaalrekening  | Betaalrekening -> Contant geld  |                                    |

\* Voor de categorie&euml;n Inkomsten, Boodschappen, Vaste lasten, Anders en Betalingsregelingen kan bij het
boeken ook gekozen worden voor Contant geld of Creditcard i.p.v. Betaalrekening. Hierbij is per categorie in te stellen
wat als standaard moet worden gehanteerd.

### Views

PlusMin biedt de mogelijkheid om te kiezen op welke manier je de 

### User experience

Het verwerken van betalingen (a.k.a. het bijhouden van het huishoudboekje) moet extreem eenvoudig zijn.

| Gebruikersactie                                                     | Systeem reactie                                                                                                                 |
|---------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| opent de app op de telefoon, logt in, <br/>opent INKOMSTEN/UITGAVEN | toont de standaard view voor de gebruiker                                                                                       |
| klikt op 'toevoegen betaling'                                       | opent de 'toevoegen betaling' dialoog<br/>datum staat default op vandaag, overige velden leeg                                   |
| klikt op de datum, kiest een andere datum                           |                                                                                                                                 |
| kiest categorie 'boodschappen'                                      | vult 'Betaalrekening -> Extern', alleen Betaalrekening is zichtbaar                                                             |
| vult bedrag in, als positieve waarde<br/>klikt op opslaan           | sluit de 'toevoegen betaling' dialoog; opent eventueel een nieuwe<br/>toont het nieuwe saldo van de betaalrekening bij de saldi |

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

(TODO nog verder uitwerken)

### Reserveren

Een reservering is een geoormerkt bedrag dat nodig is om aan een toekomstige verplichting (verzekeringspremie die
jaarlijks wordt betaald) of spaardoel (een nieuwe wasmachine) te voldoen.

Een reservering wordt bepaald door:

- een startdatum
- een einddatum
- een eindbedrag

PlusMin berekent per reservering het benodigde bedrag, lineair, om op de einddatum voldoende te hebben gespaard. Hierbij
wordt een referentiedatum genomen, meestal het eind van de huidige inkomstenperiode.

Een repeterende reservering wordt automatisch opnieuw aangemaakt als de einddatum is bereikt en het eindbedrag is
opgenomen.

## Signalen

### Periodiciteit

Om goed te kunnen signaleren gaat PlusMin uit van een periodiciteit van de inkomsten, bijvoorbeeld elke maand of per 4
weken. Vooralsnog houdt PlusMin geen rekening met variabele inkomsten (ZZP-er) of meerdere inkomsten bronnen met een
verschillende periodiciteit. Er moet dan worden begroot met geschatte waarden en misschien moeten de signalen dan uit
worden gezet ...

### Verwachte problemen met de uitputting van het budget

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

### Individuele signalen

Naast de verwachte uitputting van het budget in het totaal zijn er ook signalen op individuele budgetten:

- een 'continu' budget dat proportioneel al meer heeft uitgegeven dan de verstreken periode doet verwachten (te veel
  uitgegeven aan boodschappen)
- een 'voorspelbare' uitgave die nog niet is uitgegeven terwijl dat niet overeenkomt met de verwachting (de huur is op
  de 3de nog niet afgeschreven)

TODO: visualisatie van individuele signalen