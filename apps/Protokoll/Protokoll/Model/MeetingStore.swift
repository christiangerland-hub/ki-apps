import Foundation
import Observation

/// Hält alle Besprechungen und speichert sie als JSON in Application Support.
@MainActor
@Observable
final class MeetingStore {
    /// Anzahl Besprechungen, die ohne Pro angelegt werden können.
    static let freeMeetingLimit = 3

    private(set) var meetings: [Meeting] = []
    private(set) var lastError: String?

    private let fileURL: URL

    /// - Parameter fileURL: Speicherort. Standard: Application Support/meetings.json.
    init(fileURL: URL? = nil) {
        self.fileURL = fileURL ?? MeetingStore.defaultFileURL()
        load()
    }

    static func defaultFileURL() -> URL {
        let base = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
            ?? FileManager.default.temporaryDirectory
        return base.appendingPathComponent("meetings.json")
    }

    // MARK: Abfragen

    /// Besprechungen, neueste zuerst.
    var sortedMeetings: [Meeting] {
        meetings.sorted { $0.date > $1.date }
    }

    func meeting(id: UUID) -> Meeting? {
        meetings.first { $0.id == id }
    }

    /// Alle offenen Aufgaben über alle Besprechungen: mit Termin aufsteigend, ohne Termin am Ende.
    var openTasks: [OpenTask] {
        meetings
            .flatMap { meeting in
                meeting.tasks
                    .filter { !$0.isDone }
                    .map { OpenTask(meetingID: meeting.id, meetingTitle: meeting.displayTitle, task: $0) }
            }
            .sorted { lhs, rhs in
                switch (lhs.task.dueDate, rhs.task.dueDate) {
                case let (l?, r?): return l < r
                case (.some, .none): return true
                case (.none, .some): return false
                case (.none, .none): return lhs.task.text.localizedCompare(rhs.task.text) == .orderedAscending
                }
            }
    }

    func canCreateMeeting(isPro: Bool) -> Bool {
        isPro || meetings.count < MeetingStore.freeMeetingLimit
    }

    // MARK: Änderungen

    /// Legt eine neue Besprechung an und gibt sie zurück, oder `nil`, wenn die Gratis-Grenze erreicht ist.
    @discardableResult
    func createMeeting(isPro: Bool, now: Date = Date()) -> Meeting? {
        guard canCreateMeeting(isPro: isPro) else { return nil }
        let meeting = Meeting(date: now)
        meetings.append(meeting)
        save()
        return meeting
    }

    func update(_ meeting: Meeting) {
        guard let index = meetings.firstIndex(where: { $0.id == meeting.id }) else { return }
        meetings[index] = meeting
        save()
    }

    func delete(id: UUID) {
        meetings.removeAll { $0.id == id }
        save()
    }

    func setTask(_ taskID: UUID, inMeeting meetingID: UUID, done: Bool) {
        guard var meeting = meeting(id: meetingID),
              let index = meeting.tasks.firstIndex(where: { $0.id == taskID }) else { return }
        meeting.tasks[index].isDone = done
        update(meeting)
    }

    // MARK: Speichern

    private func load() {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return }
        do {
            let data = try Data(contentsOf: fileURL)
            meetings = try MeetingStore.decoder.decode([Meeting].self, from: data)
        } catch {
            lastError = "Daten konnten nicht geladen werden: \(error.localizedDescription)"
        }
    }

    private func save() {
        do {
            try FileManager.default.createDirectory(
                at: fileURL.deletingLastPathComponent(), withIntermediateDirectories: true)
            let data = try MeetingStore.encoder.encode(meetings)
            try data.write(to: fileURL, options: [.atomic])
            lastError = nil
        } catch {
            lastError = "Daten konnten nicht gespeichert werden: \(error.localizedDescription)"
        }
    }

    private static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        return encoder
    }()

    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}

/// Eine offene Aufgabe mit Bezug zu ihrer Besprechung.
struct OpenTask: Identifiable, Hashable {
    let meetingID: UUID
    let meetingTitle: String
    let task: ActionItem
    var id: UUID { task.id }
}
