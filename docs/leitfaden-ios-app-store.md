# Leitfaden: iOS-App mit Claude in den App Store bringen

Erfahrungen aus dem Projekt „Rechenfreunde" (SwiftUI-App, eingereicht im November 2026).
Gedacht als Startwissen für ein neues Projekt. Im neuen Repository als `CLAUDE.md` ablegen oder aus der `CLAUDE.md` darauf verweisen.

Persönliche Angaben (Adresse, Telefonnummer, Team-ID, Kontonummern) stehen bewusst nicht in dieser Datei. Platzhalter sind in `<spitzen Klammern>` geschrieben.

## Arbeitsweise

- Sprache: Deutsch, auch in Antworten.
- Bei Xcode, App Store Connect, Cloudflare und ähnlichen Werkzeugen: nummerierte Schritte mit den genauen Menü- und Feldnamen.
- Was sich per Datei oder Kommandozeile erledigen lässt, erledigt Claude selbst, statt durch Xcode-Dialoge zu führen.
- Nach jeder Unterbrechung (Rückfrage, Fehler, Umweg) die offenen Schritte komplett neu auflisten. Nie auf weiter oben verweisen.
- Rückfragen kurz halten und mit einer Empfehlung versehen.
- Passwörter, Bestätigungscodes, Kontoanlage und Zustimmungen zu Verträgen macht immer der Mensch.
- Einreichen und Veröffentlichen nur auf ausdrückliches Ja.
- Einen laufenden Zwischenstand in einer Datei `STAND.md` im Projekt führen: was es gibt, Stand bei Apple, nächste Schritte, offene Punkte, nützliche Befehle.

## Technischer Rahmen, der sich bewährt hat

- SwiftUI, iOS 17+, `@Observable`-Store, keine externen Abhängigkeiten.
- Speicherung als `Codable`-JSON in Application Support. Kein Konto, kein Server, keine Daten verlassen das Gerät. Das vereinfacht Datenschutz und App-Prüfung erheblich.
- Xcode-Projektdatei von Hand geschrieben, mit synchronisierten Ordnergruppen (Xcode 16+). Kein Zusatzwerkzeug nötig.
- Logik getrennt von den Views und mit Unit-Tests abgedeckt.
- Automatische Signierung: `CODE_SIGN_STYLE = Automatic` und `DEVELOPMENT_TEAM = <Team-ID>` in allen Konfigurationen, für App und Tests.
- Verschlüsselungsangabe in der Info.plist setzen (`ITSAppUsesNonExemptEncryption = NO`), sonst fragt App Store Connect bei jedem Build.
- Versionsnummern: `MARKETING_VERSION` (z. B. 1.0) und `CURRENT_PROJECT_VERSION` (Build, bei jedem Upload erhöhen).

## Ablauf bis zur Einreichung

1. **Apple Developer Program** abschließen (99 € pro Jahr). Die Freischaltung kann einen Tag dauern; es kommen zwei Willkommens-Mails (Apple Developer und App Store Connect).
2. **Team-ID** aus dem Entwicklerkonto in die Projektdatei eintragen.
3. **Xcode:** Apple-ID unter Settings → Accounts neu anmelden, damit das bezahlte Team erscheint.
4. **iPhone registrieren:** per Kabel verbinden, dem Mac vertrauen, Entwicklermodus einschalten (iPhone: Einstellungen → Datenschutz & Sicherheit → Entwicklermodus; der Schalter erscheint erst, nachdem Xcode das Gerät einmal gesehen hat). Ohne registriertes Gerät scheitert das Archiv mit „Your team has no devices".
5. **Bundle-ID** im Entwicklerkonto von Hand registrieren (Identifiers → App IDs → Explicit), falls sie in „Neue App" nicht zur Auswahl steht.
6. **App in App Store Connect anlegen:** Name, Sprache, Bundle-ID, SKU.
7. **Archiv bauen und hochladen** (Befehle unten).
8. **Store-Seite ausfüllen:** Texte, Screenshots, Datenschutz-Angaben, Altersfreigabe, Preis, Prüfinformationen.
9. **Händlerstatus** (Digital Services Act) angeben. Ohne diese Angabe ließ sich die App nicht bearbeiten und einreichen.
10. **Veröffentlichung auf „manuell"** stellen, dann einreichen.

## Befehle

Tests im Simulator:

```bash
xcodebuild -project <Projekt>.xcodeproj -scheme <Scheme> -destination 'platform=iOS Simulator,name=<Simulatorname>' -derivedDataPath build test
```

Archiv bauen:

```bash
xcodebuild -project <Projekt>.xcodeproj -scheme <Scheme> -configuration Release -destination 'generic/platform=iOS' -archivePath build/<App>.xcarchive -allowProvisioningUpdates archive
```

Hochladen:

```bash
xcodebuild -exportArchive -archivePath build/<App>.xcarchive -exportOptionsPlist build/ExportOptions.plist -exportPath build/Export -allowProvisioningUpdates
```

`build/ExportOptions.plist`:

```xml
<dict>
  <key>method</key><string>app-store-connect</string>
  <key>destination</key><string>upload</string>
  <key>teamID</key><string>TEAM-ID</string>
  <key>signingStyle</key><string>automatic</string>
</dict>
```

Für die erste Geräte-Registrierung zusätzlich `-allowProvisioningDeviceRegistration`. Geräte auflisten, App installieren und starten geht mit `xcrun devicectl`.

## Store-Material (Stand November 2026)

