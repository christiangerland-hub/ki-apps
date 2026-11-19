# Lastenheft: App 1 „Diktiergerät mit Protokollausgabe“ (Arbeitstitel)

| | |
|---|---|
| Stand | 19.11.2026, Version 0.1 (Entwurf) |
| Auftraggeber | Christian |
| Ersteller | Claude |
| Status | zur Freigabe durch Christian |
| Ersetzt | Umfang 1.0 in `spezifikation.md` (Datenmodell, Export und Preisrechnung gelten weiter) |

Das Lastenheft beschreibt, **was** die App leisten soll. Das „Wie“ kommt danach in ein Pflichtenheft (technische Umsetzung).

---

## 1. Zielsetzung
Eine iPhone-App, die gesprochene Inhalte **auf dem Gerät** in Text umwandelt und daraus ein strukturiertes Protokoll macht: Notizen, Entscheidungen, Aufgaben mit Zuständigem und Termin. Export als PDF oder Text.

Die App wird als **Diktiergerät mit Protokollausgabe** vermarktet. Hauptfall: Der Nutzer diktiert selbst, z. B. direkt nach einer Besprechung. Die Aufnahme einer Besprechung mit anderen ist ein Zusatzmodus und nur mit Einwilligungsschritt möglich.

## 2. Rechtlicher Rahmen und Folgen für das Produkt

