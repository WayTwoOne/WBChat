//
//  Person+Passport.swift
//  WBMessenger
//
//  Created by Vladimir on 26.06.2024.
//

import Foundation

final class Person {
    private let name: String
    private let lastname: String
    private let patronymic: String
    private let age: Int
    weak var passport: Passport?
    
    init(name: String, lastname: String, patronymic: String, age: Int, passport: Passport?) {
        self.name = name
        self.lastname = lastname
        self.patronymic = patronymic
        self.age = age
        self.passport = passport
        
        print("class inited")
    }
    
    deinit {
        print("deinit Person")
    }
}
