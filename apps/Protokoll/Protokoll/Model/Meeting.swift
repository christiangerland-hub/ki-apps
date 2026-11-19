import Foundation

/// Eine Besprechung mit Tagesordnung und Aufgaben.
struct Meeting: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var title: String = ""
    var date: Date = Date()
    var location: String = ""
    var participants: [String] = []
    var agenda: [AgendaItem] = []
    var tasks: [ActionItem] = []

    var displayTitle: String {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? "Ohne Titel" : trimmed
    }

    var openTaskCount: Int {
        tasks.filter { !$0.isDone }.count
    }
}

/// Ein Tagesordnungspunkt mit Notizen und Entscheidungen.
struct AgendaItem: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var title: String = ""
    var notes: String = ""
    var decisions: [String] = []
}

/// Eine Aufgabe: Was, Wer, Bis wann.
struct ActionItem: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var text: String = ""
    var owner: String = ""
    var dueDate: Date?
    var isDone: Bool = false
}