### 2.1 Kernaussage
**Die Bezeichnung „Diktiergerät“ allein macht die App nicht rechtlich sauber.** Strafbar ist das *Verhalten* des Nutzers, nicht das Etikett. Wer das nichtöffentlich gesprochene Wort eines anderen unbefugt auf einen Tonträger aufnimmt, wird mit Freiheitsstrafe bis zu drei Jahren oder Geldstrafe bestraft ([§ 201 Abs. 1 Nr. 1 StGB](https://www.gesetze-im-internet.de/stgb/__201.html)). Schon der Versuch ist strafbar (§ 201 Abs. 4 StGB).

Rechtlich sauber wird das Produkt durch drei Dinge:
1. **Positionierung:** Der Hauptfall ist das Diktat der eigenen Stimme. Die eigene Stimme ist nicht „das Wort eines anderen“, § 201 Abs. 1 Nr. 1 StGB greift dann nicht. Sprechen andere im Raum mit, ist es kein reines Diktat mehr. Dann gilt der Besprechungsmodus, und die App weist im Diktatmodus darauf hin.
2. **Gestaltung:** Die App kann nichts heimlich aufnehmen (Anforderungen in Abschnitt 4.3).
3. **Kommunikation:** Kein Marketing, das zum heimlichen Mitschnitt einlädt (Abschnitt 6).

### 2.2 Transkription ohne gespeichertes Audio
- Fachbeiträge halten eine reine Live-Transkription ohne Tonaufnahme für grundsätzlich nicht von § 201 StGB erfasst. Die meisten Werkzeuge puffern das Audio aber, und das kann bereits als Aufnahme gelten ([Lutz Abel](https://www.lutzabel.com/en/article/ai-transcription-of-meetings-data-protection-section-201-of-the-german-criminal-code-stgb-and-the-limits-of-consent/), [Heuking](https://www.heuking.de/de/news-events/newsletter-fachbeitraege/artikel/rechtssicherer-einsatz-von-ki-transkriptionstools-in-unternehmen.html)).
- Eine höchstrichterliche Entscheidung dazu habe ich nicht gefunden. **Die Frage ist nicht geklärt.**
- **Folge für das Produkt:** Wir verlassen uns nicht auf „kein Audio gespeichert“. Bei Gesprächen mit anderen ist die Einwilligung aller Beteiligten immer Pflicht. Kein Audio dauerhaft zu speichern, ist zusätzlich die Voreinstellung.

### 2.3 Einwilligung
Die Einwilligung aller Beteiligten schließt die Strafbarkeit aus („unbefugt“). Ob ein Hinweis zu Beginn genügt oder eine ausdrückliche Zustimmung nötig ist, beurteilen die Quellen unterschiedlich ([Dr. Datenschutz](https://www.dr-datenschutz.de/ki-transkription-im-meeting/), [GDD-Kurzpapier](https://www.gdd.de/wp-content/uploads/2026/01/GDD-Kurzpapier-4-Gespraechstranskription.pdf)). → Die App fordert die **ausdrückliche** Bestätigung, also die strengere Variante.

### 2.4 Datenschutz (DSGVO)
- Stimmen und Inhalte anderer Personen sind personenbezogene Daten. Der Nutzer ist dafür verantwortlich, wenn er die App beruflich nutzt. Rein persönliche oder familiäre Nutzung fällt nicht unter die DSGVO (Art. 2 Abs. 2 lit. c DSGVO).
- Wir als Anbieter erhalten keine Daten, weil alles auf dem Gerät bleibt. Das muss technisch stimmen und in der Datenschutzerklärung stehen.

### 2.5 Apple-Vorgaben
- Für Aufnahmen verlangen die App Review Guidelines eine ausdrückliche Einwilligung des Nutzers und eine deutliche optische und/oder akustische Anzeige während der Aufnahme (Guideline 2.5.14, Wortlaut nur über [Sekundärquellen](https://developer.apple.com/forums/thread/654120) geprüft, vor der Einreichung im [Original](https://developer.apple.com/app-store/review/guidelines/) nachlesen).
- Für den Mikrofonzugriff braucht die App einen Hinweistext (`NSMicrophoneUsageDescription`) und für die Spracherkennung einen weiteren (`NSSpeechRecognitionUsageDescription`). iOS zeigt bei aktivem Mikrofon zusätzlich einen Indikator an.

### 2.6 Haftung des Anbieters
Allgemeine Aufnahme-Apps sind üblich und erlaubt, z. B. Apples Sprachmemos. Ein Risiko für uns entsteht vor allem, wenn wir heimliches Aufnehmen bewerben oder technisch ermöglichen. Beides schließt dieses Lastenheft aus. **Keine Rechtsberatung.** Vor der Veröffentlichung sollte ein Fachanwalt für IT- oder Strafrecht die Abschnitte 2, 4.3 und 6 kurz prüfen.

## 3. Nutzer und Anwendungsfälle

| Nr. | Anwendungsfall | Wer spricht | Rechtliche Lage |
|---|---|---|---|
| AF-1 | Nach einer Besprechung das Wichtigste diktieren → Protokoll | nur der Nutzer | unkritisch (eigene Stimme) |
| AF-2 | Gedanken, Notizen, To-dos unterwegs diktieren | nur der Nutzer | unkritisch |
| AF-3 | Besprechung mit anderen live mitschreiben lassen | mehrere | nur mit Einwilligung aller (Abschnitt 4.3) |
| AF-4 | Protokoll ergänzen, korrigieren, als PDF teilen | – | unkritisch |

Zielgruppe: Selbstständige, Berater, Teamleiter in kleinen Firmen, Vereinsvorstände, Handwerker (Baustellennotizen).

## 4. Funktionale Anforderungen
Priorität: **M** = Muss (Version 1.0), **S** = Soll, **K** = Kann (später).

### 4.1 Diktat und Transkription
| ID | Anforderung | Prio |
|---|---|---|
| LF-01 | Diktat per Start/Stopp-Taste. Der Text erscheint live auf dem Bildschirm. | M |
| LF-02 | Spracherkennung **ausschließlich auf dem Gerät**, Deutsch als erste Sprache. Ohne Internet nutzbar. | M |
| LF-03 | Ist die Spracherkennung auf dem Gerät nicht verfügbar (Gerät, Sprache), weist die App klar darauf hin. Dann gibt es nur manuelle Eingabe, **keinen** Wechsel zu einer Server-Erkennung. | M |
| LF-04 | Diktat pausieren und fortsetzen | S |
| LF-05 | Sprachbefehle beim Diktat, z. B. „neue Aufgabe“, „Entscheidung“ | K |

### 4.2 Protokoll
| ID | Anforderung | Prio |
|---|---|---|
| LF-10 | Protokoll mit Titel, Datum und Uhrzeit, Ort, Teilnehmern (Namen) | M |
| LF-11 | Text in Abschnitte gliedern: Notizen, Entscheidungen, Aufgaben (Was, Wer, Bis wann) | M |
| LF-12 | Aufgaben abhaken. Übersicht aller offenen Aufgaben über alle Protokolle, nach Fälligkeit sortiert | M |
| LF-13 | Text jederzeit von Hand bearbeiten | M |
| LF-14 | Automatischer Strukturvorschlag aus dem Transkript (Entscheidungen und Aufgaben erkennen), auf dem Gerät. Der Nutzer bestätigt jeden Vorschlag. | S |
| LF-15 | Vorlagen (z. B. Teambesprechung, Baustellenbegehung, Vorstandssitzung) | K |

### 4.3 Besprechungsmodus (Gespräche mit anderen)
| ID | Anforderung | Prio |
|---|---|---|
| LF-20 | Vor jedem Start im Besprechungsmodus ein **Einwilligungsschritt**: Hinweistext zu § 201 StGB in einfacher Sprache und Pflicht-Bestätigung „Alle Anwesenden wurden informiert und haben zugestimmt“. Ohne Bestätigung kein Start. | M |
| LF-21 | Optional: vorformulierter Ansagetext zum Vorlesen („Ich lasse unser Gespräch zur Protokollerstellung mitschreiben. Ist das für alle in Ordnung?“) | S |
| LF-22 | Die Bestätigung wird mit Uhrzeit im Protokoll vermerkt („Einwilligung bestätigt um 14:03 Uhr“) | M |
| LF-23 | Während der Aufnahme eine **deutliche, nicht abschaltbare** Anzeige: rot pulsierender Rahmen und Laufzeit. Bildschirm wird nicht abgedunkelt oder ausgeblendet. | M |
| LF-24 | **Kein** Tarnmodus, **kein** schwarzer Bildschirm, **kein** Start über Kurzbefehl, Widget oder Sperrbildschirm ohne sichtbare App, **keine** Fernauslösung | M |
| LF-25 | Aufnahme im Hintergrund oder bei gesperrtem Bildschirm ist nicht möglich: Beim Verlassen der App stoppt sie (iOS-Systemanzeige für das Mikrofon bleibt davon unberührt) | M |
| LF-26 | Jeder Teilnehmer kann jederzeit widersprechen: große Stopp-Taste, die das bisherige Transkript auf Wunsch sofort verwirft | M |

### 4.4 Audio und Speicherung
| ID | Anforderung | Prio |
|---|---|---|
| LF-30 | Voreinstellung: **Audio wird nicht gespeichert**, nur der Text. Audio wird ausschließlich flüchtig zur Erkennung verarbeitet. | M |
| LF-31 | Optional im Diktatmodus: Audio des eigenen Diktats zum Nachhören behalten. Im Besprechungsmodus nur nach erneutem, gesondertem Hinweis. | K |
| LF-32 | Alle Daten nur lokal auf dem Gerät. Kein Konto, kein Server, keine Analyse-Werkzeuge, keine Werbung. | M |
| LF-33 | Einzelne Protokolle und alle Daten löschbar | M |

### 4.5 Export
| ID | Anforderung | Prio |
|---|---|---|
| LF-40 | Export als PDF (A4) und als Text über das iOS-Teilen-Menü | M |
| LF-41 | Im Export erscheint bei Besprechungen der Einwilligungsvermerk (LF-22) | M |
| LF-42 | Export als Word-Datei | K |

### 4.6 Bezahlung
| ID | Anforderung | Prio |
|---|---|---|
| LF-50 | Gratis: unbegrenzt manuelle Protokolle, 3 Diktate oder Besprechungen | M |
| LF-51 | „Pro“ als Einmalkauf über StoreKit 2 (Preisvorschlag 14,99 €): unbegrenztes Diktat, Besprechungsmodus, PDF ohne Hinweiszeile | M |
| LF-52 | Käufe wiederherstellen | M |
| LF-53 | Abo erst mit laufendem Zusatznutzen (z. B. Vorlagen, Strukturvorschlag) | K |

## 5. Nicht-funktionale Anforderungen
| ID | Anforderung | Prio |
|---|---|---|
| NF-01 | iPhone, Deutsch. Mindestversion richtet sich nach der Spracherkennung auf dem Gerät: Apples SpeechAnalyzer/SpeechTranscriber gibt es ab iOS 26, Deutsch laut [Sekundärquelle](https://blog.addpipe.com/apple-speechanalyzer-api/) unterstützt. Vor dem Bau mit `supportedLocales` auf einem echten Gerät prüfen. | M |
| NF-02 | Funktioniert vollständig offline | M |
| NF-03 | Live-Text erscheint mit höchstens ca. 2 Sekunden Verzögerung (Zielwert, auf einem echten Gerät messen) | S |
| NF-04 | Kein Datenverlust bei Absturz oder Anruf: Das Transkript wird laufend gesichert | M |
| NF-05 | Barrierefreiheit: Dynamic Type, VoiceOver-Beschriftungen, ausreichende Kontraste | M |
| NF-06 | Technik nach `docs/leitfaden-ios-app-store.md`: SwiftUI, keine externen Abhängigkeiten, Logik mit Tests | M |
| NF-07 | Datenschutzseite, Hilfe und Impressum im Web, App Privacy „Keine Daten erfasst“ | M |

## 6. Vermarktung: Leitplanken

**Erlaubte Botschaften (Beispiele):**
- „Diktieren statt tippen: Ihr Protokoll in Minuten“
- „Alles bleibt auf Ihrem iPhone: keine Cloud, kein Konto“
- „Besprechungen mitschreiben, transparent und mit Einwilligung aller“

**Verboten in Store-Texten, Screenshots, Werbung, Stichwörtern:**
- „heimlich“, „unbemerkt“, „verdeckt“, „Spion“, „Beweise sichern“, „Gespräche mitschneiden, ohne dass es jemand merkt“
- Bilder, die verdeckte Aufnahmen zeigen (Handy unter dem Tisch usw.)
- Versprechen, die App sei „rechtssicher“ oder „DSGVO-konform“ für jeden Einsatz

## 7. Abgrenzung (nicht Teil des Projekts)
Telefonaufnahmen, Aufnahme von Videocalls (Teams, Zoom), Cloud-Transkription, Sprecher-Erkennung mit Namen, iCloud-Sync, iPad und Mac, andere Sprachen als Deutsch.

## 8. Abnahmekriterien Version 1.0
1. Alle Muss-Anforderungen erfüllt und auf einem echten iPhone geprüft.
2. Test: Im Besprechungsmodus ist ohne Bestätigung kein Start möglich (LF-20).
3. Test: Während einer Aufnahme ist die Anzeige immer sichtbar. Beim Verlassen der App stoppt die Aufnahme (LF-23, LF-25).
4. Test: Im Flugmodus funktionieren Diktat und Export (LF-02, NF-02).
5. Test: Nach Diktat und Export liegt keine Audiodatei in den App-Daten (LF-30).
6. Store-Texte gegen Abschnitt 6 geprüft.
7. Alle automatisierten Tests grün, Checkliste aus dem Leitfaden abgearbeitet.

## 9. Offene Punkte
| # | Punkt | Wer |
|---|---|---|
| 1 | Name und Markenrecherche (DPMA, App Store) | Christian, Claude recherchiert |
| 2 | Deutsche Spracherkennung auf dem Gerät mit Christians iPhone prüfen (Modell, iOS-Version) | Christian |
| 3 | Kurze Prüfung von Abschnitt 2, 4.3 und 6 durch einen Fachanwalt vor der Veröffentlichung | Christian |
| 4 | Wortlaut Guideline 2.5.14 im Original prüfen | Claude |
| 5 | Nebentätigkeit (zurückgestellt): vor Veröffentlichung klären | Christian |

## Quellen
- [§ 201 StGB (gesetze-im-internet.de)](https://www.gesetze-im-internet.de/stgb/__201.html)
- [Lutz Abel: AI Transcription of Meetings and Section 201 StGB](https://www.lutzabel.com/en/article/ai-transcription-of-meetings-data-protection-section-201-of-the-german-criminal-code-stgb-and-the-limits-of-consent/)
- [Heuking: Rechtssicherer Einsatz von KI-Transkriptionstools (30.04.2026)](https://www.heuking.de/de/news-events/newsletter-fachbeitraege/artikel/rechtssicherer-einsatz-von-ki-transkriptionstools-in-unternehmen.html)
- [GDD-Kurzpapier 4: Gesprächstranskription](https://www.gdd.de/wp-content/uploads/2026/01/GDD-Kurzpapier-4-Gespraechstranskription.pdf)
- [Dr. Datenschutz: KI-Transkription im Meeting](https://www.dr-datenschutz.de/ki-transkription-im-meeting/)
- [Apple App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/), Diskussion zu 2.5.14 im [Apple-Forum](https://developer.apple.com/forums/thread/654120)
- [Apple WWDC25: SpeechAnalyzer](https://developer.apple.com/videos/play/wwdc2025/277/), [addpipe: SpeechAnalyzer-Überblick](https://blog.addpipe.com/apple-speechanalyzer-api/)

Hinweis: Die Fachbeiträge habe ich nur als Suchergebnis gesehen, nicht vollständig gelesen. Keine Rechtsberatung.
