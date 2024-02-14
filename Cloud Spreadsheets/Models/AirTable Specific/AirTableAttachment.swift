import Foundation

struct AirTableAttachment: Identifiable, Codable {
    let id: String
    let width: Int
    let height: Int
    let url: String
    let fileName: String?
    let size: Int?
    let type: String?
    let thumbnails: Thumbnails?
}

struct Thumbnails: Codable {
    let small: ThumbnailFields
    let large: ThumbnailFields
    let full: ThumbnailFields
}

struct ThumbnailFields: Codable {
    let url: String?
    let width: Int?
    let height: Int?
}
