//
//  String+isBlank.swift
//  Cloud Spreadsheets
//
//  Created by Chase Lewis on 2/9/24.
//

import Foundation

extension String {
    func isBlank() -> Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
