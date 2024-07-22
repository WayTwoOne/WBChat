//
//  1.StringHash.swift
//  WBChat
//
//  Created by Vladimir on 22.07.2024.
//

import Foundation

class StringHash: ObservableObject {
    
    func getHashFrom(_ string: String) -> any Hashable {
        print(string.hashValue)
        return string.hash
    } // простая функция, которая возвращает хеш
}
