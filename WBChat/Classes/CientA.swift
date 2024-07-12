//
//  CientA.swift
//  WBMessenger
//
//  Created by Vladimir on 21.06.2024.
//

import Foundation

final class ClientA: Bank {
    var customersAccountA: Double
    
    init(customersAccountA: Double) {
        self.customersAccountA = customersAccountA
        
        super.init(acount: customersAccountA)
    }
}
