//
//  4.Dictionary.swift
//  WBChat
//
//  Created by Vladimir on 22.07.2024.
//

import Foundation

private struct PersonalDictionary {
    var dictionaryA: [String:Int] = ["Moscow":13149803, "Hong Kong": 7498100, "Mexico City": 9209944]
    // создал словарь
}

extension PersonalDictionary {
    mutating func append() {
        dictionaryA["New York"] = 8467513
        dictionaryA["Beijing"] = 21893095
        dictionaryA["Berlin"] = 3755251
    } //добавил несколько значений
}

extension PersonalDictionary {
    mutating func remove() {
        dictionaryA.removeValue(forKey: "Hong Kong")
    } //удалил элемент из словаря
}

extension PersonalDictionary {
    mutating func updateValue() {
        dictionaryA.updateValue(9209944, forKey: "NE Mexico City")
    } //обновил значение
}

extension PersonalDictionary {
    mutating func getValue() {
        let value = dictionaryA["Moscow"]
    } //получил значение 
}
