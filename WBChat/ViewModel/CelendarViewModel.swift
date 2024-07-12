//
//  CelendarViewModel.swift
//  WBMessenger
//
//  Created by Vladimir on 27.06.2024.
//

import Foundation

final class CelendarViewModel: ObservableObject {
    @Published var selectedCountry: Countries = .russia
    @Published var selectedDateFormat: DateFormat = .spellOut
    @Published var days: [String] = []
    @Published var dateVM = Date()
    
    let allCases = Countries.allCases
    let allCasesDate = DateFormat.allCases
    let daysString = ["Day before yesturday", "Yesterday", "Today", "Tomorrow", "After tomorrow"]
    
    init() {
        dateTransformation(dateVM, selectedCountry, selectedDateFormat)
    }
    
    
    enum Countries: String, CaseIterable, Identifiable {
        case american
        case german
        case africa
        case england
        case russia
        var id: Countries { self }
        
        var flags: String {
            switch self {
            case .american:
                return "🇺🇸"
            case .german:
                return "🇩🇪"
            case .africa:
                return "🇦🇫"
            case .england:
                return "🇬🇧"
            case .russia:
                return "🇷🇺"
            }
        }
        
        var localizations: String {
            switch self {
            case .american:
                return "us_US"
            case .german:
                return "de_AT"
            case .africa:
                return "af_ZA"
            case .england:
                return "en_ER"
            case .russia:
                return "ru_RU"
            }
        }
    }
    
    enum DateFormat: String, CaseIterable, Identifiable {
        case spellOut = "SpellOut date"
        case full = "Full date"
        var id: DateFormat { self }
    }
    
    func dateTransformation(_ date: Date, _ region: Countries, _ format: DateFormat) {
        days = []
        var daysArray: [Date] = []
        let calendar = Calendar.current
        
        for i in 0..<5 {
            let j = i - 2
            daysArray.append(calendar.date(byAdding: .day, value: j, to: date) ?? date)
        }
        
        
        daysArray.forEach { day in
            switch format {
            case .spellOut:
                let day1 = "\(spellOut: day, local: selectedCountry.localizations)"
                days.append(day1)
            case .full:
                let day1 = "\(full: day, local: selectedCountry.localizations)"
                days.append(day1)
            }
        }
    }
}
