import Foundation

struct FaqRecords: Codable {
    let records: [FaqRecord]
}

struct FaqRecord: Codable {
    let id: String?
    let createdTime: String?
    let fields: FaqFields
}

struct FaqFields: Identifiable, Codable {
    var id: String? {
        UUID().uuidString
    }
    let question: String
    let answer: String
    let order: Int
}
