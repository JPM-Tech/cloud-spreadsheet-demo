import Foundation

struct ProductRecords: Codable {
    let records: [ProductRecord]
}

struct ProductRecord: Codable {
    let id: String?
    let createdTime: String?
    let fields: ProductFields
}

struct ProductFields: Identifiable, Codable {
    var id: String? {
        UUID().uuidString
    }
    let name: String
    let description: String
    let price: Double
    let image: [AirTableAttachment]?
    let inStock: Bool?
    
    var imageLink: URL? {
        guard let attachment = image else {return nil}
        guard let firstImage = attachment.first else {return nil}
        return URL(string: firstImage.url)
    }
}

