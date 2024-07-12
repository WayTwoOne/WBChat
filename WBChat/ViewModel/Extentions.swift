//
//  Extentions.swift
//  WBMessenger
//
//  Created by Vladimir on 28.06.2024.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(spellOut value: Date, local region: String) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        formatter.locale = Locale(identifier: region)
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: value)
        

    mainLoop: for smtg in [components.day, components.year] {
            if let result = formatter.string(from: smtg! as NSNumber) {
                appendLiteral(result)
                appendLiteral(" ")
            }
        }
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(full value: Date, local region: String) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.locale = Locale(identifier: region)

        let dateString = formatter.string(from: value)
        appendLiteral(dateString)
    }
}
