//
//  DateFormatter+RickyMorty.swift
//  RickyMortyAPI
//
//  Created by Rashad Abdul-Salam on 3/27/25.
//

import Foundation

extension DateFormatter {
    static func formattedPublishDate(_ dateStr: String) -> String {
        // Example date formatting
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let fDate = dateFormatter.date(from: dateStr) {
            let outputFormatter = Self()
            outputFormatter.dateStyle = .medium
            return outputFormatter.string(from: fDate)
        }
        return dateStr
    }
}
