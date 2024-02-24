import Foundation

struct FeedbackRecords: Codable {
    let records: [FeedbackRecord]
}

struct FeedbackRecord: Codable {
    let id: String?
    let createdTime: String?
    let fields: FeedbackFields
}

struct FeedbackFields: Identifiable, Codable {
    var id: String? {
        UUID().uuidString
    }
    let firstName: String
    let email: String
    let feedback: String?
    let rating: Int
}
