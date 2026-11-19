import Foundation

/// Erzeugt das Protokoll einer Besprechung als Text.
struct ProtocolTextExporter {
    var locale: Locale = Locale(identifier: "de_DE")
    var timeZone: TimeZone = .current

    func text(for meeting: Meeting) -> String {
        var lines: [String] = []
        lines.append("Protokoll: \(meeting.displayTitle)")
        lines.append("Datum: \(dateTimeString(meeting.date))")

        let location = meeting.location.trimmingCharacters(in: .whitespacesAndNewlines)
        if !location.isEmpty {
            lines.append("Ort: \(location)")
        }

        let participants = meeting.participants
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
        if !participants.isEmpty {
            lines.append("Teilnehmer: \(participants.joined(separator: ", "))")
        }

        if !meeting.agenda.isEmpty {
            lines.append("")
            lines.append("TAGESORDNUNG")
            for (index, item) in meeting.agenda.enumerated() {
                let title = item.title.trimmingCharacters(in: .whitespacesAndNewlines)
                lines.append("\(index + 1). \(title.isEmpty ? "Ohne Titel" : title)")
                let notes = item.notes.trimmingCharacters(in: .whitespacesAndNewlines)
                if !notes.isEmpty {
                    for noteLine in notes.components(separatedBy: .newlines) {
                        lines.append("   \(noteLine)")
                    }
                }
                for decision in item.decisions where !decision.trimmingCharacters(in: .whitespaces).isEmpty {
                    lines.append("   Entscheidung: \(decision.trimmingCharacters(in: .whitespaces))")
                }
            }
        }

        if !meeting.tasks.isEmpty {
            lines.append("")
            lines.append("AUFGABEN")
            for task in meeting.tasks {
                var line = "[\(task.isDone ? "x" : " ")] \(task.text.trimmingCharacters(in: .whitespaces))"
                let owner = task.owner.trimmingCharacters(in: .whitespaces)
                if !owner.isEmpty { line += " – \(owner)" }
                if let due = task.dueDate { line += " – bis \(dateString(due))" }
                lines.append(line)
            }
        }

        return lines.joined(separator: "\n") + "\n"
    }

    func fileName(for meeting: Meeting) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = timeZone
        formatter.dateFormat = "yyyy-MM-dd"
        let allowed = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "-_ "))
        let safeTitle = String(meeting.displayTitle.unicodeScalars.filter { allowed.contains($0) })
            .trimmingCharacters(in: .whitespaces)
        return "Protokoll \(formatter.string(from: meeting.date)) \(safeTitle)"
            .trimmingCharacters(in: .whitespaces)
    }

    private func dateTimeString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.timeZone = timeZone
        formatter.dateFormat = "dd.MM.yyyy, HH:mm"
        return formatter.string(from: date) + " Uhr"
    }

    private func dateString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.timeZone = timeZone
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