| Was | Vorgabe |
| --- | --- |
| iPhone-Screenshots (Pflicht) | „iPhone mit Dynamic Island (mittleres Display)": 1206 × 2622 oder 1179 × 2556 |
| iPad-Screenshots (Pflicht bei iPad-Unterstützung) | 13″: 2064 × 2752 |
| Kopfzeile | 3840 × 1646, PNG, sicherer Bereich 1646 × 661 ab (1097, 493) |
| Suchergebnisse | 3:2, 1920 × 1280 bis 3840 × 2560, sicherer Bereich höchstens 2168 × 1030 ab (836, 765) |

- Alle Bilder ohne Transparenz (kein Alpha-Kanal).
- Falsche Größe führt zu „Dateiabmessungen sind ungültig". Größen vor dem Erzeugen in Apples aktueller Spezifikation nachschlagen, sie ändern sich.
- Screenshots aus dem Simulator mit einem vorbereiteten Beispiel-Spielstand erzeugen; verkleinern mit `sips -z <Höhe> <Breite>`.
- Kopfzeile und Suchergebnis-Bild lassen sich per Swift-Skript mit CoreGraphics zeichnen (Verlauf, Icon, Name, Untertitel im sicheren Bereich).
- Alle Texte in einer Datei sammeln (`StoreTexte.md`): Name, Untertitel, Werbetext, Beschreibung, Stichwörter, URLs, Prüfnotizen.

## Apples Rückfrage nach der ersten Einreichung

Neue Apps bekommen häufig „Guideline 2.1 – Information Needed". Das ist keine Ablehnung wegen Fehlern, ein neuer Build ist nicht nötig. Verlangt werden:

1. Ein **Bildschirmvideo von einem echten iPhone** mit aktuellem iOS, das mit dem App-Start beginnt und den typischen Ablauf zeigt. Eine Simulator-Aufnahme genügt nicht.
2. Zweck und Zielgruppe der App.
3. Bedienungsanleitung für die Hauptfunktionen, samt Zugangsdaten, falls nötig.
4. Liste externer Dienste (Server, Anmeldung, Zahlung, Analyse, KI).
5. Regionale Unterschiede oder die Bestätigung, dass es keine gibt.
6. Nachweise bei regulierten Branchen oder fremdem geschütztem Material.

So wurde es gelöst:

- Text auf Englisch in das Feld „Anmerkungen" unter „App-Prüfungsinformationen" (höchstens 4000 Zeichen).
- Video im selben Abschnitt bei „Anhang". Erlaubt sind unter anderem `.mp4`, `.zip`, `.pdf`, `.png`. Eine Bildschirmaufnahme vom iPhone hat schnell 200 MB; verkleinern mit `avconvert --source <Datei> --preset Preset1280x720 --output <Datei>.mp4`.
- Bildschirmaufnahme auf dem iPhone: Der Knopf muss im Kontrollzentrum erst hinzugefügt werden (Kontrollzentrum → **+** → „Steuerelement hinzufügen" → „Bildschirmaufnahme").
- Danach „Prüfung aktualisieren" und „Erneut zur App-Prüfung übermitteln".

**Empfehlung für das nächste Projekt:** Text und Video gleich bei der ersten Einreichung mitliefern. Das spart eine Prüfrunde.

## Stolpersteine

- **App Store Connect im Browser-Fenster der Claude-App:** Nach einer Änderung der Fenstergröße meldete Apple das Konto wiederholt ab, auch in Safari („Identität konnte nicht bestätigt werden"). Ein späterer Versuch ohne Größenänderung lief problemlos. Regel: dort nur auf ausdrücklichen Wunsch arbeiten, Fenstergröße nie ändern, bei Abmeldung sofort aufhören und in Safari weitermachen. Dateien auswählen muss der Mensch selbst.
- **Geräte-Pairing:** Meldungen wie „Manual pairing already in progress" oder ein Gerät im Zustand „unavailable" lösen sich meist durch Neustart von iPhone und Xcode. In neueren Xcode-Versionen liegt die Geräteliste unter der Zielauswahl → „Manage Devices…".
- **Bundle-ID-Auswahl leer:** App-ID von Hand registrieren (siehe Ablauf, Schritt 5).
- **Kinder-Kategorie:** Die Entscheidung ist nicht rücknehmbar. Vor der Einreichung bewusst treffen.

## Website und Rechtstexte

- Apple verlangt eine Support-URL und eine Datenschutz-URL. Vier statische Seiten genügen: Start, Hilfe, Datenschutz, Impressum.
- Keine Cookies, kein Tracking, Schriften und Bilder vom eigenen Server. Dann braucht die Seite kein Cookie-Banner.
- Datenschutzseite in zwei Teilen: die App (was sie auf dem Gerät speichert, was sie nicht tut, wie man löscht) und die Website (Hosting, Server-Protokolle, Kontakt per E-Mail).
- Hoster als Auftragsverarbeiter nennen (Art. 28 DSGVO). Bei Hostinger ist der Zusatz zur Datenverarbeitung Bestandteil der Nutzungsbedingungen und braucht keine eigene Unterschrift; die Seite als PDF zum Nachweis ablegen.
- Eigene Kontaktadresse für die App einrichten und vor der Einreichung mit einer Testmail prüfen.
- Rechtstexte sind Vorlagen und keine Rechtsberatung.

## Vor der Einreichung prüfen

- [ ] Alle Tests grün.
- [ ] App auf einem echten Gerät komplett durchgespielt, auch seltene Wege (Profil löschen, Wechsel zwischen Profilen, Einstellungen).
- [ ] Screenshots in den Pflichtgrößen, ohne Alpha-Kanal.
- [ ] Support- und Datenschutz-URL erreichbar.
- [ ] Prüfnotizen auf Englisch mit den sechs Angaben, Bildschirmvideo angehängt.
- [ ] Händlerstatus angegeben.
- [ ] Veröffentlichung auf „manuell".
- [ ] Projekt in Git gesichert.
