//
//  Passport.swift
//  WBMessenger
//
//  Created by Vladimir on 26.06.2024.
//

import Foundation

final class Passport {
    private let series: Int
    private let number: Int
    private let date: Date
    weak var person: Person?
    
    init(series: Int, number: Int, date: Date, person: Person?) {
        self.series = series
        self.number = number
        self.date = date
        self.person = person
        
        print("class inited")
    }
    
    deinit {
        print("deinit Passport")
    }
}
