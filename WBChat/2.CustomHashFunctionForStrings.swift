//
//  2.CustomHashFunctionForStrings.swift
//  WBChat
//
//  Created by Vladimir on 22.07.2024.
//

import Foundation

class CustomHashFunction {
    
    init() {
        print(customHash("HomeWork #12"))
    }
    
    func customHash(_ string: String) -> Int {
      let unicode = string.unicodeScalars.map { $0.value } //Значение строки преобразовываем в коллекцию скалярных значений Unicode
      return unicode.reduce(6723, { partialResult, int32 in // Здесь вызываем метод reduce c параметрами initialResult и nextPartialResult для того, чтобы вычислить хеш-код
          return (partialResult << 5) &+ partialResult &+ Int(int32) // в замыкании мы используем оператор побитового сдвига (<<) + переполнение (&+), после преобразовываем в Int
      })
    }
    
}
