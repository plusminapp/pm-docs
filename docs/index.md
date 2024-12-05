# `PlusMin`

**Versie**: {{ git_revision_date }} </br>
**Auteur**: Ruud van Vliet

## Disclaimer

De documentatie is 'in wording', net zoals de app zelf trouwens.

## Overzicht

`PlusMin` is **collaboratie platform**, in de vorm van open-source software, gericht op de **ondersteuning** van
**administratiemaatjes** (zie
bijvoorbeeld [LSTA](https://lsta.nl/), [humanitas thuisadministratie](https://www.humanitas.nl/thuisadministratie/) of
[schuldhulpmaatje](https://schuldhulpmaatje.nl/)) bij het begeleiden van **hulpvragers** i.h.k.v. **financi&euml;le
uitdagingen**.

`PlusMin` is: Inkomsten en uitgaven, Overschot/buffer en tekort, Wiskunde voor iedereen, Niet digi en niet theoretisch.

Dit gereedschap helpt administratiemaatjes en hulpvragers bij het budgetteren, monitoren van inkomsten en uitgaven. Het
voorkomt onverwachte financi&euml;le problemen. Het doel is een laagdrempelige digitale oplossing te bieden, in
combinatie met o.a. een 'papieren' versie. Het moet eenvoudig te gebruiken zijn voor hulpvragers met beperkte digitale
vaardigheden en minimale apparatuur, zoals alleen een mobiele telefoon.

Het administratiemaatjes krijgt toegang, ook van huis uit, tot de gegevens die de hulpvrager wil delen, zonder dat er
toegang tot een bankrekening wordt gegeven, en zonder dat die gegevens mee naar huis worden genomen.

De app wordt onderdeel van een pakket met onder andere een papieren versie, checklists, opleidingen, etc.

## Doelgroep

In eerste instantie ontwikkel ik de app voor mezelf, maar in de toekomst is het bedoeld voor administratiemaatjes en
hulpvragers in het algemeen.

## Probleemstelling

Een deel van de mensen met geldzorgen heeft weinig digitale vaardigheden en communiceert veel via een mobiele
telefoon (weinig overzicht, veel door elkaar). In de praktijk blijkt dat bestaande hulpmiddelen voor schuldhulpverlening
niet voldoen aan de behoeften van administratiemaatjes en hulpvragers. Er is behoefte aan een eenvoudige, toegankelijke
oplossing die:

- Eenvoudig inkomsten en uitgaven kan registreren
- Budgettering ondersteunt en de voortgang (uitputting) van budgetten bewaakt
- Heldere signalen geeft bij afwijkingen van de uitputting ten opzichte van het budget
- Naadloos aansluit op het pakket van checklists, opleidingen, etc.

Hulpvragers zijn vaak minder digitaal vaardig en hebben niet altijd toegang tot moderne digitale hulpmiddelen. `PlusMin`
moet daarom makkelijk bruikbaar zijn op mobiele telefoons, het meest gebruikte apparaat door hulpvragers.

## ABC: Zelfbeschikkingstheorie

De [zelfbeschikkingstheorie](https://nl.wikipedia.org/wiki/Zelfbeschikkingstheorie) is een door Edward Deci en Richard
M. Ryan ontwikkelde macrotheorie over de menselijke motivatie. De kern van de theorie wordt gevormd door de stelling dat
er drie natuurlijke basisbehoeften zijn die, indien deze bevredigd worden, een optimaal functioneren, welbevinden en
groei van een persoon toestaan. De drie basisbehoeften zijn:

- Autonomie
- Betrokkenheid
- Competentie

Dit is de reden dat de PlusMin app onderdeel is van een ecosysteem met o.a. een papieren versie, checklists,
opleidingen, etc. Er moet worden voorkomen dat de financi&euml;le administratie over de hulpvrager wordt uitgestort. Het
is een geleidelijk proces waarbij de hulpvrager op alle drie de basisbehoeften wordt gerespecteerd.

Ook in de app is een groeimodel voorzien. Hoewel de app in een laat stadium wordt ingezet, is de app configureerbaar en
laat zich aanpassen aan het competentieniveau van de hulpvrager. In de meest eenvoudige vorm registreert de hulpvrager
alleen betalingen en wijst ze toe aan een categorie. In samenwerking met de vrijwilliger kan zo inzicht verkregen worden
in de geldstromen. In de meest complexe variant worden budgetten opgesteld, reserveringen gedaan en krijgt de hulpvrager
signalen als er actie moet worden ondernomen.

## Functies

Het gereedschap biedt ondersteuning voor de volgende functionaliteiten:

1. **Budgetcategorie&euml;n opstellen**  
   hulpvragers en administratiemaatjes kunnen samen duidelijke categorie&euml;n bepalen waarin inkomsten en uitgaven
   worden onderverdeeld.

2. **Budgettering/reserveren per periode**  
   Per budgetrekening (zie de [woordenlijst](8-woordenlijst.md)) kan een budget worden vastgesteld voor een bepaalde
   periode (week, maand, kwartaal of jaar), met een verwachte uitputtingssnelheid. Indien de budgetteringsperiode de
   inkomstenperiode (meestal een maand) overstijgt registreert PlusMin automatisch een reservering per inkomstenperiode.

3. **Inkomsten en uitgaven registreren**  
   hulpvragers kunnen eenvoudig transacties registreren en categoriseren. Er is een toekomstig plan om een koppeling met
   bankgegevens te integreren.

4. **Visuele feedback**  
   Eenvoudige visuele signalen (zoals een stoplichtsysteem) geven aan of de registratie up-to-date is, of transacties
   correct zijn, en of het budget volgens verwachting wordt uitgeput.

5. **Afwijkingen signaleren**  
   Als het werkelijke uitgavenpatroon te ver afwijkt van het verwachte patroon, kan het systeem waarschuwen en eventueel
   een melding sturen naar het administratiemaatje, mits de hulpvrager daar toestemming voor geeft.

## Bijdragen

Dit project staat open voor bijdragen. Suggesties, bug reports, en pull requests zijn van harte welkom. De broncode
wordt beheerd op [Github](https://github.com/plusminapp).




