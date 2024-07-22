//
//  2.CustomHashFunctionForStrings.swift
//  WBChat
//
//  Created by Vladimir on 22.07.2024.
//

import Foundation

struct CustomHashFunction {
    var string: String
    
    var hashValue: Int {
        print(string.hashValue)
        return string.hashValue &* 16777619
    }
    // кастомная переменная которая возаращает хеш
}
