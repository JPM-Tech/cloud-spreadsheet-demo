//
//  Record.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 2/6/24.
//

import Foundation

//struct Records: Codable {
//    let records: [Record]
//}
//
//struct Record: Codable {
//    let id: String?
//    let createdTime: String?
//    let fields: Fields
//}
//
//enum Fields: Codable {
//    case productFields(ProductFields)
//    case scheduleFields(ScheduleFields)
//    
//    func encode(to encoder: Encoder) throws {
//        switch self {
//        case .productFields(let a0):
//            try a0.encode(to: encoder)
//        case .scheduleFields(let a0):
//            try a0.encode(to: encoder)
//        }
//    }
//    
//    init(from decoder: Decoder) throws {
//        if let product = try? ProductFields(from: decoder) {
//            self = .productFields(product)
//        } else if let schedule = try? ScheduleFields(from: decoder) {
//            self = .scheduleFields(schedule)
//        } else {
//            throw NSError()
//        }
//    }
//}
