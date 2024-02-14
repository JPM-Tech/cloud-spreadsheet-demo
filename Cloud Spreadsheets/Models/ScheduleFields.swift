//
//  ScheduleFields.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 2/6/24.
//

import Foundation

struct ScheduleRecords: Codable {
    let records: [ScheduleRecord]
}

struct ScheduleRecord: Codable {
    let id: String?
    let createdTime: String?
    let fields: ScheduleFields
}

struct ScheduleFields: Identifiable, Codable {
    var id: String? {
        UUID().uuidString
    }
    let name: String
    let title: String
    let description: String
    let talkDate: Date
    let status: String
    let photoLink: String
}
