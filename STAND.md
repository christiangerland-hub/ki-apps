# STAND

Zuletzt aktualisiert: 19.11.2026

## Was es gibt
- Businessplan C (freigegeben): `docs/businessplan-c-apps.md`, lebende Fassung im [Claude Doc](https://claude.ai/artifact/6CxTDcxTqZ2UaHCa87SMAY)
- Leitfaden aus „Rechenfreunde“: `docs/leitfaden-ios-app-store.md`
- Entwurf Nebentätigkeitsanzeige: `docs/nebentaetigkeit/anzeige-entwurf.md`
- Nischenrecherche App 1: `docs/recherche/nischen-app-1.md` (Empfehlung: Offline-Protokoll-App)
- App 1: `docs/app1-protokoll/lastenheft.md` (Diktiergerät mit Protokollausgabe, zur Freigabe), `spezifikation.md` (Preisrechnung), Code-Anfang unter `apps/Protokoll/` (unvollständig, nie kompiliert)
- Ideenliste mit Bewertungsfilter und Idee 8: `docs/ideen/uebergabe-app-und-geschaeftsideen.md`, Begleitdokument im [Claude Doc „App- und Geschäftsideen“](https://claude.ai/artifact/D4C315Tm8VynTba1EqnPoa)

## Fokus (entschieden 19.11.2026)
**Plan C hat Vorrang.** Idee 8 ruht, bis ARRI der Nebentätigkeit zugestimmt hat. Danach prüfen 5–8 Bedarfsgespräche die Idee, noch ohne Code. Entscheidungsgrundlage:

Laut `docs/ideen/uebergabe-app-und-geschaeftsideen.md` hat Christian am 17.11.2026 **Idee 8 (OEM-Forecast- und Materialrisiko-Plattform, B2B-Web-Software)** gewählt. Am 19.11.2026 wurde **Plan C (kleine iPhone-Apps)** freigegeben. Beides parallel widerspricht der eigenen Regel „eine Idee für 8 Wochen“.

| | Plan C: iPhone-Apps | Idee 8: OEM-Plattform |
|---|---|---|
| Weg zu 1.000 €/Woche | ca. 1.000 Abonnenten à 4,99 €/Monat (Massenmarkt, schwer planbar) | z. B. ca. 11 Firmenkunden à 400 €/Monat (Annahme, Preis ungeprüft) |
| Nähe zu ARRI | gering | **hoch**: Idee stammt aus dem ARRI-Einkaufsalltag. Interessenkonflikt, § 69b UrhG, Zustimmung von ARRI unsicher |
| Haftung beim Einstellen | gering (Apple verkauft) | höher: Kundenverträge, Auftragsverarbeitung (Art. 28 DSGVO), Kundendaten, Verfügbarkeit |
| Zeitbedarf | Testen und Freigaben | Kundengespräche (5–8), Vertrieb, Support während der Arbeitszeit der Kunden |
| Lernziel iOS | ja | eher Web |

## Entwicklungsumgebung
- Mac: Xcode 27.2 (Angabe von Christian, 19.11.2026). Damit ist die Voraussetzung aus dem Leitfaden erfüllt (Xcode 16+, synchronisierte Ordnergruppen).
- Remote Control: Der Ordner „Claude“ auf Mac.fritz.box wird Cloud-Sitzungen nicht angeboten (Grund unbekannt). Bauen und Testen deshalb auf dem Mac.

## Stand bei Apple
- Noch keine App für dieses Projekt angelegt.
- Entwicklerkonto: dasselbe wie bei „Rechenfreunde“, als Händler mit Christians Privatadresse (19.11.2026). Die Jahresgebühr ist damit schon bezahlt.
- Hinweis: Apple zeigt die Händlerdaten (Adresse, Telefon, E-Mail) in der EU auf jeder Produktseite an, nach Art. 30/31 DSA. Wer die Privatadresse nicht zeigen will, kann vor App 1 auf eine ladungsfähige Geschäftsadresse wechseln. Entscheidung offen, nicht dringend.

## Nächste Schritte
1. **Christian:** Lastenheft prüfen und freigeben (oder Änderungen nennen).
2. **Christian:** auf dem iPhone die iOS-Version und das Modell nennen (für die deutsche Spracherkennung auf dem Gerät).
3. **Claude:** nach der Freigabe Pflichtenheft und Xcode-Projekt (SwiftUI, Tests).

## Zurückgestellt
- Steuerberater (19.11.2026): erst bauen, dann klären.
- Nebentätigkeit: Christian klärt das selbst (19.11.2026). Bis dahin gilt: kein Gewerbe anmelden, nichts im App Store veröffentlichen, keine Einnahmen. Ob schon die private Entwicklung ohne Einnahmen unter die Klausel fällt, ist **nicht belegt** und hängt vom Wortlaut ab.

## Offene Punkte
- Gewerbe: Erst nach der Zustimmung von ARRI anmelden.
- Website: Kann die vorhandene Hosting-Lösung (Hostinger) mitgenutzt werden?

## Nützliche Befehle
Siehe `docs/leitfaden-ios-app-store.md`, Abschnitt „Befehle“.
