# Beveiliging

## Belang
De gegevens die door de app worden beheerd zijn bijzonder privacy gevoelig. Goede beveiliging van de opgeslagen gegevens krijgt daarom veel aandacht. Onderstaand een overzicht van de genomen acties.

## Authenticatie
Voor de Authenticatie wordt gebruik gemaakt van een externe identity provider, op dit moment Asgardeo.io. De login volgt de OAuth 2.0/OpenID Connect flow. De gebruiker logt 'passwordless' in: met een 'passkey' of met een 'magic link'. De `PlusMin` app slaat geen wachtwoorden op: op basis van het ID-token dat de IDP verstrekt leidt de app het e-mailadres, en daardoor de identiteit, van de gebruiker af. 

## Autorisatie
De autorisatie is gebaseerd op 4 rollen, waarbij een gebruiker meerdere rollen tegelijkertijd kan hebben:

1. elke rol, en met name de **hulpvrager**, heeft toegang tot de eigen gegevens; voor niet-hulpvragers is dit bedoeld om eenvoudig te kunnen experimenteren en testen;
2. de **vrijwilliger** (a.k.a. het administratiemaatje) heeft toegang tot de gegevens van de hulpvragers die zij/hij begeleidt; een hulpvrager is aan maximaal 1 vrijwilliger gekoppeld; een vrijwilliger kan een onbeperkt aantal hulpvragers begeleiden;
3. de **co&ouml;rdinator** koppelt vrijwilligers aan hulpvragers en heeft alleen toegang tot de gegevens die daar voor nodig zijn;
4. de **administrator** heeft technisch toegang tot de app; de toegang zal zoveel mogelijk worden beperkt (TODO).

Van alle rollen wordt in een auditlog bijgehouden om achteraf te kunnen beoordelen wie toegang heeft gehad tot welke gegevens.

## Gebruikte componenten
De App is opgebouwd uit 3 lagen:

- een React frontend die in de browser wordt geladen en de gebruikers interface verzorgd; de frontend bevat alleen informatie van de hulpvrager die op dat moment actief is; bij wisselen van hulpvrager (door de vrijwilliger) worden alle gegevens van de vorige hulpvrager verwijderd (TODO); de frontend handelt de OpenID flow af;
- een Kotlin Spring Boot REST API; **alle** end points zijn beveiligd en alleen toegankelijk met een geldig ID-token;
- een Postgres database; (TODO encryptie van de data)

## Minimaliseren van de opgeslagen gegevens
Van een hulpvrager wordt het e-mailadres (als identificatie), een zelfgekozen bijnaam en een door de vrijwilliger gekozen pseudoniem opgenomen. Daarnaast, noodzakelijkerwijs, de betalingen, de categorie&euml;n en de betalingsachterstanden. Periodiek wordt de administratie 'afgesloten' en worden alle betalingen geaggregeerd en de detailbetalingen verwijderd. Als de hulpvrager wil kan zij/hij instellen dat ook de geaggregeerde gegevens worden verwijderd.

De bijnaam wordt op het scherm gebruikt om de hulpvrager te begroeten. Het pseudoniem wordt gebruikt om de vrijwilliger in staat te stellen, bij het starten van een app, de hulpvrager te kiezen. Door een pseudoniem te gebruiken wordt de identiteit van andere hulpvragers niet getoond.

