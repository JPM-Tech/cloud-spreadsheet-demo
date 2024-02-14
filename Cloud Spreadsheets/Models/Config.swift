//
//  Config.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 2/12/24.
//

import Foundation

struct ConfigRecords: Codable {
    let records: [ConfigRecord]
}

struct ConfigRecord: Codable {
    let id: String?
    let createdTime: String?
    let fields: ConfigFields
}

struct ConfigFields: Identifiable, Codable {
    var id: String? {
        UUID().uuidString
    }
    let name: String
    let shouldAskForFeedback: Bool?
    let productLayout: String
}
