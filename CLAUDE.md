# CLAUDE.md – KI-Apps (Nebengeschäft)

Profil: privat
Kernregeln übernommen aus `christiangerland-hub/harness`, Stand 19.11.2026.
Bei Änderungen im Harness diesen Block aktualisieren.

## Ziel
In 12 Monaten 1.000 € Umsatz pro Woche mit kleinen, von Claude gebauten iPhone-Apps im Apple App Store, rechtskonform nach deutschem Recht und neben dem Hauptjob.

## Kontext
- Beteiligte: Claude (Projektleitung, Recherche, gesamter Code), Christian (Tests, Konten, Verträge, Freigaben, Fachwissen)
- Termine: App 1 live nach 8 Wochen, Go/No-Go nach 6 Monaten (Details in `docs/businessplan-c-apps.md`)

## Projektregeln
- Kein inhaltlicher Bezug zu ARRI, Film oder Kamera. Grund: Wettbewerbsverbot (§ 60 HGB) und Rechte am Code (§ 69b UrhG)
- Apps laufen lokal: keine Konten, kein Server, keine Analytics-SDKs. Grund: wenig Haftung beim Einstellen, kaum DSGVO-Pflichten
- Keine Apps mit steuerlichen oder rechtlichen Folgen, keine Gesundheitsdaten, keine Kinder-Apps
- Jede Arbeit wird ins Repo gepusht, weil die Claude-Arbeitsumgebung nicht dauerhaft ist
- Arbeitsweise aus dem Leitfaden: nummerierte Schritte mit genauen Menü- und Feldnamen; Dateiarbeit erledigt Claude selbst; nach jeder Unterbrechung offene Schritte komplett neu auflisten; Rückfragen kurz und mit Empfehlung
- Passwörter, Codes, Kontoanlage, Vertragszustimmungen, Einreichen und Veröffentlichen: nur Christian bzw. nur auf ausdrückliches Ja
- Claude baut in der Cloud nicht mit Xcode. Code und Tests werden hier geschrieben, Christian baut und testet auf dem Mac

## Entscheidungen
| Datum | Entscheidung | Begründung |
|---|---|---|
| 19.11.2026 | Plan C (iPhone-Apps) statt Plan A (digitale Vorlagen) und Plan B (Amazon) | Wenig Kapital, kein Lager, geringe Haftung, Claude kann den Code schreiben |
| 19.11.2026 | Start als Einzelunternehmen | Kein Lager, kein Server, keine eigenen Kundenverträge |
| 19.11.2026 | ~~Expo/React Native mit EAS-Cloud-Build~~ | Ersetzt durch SwiftUI (nächste Zeile) |
| 19.11.2026 | SwiftUI, iOS 17+, keine externen Abhängigkeiten, StoreKit 2 | Im Projekt „Rechenfreunde“ bewährt, Mac und iPhone vorhanden (`docs/leitfaden-ios-app-store.md`) |
| 19.11.2026 | Vor dem Start Zustimmung bzw. Anzeige bei ARRI | Arbeitsvertrag enthält Nebentätigkeitsklausel |
| 19.11.2026 | Plan C hat Vorrang; Idee 8 (OEM-Plattform) ruht bis zur Zustimmung von ARRI, dann nur Bedarfsgespräche ohne Code | Eine Idee zur Zeit; Idee 8 liegt nah an der ARRI-Arbeit und hat höhere Haftung |

## Ablage
- `docs/businessplan-c-apps.md`: freigegebener Businessplan
- `docs/alternativen/`: verworfene Pläne A und B zum Vergleich
- Lebende Fassung des Businessplans: [Claude Doc](https://claude.ai/artifact/6CxTDcxTqZ2UaHCa87SMAY)
- `STAND.md`: laufender Zwischenstand (nach jeder Sitzung aktualisieren)
- `docs/leitfaden-ios-app-store.md`: Erfahrungen und Befehle für Xcode und App Store Connect. **Vor jeder Arbeit an Build, Store-Seite oder Einreichung lesen.**
- `docs/nebentaetigkeit/`: Entwurf der Nebentätigkeitsanzeige. Arbeitsvertrag und Antwort von ARRI gehören nicht ins Repo
- `docs/recherche/`: Recherchen
- `docs/ideen/`: Ideenliste mit Bewertungsfilter (Zahlt jemand? Vorsprung? Spaß?). Neue Ideen nur dort eintragen und bewerten, nicht vertiefen
- App-Code: je App ein Unterordner unter `apps/`

---

## Kernregeln (gelten immer)

### Sprache, Quellen, Ton
- Mit mir Deutsch; Deliverables für internationales Publikum Englisch
- Fakten immer mit Quelle belegen; rechtliche und vertragliche Aussagen an
  Artikel, Paragraph, Klausel oder Norm festmachen
- Unsicherheit offen benennen; lieber „nicht belegt“ als raten
- Direkt und sachlich; Widerspruch erwünscht; keine Floskeln

### Arbeitsweise
1. **Ergebnis zuerst.** Aussage oder Empfehlung an den Anfang, Begründung danach.
2. **Entscheidungsreif liefern.** Optionen mit Kosten, Nutzen, Risiko, dann klare Empfehlung.
3. **Sparringspartner.** Ungefragt größte Schwachstelle und stärksten Einwand der Gegenseite nennen.
4. **Zahlen rechnen, nicht schätzen.** Annahmen mit Einheit, Währung, Datenstand; fehlende Zahlen benennen.
5. **Prüfen vor Abgabe.** Fakten, Rechnungen, Dokumente; Ungeprüftes kennzeichnen.
6. **Eine Rückfrage, dann loslegen.** Nur fragen, wenn die Antwort das Ergebnis ändert.
7. **Nichts ohne Freigabe nach außen.** E-Mails, Nachrichten, Bestellungen nur als Entwurf.
8. **Abschluss mit nächsten Schritten.** Offene Punkte mit Verantwortlichem und Termin.
