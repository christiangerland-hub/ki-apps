# App 1: Offline-Protokoll (Arbeitstitel „Protokoll“)

Stand: 19.11.2026 · Status: **teilweise ersetzt durch `lastenheft.md`** (Positionierung als Diktiergerät, Umfang 1.0). Preisrechnung, Datenmodell und Export gelten weiter.

## Ziel
Besprechungen in 2 Minuten protokollieren: Tagesordnung, Notizen, Entscheidungen, Aufgaben mit Zuständigem und Termin. Danach als PDF oder Text teilen. **Alles bleibt auf dem iPhone**: kein Konto, kein Server, keine Cloud-KI.

Zielgruppe: Selbstständige, Berater, Teamleiter in kleinen Firmen, Vereinsvorstände.

## Was damit zu verdienen ist (Rechnung, keine Prognose)

**Preismodell (Vorschlag):** gratis mit bis zu 3 Besprechungen. Danach „Pro“ als Einmalkauf für 14,99 €. Ein Abo (2,99 €/Monat) erst, wenn es Funktionen mit laufendem Nutzen gibt (z. B. Sprache → Text, Vorlagen).

Erlös pro Pro-Kauf für uns:

```latex
14{,}99\,€ \div 1{,}19 \;(\text{USt}) \times 0{,}85 \;(\text{Apple-Provision 15 \%}) \approx 10{,}71\,€
```

| Ziel | Pro-Käufe nötig | Downloads nötig bei 2 % Kaufquote | bei 5 % Kaufquote |
|---|---|---|---|
| 100 €/Woche | ca. 10/Woche | ca. 470/Woche | ca. 190/Woche |
| 500 €/Woche | ca. 47/Woche | ca. 2.340/Woche | ca. 940/Woche |
| 1.000 €/Woche | ca. 94/Woche | ca. 4.670/Woche | ca. 1.870/Woche |

- Die Kaufquoten von 2 % und 5 % sind **Annahmen** für Freemium-Apps, nicht belegt. Echte Werte liefert erst App Store Connect nach dem Start.
- Apple-Provision 15 % gilt im [Small Business Program](https://developer.apple.com/app-store/small-business-program/). Die Behandlung der Umsatzsteuer ist mit dem Steuerberater zu klären (zurückgestellt).
- **Ehrliche Einschätzung:** 1.000 €/Woche mit dieser einen App bräuchte etwa 1.900–4.700 Downloads pro Woche. Das ist für eine neue Nischen-App sehr ehrgeizig. Realistischer Weg: App 1 bringt den ersten Umsatz und die Lernkurve, das Portfolio (App 2, 3, …) skaliert. Erster Meilenstein: **100 €/Woche**.

## Umfang Version 1.0 (MVP)
1. **Besprechungen:** anlegen, bearbeiten, löschen. Titel, Datum und Uhrzeit, Ort (optional), Teilnehmer (nur Namen).
2. **Tagesordnung:** Punkte mit Titel, Notizen und Entscheidungen.
3. **Aufgaben:** Was, Wer, Bis wann, erledigt ja/nein. Pro Besprechung und als Gesamtübersicht aller offenen Aufgaben, sortiert nach Fälligkeit.
4. **Export:** als Text und als PDF über das Teilen-Menü (Mail, Nachrichten, Dateien).
5. **Gratis-Grenze:** 3 Besprechungen, danach Hinweis auf Pro. Der Kauf über StoreKit 2 kommt in Version 1.1, vor der Veröffentlichung.

**Nicht in 1.0:** Sprache → Text, Vorlagen, iPad-Layout, Kalender-Import, Erinnerungen, iCloud-Sync.

## Technik
Nach `docs/leitfaden-ios-app-store.md`: SwiftUI, iOS 17+, `@Observable`-Store, keine externen Abhängigkeiten. Daten als `Codable`-JSON in Application Support. Logik getrennt von den Views und mit Tests abgedeckt (Swift Testing).

| Datei | Inhalt |
|---|---|
| `Model/Meeting.swift` | Datenmodell (Besprechung, Tagesordnungspunkt, Aufgabe) |
| `Model/MeetingStore.swift` | Laden, Speichern, Ändern, Gratis-Grenze, offene Aufgaben |
| `Export/ProtocolTextExporter.swift` | Protokoll als Text (reine Logik, getestet) |
| `Export/ProtocolPDFRenderer.swift` | PDF aus dem Text (UIKit) |
| `Views/…` | Listen, Detail, Aufgaben, Export, Pro-Hinweis |

Signierung und Bundle-ID stehen in `Config/Local.xcconfig`. Die Datei ist nicht im Repo: Vorlage `Config/Local.xcconfig.example`, damit die Team-ID nicht ins Repo gelangt.

## Datenschutz (für die App-Prüfung und die Datenschutzseite)
- Die App speichert nur lokal: Besprechungen, Teilnehmernamen, Aufgaben.
- Keine Netzwerkzugriffe, keine Analyse-Werkzeuge, keine Werbung.
- Löschen: in der App oder durch Löschen der App.
- App Privacy in App Store Connect: „Keine Daten erfasst“ (vor der Einreichung prüfen).

## Offene Punkte
- Name: Markenrecherche (DPMA, App Store) vor der Festlegung.
- App-Icon fehlt noch.
- Store-Check und 3–5 Gespräche mit der Zielgruppe (Christian) bestätigen den Bedarf oder widerlegen ihn.
