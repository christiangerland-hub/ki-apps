# Plan C: KI-gebaute iPhone-Apps im Apple App Store (Ziel 1.000 €/Woche)

Stand: 19.11.2026 · Status: freigegeben · Lebende Fassung: [Claude Doc](https://claude.ai/artifact/6CxTDcxTqZ2UaHCa87SMAY)

## Context
Nach Plan A (digitale Vorlagen) und Plan B (physische Produkte über Amazon) will Christian eine Variante mit **eigenen Apps im Apple App Store**.
Rahmen: deutsches Recht, neben ARRI machbar (11–15 h/Woche), Business-Hintergrund (kein Entwickler), 500–2.000 € Budget, keine Haftung beim Einstellen.
Arbeitsteilung: **Ich schreibe den gesamten App-Code.** Christian testet, besitzt die Konten und Verträge und bringt das Fachwissen über die Nutzer ein.

**Ehrliche Einordnung:** 1.000 €/Woche ≈ 4.300 €/Monat. Nach Apples Provision (15 %) wären das z. B. ca. 1.000 zahlende Abonnenten à 4,99 €/Monat. Die meisten Apps verdienen kaum etwas. Deshalb setzen wir auf mehrere kleine Apps mit klaren Abbruchkriterien. Gewinn ist hier ≈ Umsatz minus 15 % minus Steuern, weil es kaum laufende Kosten gibt. Das ist ein Vorteil gegenüber Plan B.

## Warum das gut zu den Bedingungen passt
- **Wenig Haftung beim Einstellen:** kein Lager, keine Server, keine Kundenverträge mit Christian. Apple verkauft an den Kunden. Nach dem EuGH-Urteil „Xyrality“ (C-101/24, 09.10.2025) gilt der App Store als Leistender gegenüber dem Endkunden. Wichtig: Apple führt für in Deutschland ansässige Entwickler **keine** Steuer für sie ab (Apple Schedule 2/3, deutsche Fassung). Die Umsatzsteuer klären wir deshalb mit dem Steuerberater. Zum Einstellen: App aus dem Verkauf nehmen, Abos auslaufen lassen, Gewerbe abmelden.
- **Wenig Kapital:** Apple Developer Program 99 USD/Jahr (bzw. Preis in lokaler Währung). Provision **15 %** im App Store Small Business Program (Vorjahresumsatz ≤ 1 Mio. USD).
- **Kein Mac nötig:** Mit Expo (React Native) und dem EAS-Cloud-Build lassen sich iOS-Apps unter Linux/Windows bauen und an den App Store senden. Getestet wird auf einem echten iPhone per TestFlight (Expo-Doku). **Voraussetzung: Christian hat ein iPhone.**

## Produktstrategie
**Kleine, fokussierte Business-Utility-Apps für deutsche Nutzer**, die lokal auf dem Gerät laufen: keine Konten, kein Server, keine Datenübertragung.
- Beispiele für Nischen (Auswahl per Recherche in Woche 1): Angebots-/Kalkulationshelfer für eine bestimmte Branche, Meeting-/Protokoll-Tool, Checklisten-Apps für Selbstständige, Verhandlungs- oder Einkaufs-Rechner. Christians Business-Wissen bestimmt die Nische.
- **Meiden:** Apps, deren Ergebnis steuerliche oder rechtliche Folgen hat (z. B. Fahrtenbuch fürs Finanzamt), Gesundheitsdaten, Kinder-Apps, Apps mit Bezug zu Film, Kamera oder ARRI.
- **Monetarisierung:** gratis laden, dann Abo (2,99–6,99 €/Monat) oder Einmalkauf „Pro“ (9,99–29,99 €).
- **Portfolio-Ansatz:** App 1 in 6–8 Wochen. Danach alle 4–6 Wochen eine weitere App oder ein großes Update. Was funktioniert, wird ausgebaut, der Rest wird eingestellt.
- **KI-Funktionen in der App erst später** und möglichst auf dem Gerät (z. B. Apples On-Device-Modelle, Verfügbarkeit prüfen). So entstehen keine API-Kosten, keine Datenübermittlung in die USA, und die Pflichten aus Art. 50 AI Act bleiben gering.

## Recht und Haftung

| Thema | Lösung | Quelle |
|---|---|---|
| Nebentätigkeit | ARRI-Vertrag prüfen und ARRI informieren. Nur private Geräte und Freizeit. Kein inhaltlicher Bezug zur ARRI-Arbeit. Software, die ein Arbeitnehmer „in Wahrnehmung seiner Aufgaben“ schafft, gehört dem Arbeitgeber (§ 69b UrhG). | § 60 HGB, IHK Darmstadt |
| Händlerstatus (DSA) | Bei Bezahl-Apps ist man „Trader“. Apple veröffentlicht **Adresse, Telefon und E-Mail** auf der Produktseite (DSA Art. 30/31). → Geschäftsadresse und separate Nummer nutzen, um die Privatadresse zu schützen (ca. 10–30 €/Monat, Anbieter vor Abschluss vergleichen). | Apple App Store Connect Help |
| Rechtsform | **Einzelunternehmen** reicht, weil kein Lager, keine Server und keine Kundenverträge anfallen. Eine UG erst bei hohem Umsatz oder riskanteren Funktionen. | |
| Produkthaftung | Das neue ProdHaftG (ab 09.12.2026) erfasst auch Software. Es geht um Personen-, Sach- und Datenschäden. Risiko gering halten: keine sicherheitskritischen Funktionen, sauberes Testen, Daten nur lokal mit Export-Funktion. | IHK Frankfurt |
| DSGVO | Datenschutzerklärung und Apples „App Privacy“-Angaben. Ohne Analytics-SDKs und ohne Server fast keine Datenverarbeitung durch uns. | |
| Impressum | Impressum (§ 5 DDG) in der App und auf der Support-Website | |
| Umsatzsteuer | Kleinunternehmergrenze 25.000 € (Gründungsjahr bzw. Vorjahr) wird beim Ziel überschritten. Behandlung der Apple-Umsätze (Xyrality) mit dem Steuerberater klären. | § 19 UStG, IHK München, EuGH C-101/24 |

## Technik (von mir umgesetzt)
- Expo / React Native (TypeScript), lokale Speicherung (SQLite), In-App-Käufe über RevenueCat oder StoreKit (vor dem Start entscheiden).
- **Code in einem privaten GitHub-Repo von Christian.** Mein Container ist flüchtig, deshalb wird jede Arbeit dort gepusht.
- EAS Build und Submit in der Cloud. Christian testet per TestFlight auf dem iPhone.
- Support-/Datenschutz-Website als einfache statische Seite.

## Budget (≈ 600–900 € im ersten Jahr)
Apple Developer 99 USD/Jahr · Geschäftsadresse ~15 €/Monat · Steuerberater-Erstgespräch ~250 € · Domain ~15 €/Jahr · Expo Free-Tier (bei Bedarf Bezahl-Tarif) · Apple Search Ads 200–400 € erst nach Produktvalidierung.

## Meilensteine und Abbruchkriterien
1. **Woche 1–2:** Christian: ARRI informieren, Gewerbe anmelden, Geschäftsadresse besorgen, Apple Developer Account und GitHub/Expo-Account anlegen. Ich: 3 Nischen-Kandidaten mit Belegen (Konkurrenz-Apps, Bewertungen, Preise, Suchbegriffe). Christian wählt aus.
2. **Woche 3–8:** Ich baue App 1 (MVP). Christian testet wöchentlich per TestFlight und gibt Feedback. Store-Texte und Screenshots von mir, Freigabe durch Christian. **Ziel: App live, erster zahlender Nutzer.**
3. **Monat 3–6:** App Store Optimierung, Updates nach Bewertungen, App 2 und 3. **Ziel: 500 €/Monat.**
4. **Monat 7–12:** Gewinner ausbauen (Abo-Features, ggf. Android über denselben Expo-Code). **Ziel: 1.000 €/Woche.**

**Kill-Kriterien:** App nach 8 Wochen live ohne zahlende Nutzer → Paywall/Preis anpassen, nach weiteren 4 Wochen ohne Erfolg einstellen. Portfolio nach 6 Monaten unter 300 €/Monat → Projekt geordnet beenden: Apps entfernen, Abos auslaufen lassen, Apple-Mitgliedschaft nicht verlängern, Gewerbe abmelden.

## Aufgabenteilung
- **Ich:** Recherche, gesamter Code, Tests, Store-Texte, Screenshots-Entwürfe, Datenschutz-/Support-Seite, Update-Planung, KPI-Auswertung.
- **Christian (~11–15 h):** Testen auf dem iPhone (~4 h), Fachfeedback und Nutzerinterviews mit 3–5 Bekannten aus der Zielgruppe (~3 h), App Store Connect/Konten/Freigaben (~2 h), Behörden und Steuer (~1 h), Support-Mails und Bewertungen beantworten (~2 h).

## Lieferung nach Freigabe
1. Businessplan C als Claude Doc mit Quellen, auf Wunsch mit einer Vergleichstabelle A/B/C.
2. Aufgabenliste Woche 1–2.
3. Start der Nischenrecherche für App 1.

## Verifikation
- Vor dem Start im Original prüfen: Apple-Preise, Small Business Program, DSA-Trader-Hilfe, Apple-Vertragsanhang Schedule 2, Expo-Doku.
- Steuerberater: Umsatzsteuer bei App-Store-Umsätzen, Einkommensteuer neben dem Gehalt.
- Technisch: Jede Version läuft vor dem Einreichen per TestFlight auf Christians iPhone. Checkliste der App Review Guidelines.

## Quellen
- Apple, Mitgliedschaften/Preis: https://developer.apple.com/support/compare-memberships
- Apple, Small Business Program: https://developer.apple.com/app-store/small-business-program/
- Apple, DSA-Trader-Anforderungen: https://developer.apple.com/help/app-store-connect/manage-compliance-information/manage-european-union-digital-services-act-trader-requirements
- MacRumors, Trader-Kontaktdaten öffentlich: https://www.macrumors.com/2024/10/17/developers-eu-app-store-trader-requirements/
- Apple Schedule 2/3 (deutsch): https://developer.apple.com/support/downloads/terms/exhibits/Exhibits-to-Schedule-2-and-3-German.pdf
- Grant Thornton zu EuGH C-101/24 Xyrality: https://www.grantthornton.de/themen/2025/umsatzsteuer-eugh-urteil-xyrality-c-10124-zu-dienstleistungskommission-und-unzutreffendem-steuerausweis/
- Expo, iOS Submit: https://docs.expo.dev/submit/ios
- IHK Frankfurt, Produkthaftung 2026: https://www.frankfurt-main.ihk.de/recht/uebersicht-alle-rechtsthemen/vertragsrecht-und-e-commerce-recht/uebersicht/neue-regelungen-zur-produkthaftung-2026-7177184
- IHK München, Kleinunternehmer: https://www.ihk-muenchen.de/ratgeber/steuern/umsatzsteuer/kleinunternehmerregelung/
- IHK Darmstadt, Nebentätigkeit: https://www.ihk.de/darmstadt/produktmarken/recht-und-fair-play/arbeitsrecht/arbeitsrecht/informationen-zu-besonderen-arbeitsrechtsthemen/wettbewerbsverbot/nebentaetigkeit-und-wettbewerbsverbot-2564024
- § 69b UrhG: https://www.gesetze-im-internet.de/urhg/__69b.html
