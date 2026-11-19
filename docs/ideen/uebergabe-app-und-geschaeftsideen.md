# Übergabe: App- und Geschäftsideen (Stand 19.11.2026)

Kontext für ein neues Claude-Projekt. Privates Projekt von Christian Gerland, **kein ARRI-Bezug** (kein ARRI-Styleguide, keine ARRI-Daten).

Begleitdokument mit allen Details, Bewertungstabelle, Stichwortliste und Skript: Claude-Doc „App- und Geschäftsideen“ (https://claude.ai/artifact/D4C315Tm8VynTba1EqnPoa)

---

## 1. Ziel und Ausgangslage

- Christian will eine App bzw. Web-Software bauen, mit der sich Geld verdienen lässt, und dabei iOS- und Web-Entwicklung lernen.
- Er veröffentlicht gerade seine erste iOS-App „Lernfreunde“.
- Langfristiger Reiz: eine weitgehend digitale Firma, deren Operatives KI-Agenten übernehmen; Christian überwacht.
- Problem, das er selbst benennt: „So viele Ideen, dass ich das Gefühl habe, keine guten zu haben.“ Daher: Ideen nur noch sammeln, mit einem festen Filter bewerten, dann eine Idee für einen festen Zeitraum (z. B. 8 Wochen) verfolgen.

## 2. Entscheidung

**Christian will Idee 8 weiterverfolgen: die OEM-Plattform für Forecast und Materialrisiko bei EMS-Fertigung.** (Entscheidung vom 17.11.2026)

## 3. Bewertungsfilter

Je 1–5 Punkte für drei Fragen: **Zahlt jemand dafür? Habe ich einen Vorsprung? Macht es mir Spaß?**
Die Spalte „Spaß“ ist von Claude geschätzt und muss von Christian noch korrigiert werden.

| Idee | Zahlung | Vorsprung | Spaß | Summe |
| --- | --- | --- | --- | --- |
| 1. Compliance-Service mit KI-Agenten | 5 | 5 | 3 | 13 |
| 2. KI-Training für Einkäufer und Firmen | 4 | 4 | 4 | 12 |
| 5. Sauerteig-Playbook | 2 | 4 | 5 | 11 |
| 3. Konzentrations-Coach | 4 | 1 | 3 | 8 |
| 4. QM-Handbuch per KI-Interview | 3 | 3 | 2 | 8 |
| 6. Pendel-Coach | 1 | 1 | 3 | 5 |
| 7. Ideenfinder für App-Entwickler | nicht bewertet | | | |
| 8. OEM-Forecast-/Materialrisiko-Plattform | nicht bewertet (gewählt) | | | |

## 4. Die Ideen

### Idee 8 (gewählt): OEM-Forecast- und Materialrisiko-Plattform für EMS-Fertigung
- **Problem:** Elektronikbauteile werden schwerer zu beschaffen, Lieferzeiten länger. Als OEM ist unklar, ob der EMS das Material für eine PCBA-Bestellung schon hat, was er bestellt hat, was er nicht bekommt und wann die nächste Lieferung kommt.
- **Kern:** OEM übermittelt Forecast auf Baugruppenebene → System kennt die BOM und löst in Bauteilbedarf auf → Abgleich mit (a) eigenen Beständen, (b) EMS-Beständen, (c) offenen EMS-Bestellungen, (d) Lieferantenbeständen und Preisen per API → sofortige Liste der Problemteile. Optional: gemeinsame Broker-Anfragen mit Angebotsauswertung und Preis-Feedback.
- **Wettbewerb:** Luminovo und CalcuQuote bieten Kundenportale, aber gekauft und gedacht aus Sicht des EMS. Laut Christian (kennt Luminovo sehr gut) ist die OEM-Sicht dort ungelöst.
  - Luminovo Customer Portal: https://luminovo.com/platform/customer-portal
  - Auf der Marktseite gibt es Risiko-Tools wie SiliconExpert oder Z2Data (ungeprüft); Christians Vorteil wäre die Verknüpfung mit dem Forecast.
- **Größte Schwachstelle:** Der EMS muss Bestände, Bestellungen und Broker-Preise offenlegen (Marge). Er braucht einen eigenen Nutzen, z. B. weniger Rückfragen, schnellere Freigaben für Broker-Käufe.
- **Empfohlene erste Version:** funktioniert ohne Mitwirkung des EMS: Forecast + BOM + Distributorendaten = Risikoübersicht; EMS-Daten anfangs per Excel-Upload.
- **Datenquellen zu prüfen:** APIs von Digi-Key, Mouser, Nexar/Octopart (Bedingungen und Kosten offen). Christian sieht Katalogpreise ca. 40 % über Distributionspreisen.
- **Rahmen:** Idee stammt aus dem ARRI-Alltag → außerhalb der Arbeitszeit, mit eigenen Geräten, ohne ARRI-Daten bauen; Nebentätigkeit laut Arbeitsvertrag klären. (Keine Rechtsberatung.)

### Idee 1: Compliance-Service für den Mittelstand mit KI-Agenten
- Kern: „Gib mir deine Lieferanten und Produkte, ich kümmere mich um belastbare Lieferantenerklärungen“ (z. B. PPWR, REACH, RoHS). Agenten fordern an, haken nach, prüfen Dokumente; Christian überwacht.
- Stärken: wachsendes Pflichtthema, niemand hat Lust darauf, eigene Expertise; für Agenten gut geeignet (strukturiert, wiederkehrend, messbar).
- Risiken: Haftung bei falsch durchgewinkten Erklärungen (Stichprobenkontrolle, Verträge); Kaltakquise per E-Mail an Firmen ohne Einwilligung grundsätzlich unzulässig (§ 7 UWG, Wortlaut nicht nachgeprüft); bestehende Enterprise-Tools; Christian fand das Thema früher „zutiefst langweilig“.
- Aufwand (Schätzung): ca. 4–6 Monate bis zu zuverlässigen Agenten; Start halbmanuell mit 2–3 Pilotkunden.

### Idee 2: KI-Schulung / Prompt-Trainer
- Kern: Üben an echten Aufgaben mit Feedback; Zielgruppe zuerst Einkäufer in Firmen, später Einzelne im App Store.
- Slogan-Idee: „Hat dir KI heute schon den Job weggenommen?“ – positivere Variante: „Die KI nimmt dir nicht den Job. Jemand, der sie besser nutzt, schon.“
- Risiken: Angestellte zahlen selten privat → Verkauf über Firmenlizenzen bzw. Workshop plus App; Material für ARRI gehört im Zweifel ARRI.

### Idee 3: Konzentrations-Coach
- Kern: Trainingsplan für längere Fokusblöcke (z. B. 10 → 45 Minuten), Gamification, Fortschrittskurve; kein reiner App-Blocker.
- Risiken: viel Konkurrenz (Opal, one sec, Forest, ScreenZen – ungeprüft); Apples Bildschirmzeit-Schnittstelle gibt nur eingeschränkt Nutzungsdaten frei; keine Gesundheitsversprechen (App-Prüfung, Medizinprodukt); klassisches Gehirnjogging wirkt laut Forschung kaum im Alltag (ungeprüft).

### Idee 4: QM-Handbuch per KI-Interview (Browser)
- Kern: KI-Interview erzeugt angepasstes Prozesshandbuch mit Formularen und Checklisten, ohne Norm-Studium und Berater („dokumentarische Grundlage in fünf Minuten“, nicht Zertifizierungsreife).
- Mögliche Nische: Zahnarztpraxen (Zugang über Christians Frau).
- Wettbewerb: DICIS (https://www.innolytics.de/qualitaetsmanagement-software/), IMScollect (https://imscollect.de/iso-9001), roXtra, orgavision; Preisdruck durch ChatGPT.

### Idee 5: Sauerteig-Playbook für Einsteiger
- Kern: ein fester Lernweg statt vieler Meinungen (Anstellgut, Teigführung, Kneten, Falten, Formen), kurze Videos, Fehlerdiagnose per Foto.
- Stärken: Christians Leidenschaft und Expertise; Freunde als erste Testnutzer über TestFlight; ideales Lernprojekt.
- Markt: zersplittert, kein Platzhirsch (BackPlaner, BreadMe, Sourdough Forge, Loaflo, Rise, proofit u. a.). Beschwerde zu Sourdough Forge: verwirrend, ohne Bezahlen kaum Mehrwert – stützt den Lernweg-Ansatz. Eher Herzensprojekt als großes Geschäft.
  - BackPlaner: https://apps.apple.com/ch/app/backplaner/id978993791

### Idee 6: Pendel-Coach
- Kern: kennt den Arbeitsweg, rät aktiv „jetzt losfahren“ oder „noch 30 Minuten warten“.
- Risiken: teure Verkehrsdaten mit Prognose; Abfahrtserinnerungen gibt es bei Waze und Google Maps (ungeprüft); Google kann die Funktion jederzeit einbauen. Eher Lernprojekt.

### Idee 7: Ideenfinder für App-Entwickler („Schaufeln für Goldgräber“)
- Kern: App-Store-Daten auswerten und Chancen zeigen.
- Risiken: dicht besetzt (You Could Ship This https://youcouldshipthis.com/, BigIdeasDB, Unstar, Insightly, Glotier); Zielgruppe zahlt wenig. Mögliche Lücke: deutschsprachiger Markt. Niedrige Priorität.

### Verworfen bzw. kritisch
- **Abrechnungs-App für Zahnärzte:** Markt voll (Sonia https://sonia.so/zahnarzt, Doctos, maika, KZVB-Abrechnungsmappe mit KI-Assistent). Lücke liegt beim Erfassen vor der Software (z. B. tomedo.Dental hat eine Abrechnungsfehlerliste: https://dental.tomedo.de/funktionen/abrechnung/). Höchstens als Service mit Abrechnungsexpertin.
- **Rent a Human für KI:** besetzt (RentAHuman, Y Combinator: https://www.ycombinator.com/companies/rentahuman); Marktplatz zu groß für ein Lernprojekt.
- **Fahrtenbuch-App:** viele Anbieter (Vimcar, FleetGO, PAJ). Für Christian persönlich lohnt das Fahrtenbuch statt 0,5-%-Regel sehr wahrscheinlich nicht (Arbeitsweg 40 km, ca. 20.000 km privat; Fahrzeugkosten bei ARRI noch unbekannt).
- **VR-Drohnensimulator:** gibt es schon (Drone Simulator VR für Meta Quest, Liftoff per Steam Link).
- **Bestellfreigabe-App per Handy für Praxen:** Handy-App im Unternehmen wenig überzeugend; wenn, dann Web-Software mit Handy nur für Barcode-Scan.

## 5. Methode: App-Store-Abgleich

- Idee: Apps finden, die schlecht bewertet sind, aber trotzdem genutzt werden. Viele Bewertungen = viele Nutzer; Anzahl × Schwäche des Schnitts ≈ unzufriedene Nutzer. Aktualität über Datum der letzten Version prüfen.
- Statt Top-Charts: Stichwortsuche, abgeleitet aus der eigenen Ideenliste. Gilt nur für Verbraucher-Apps (Ideen 2, 3, 5, 6). Firmenideen (1, 4, 8) werden über Kundengespräche geprüft.
- Apple liefert keine Downloadzahlen und über die Suchschnittstelle keine Bewertungstexte (Texte nur über separaten Bewertungs-Feed).
- **Skript `appcheck.py`** liegt im Begleitdokument. Noch ungetestet, weil Claudes Code-Umgebung keinen Internetzugang hat; Christian startet es am eigenen Rechner (`pip install requests`, dann `python appcheck.py`). Ergebnis: Terminal und `appcheck_ergebnis.csv`.
- Browser-Testlauf Sauerteig: Markt zersplittert, kein starkes Signal für viele unzufriedene Nutzer.

### Stichwörter

| Idee | Deutsch | Englisch |
| --- | --- | --- |
| 5. Sauerteig | Sauerteig, Brot backen, Anstellgut, Backplan, Brotrezepte, Sauerteig lernen, Pizzateig, Backkurs | sourdough, sourdough starter, bread baking, baking timer, bread recipes, learn to bake, pizza dough |
| 3. Konzentration | Konzentration, Fokus, Handysucht, Bildschirmzeit, Fokus Timer, Produktivität, digital detox, Ablenkung | focus, concentration, attention span, screen time, phone addiction, focus timer, deep work, app blocker |
| 6. Pendeln | Pendeln, Arbeitsweg, Verkehr, Stau, Abfahrtszeit, Verkehrsprognose | commute, traffic alerts, leave time, traffic forecast, commute planner, departure reminder |
| 2. KI-Schulung | KI lernen, ChatGPT lernen, Prompts, KI Kurs, künstliche Intelligenz | learn AI, AI course, prompt engineering, ChatGPT guide, AI skills, AI for work |

## 6. Testfragen für Gespräche mit möglichen Pilotkunden

(Ursprünglich für Idee 1, für Idee 8 anpassen)
1. Welche Nachweise bzw. Materialinformationen holt ihr heute ein, und wer macht das?
2. Wie viele Stunden pro Monat gehen dafür drauf?
3. Was ist beim letzten Audit bzw. Engpass schiefgelaufen oder knapp geworden?
4. Welches Tool oder welchen Dienstleister nutzt ihr heute, und was stört euch daran?
5. Was wäre es euch pro Monat wert, wenn das jemand anderes übernimmt?
6. Würdet ihr einen bezahlten Pilot über drei Monate starten?
→ Fragen 5 und 6 sind entscheidend; Zögern bei 6 = Schmerz noch nicht groß genug.

## 7. Offene Punkte und nächste Schritte

| # | Schritt | Verantwortlich | Termin |
| --- | --- | --- | --- |
| 1 | Bedarf für Idee 8 prüfen: 5–8 Gespräche mit Einkaufsleitern von OEMs mit EMS-Fertigung (z. B. Netzwerk aus TQ-Zeit; keine ARRI-Lieferanten ansprechen) | Christian | offen |
| 2 | Umfang der ersten Version von Idee 8 skizzieren (Forecast, BOM-Upload, Bedarfsauflösung, Distributorenabgleich, EMS per Excel) | Christian mit Claude | offen |
| 3 | API-Bedingungen und Kosten von Digi-Key, Mouser, Nexar prüfen | Claude | offen |
| 4 | Klickbaren Prototyp für die Gespräche bauen | Christian mit Claude | offen |
| 5 | Nebentätigkeit und Rechte an Arbeitsergebnissen im Arbeitsvertrag prüfen | Christian | offen |
| 6 | Spaß-Spalte der Bewertung selbst korrigieren; Ideen 7 und 8 bewerten | Christian | offen |
| 7 | `appcheck.py` am eigenen Rechner starten und Ergebnis gemeinsam auswerten | Christian | offen |

## 8. Arbeitsweise für Claude in diesem Projekt

- Auf Deutsch antworten, Ergebnis zuerst, dann Begründung.
- Fakten mit Quellen belegen, Ungeprüftes kennzeichnen, keine Halluzinationen.
- Als Sparringspartner ungefragt größte Schwachstelle und stärksten Einwand nennen.
- Zahlen rechnen statt schätzen; Annahmen mit Einheit und Datenstand ausweisen.
- Neue Ideen nur auf die Liste setzen und mit dem Filter bewerten, nicht jedes Mal vertiefen.
