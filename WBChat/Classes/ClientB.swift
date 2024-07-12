//
//  ClientB.swift
//  WBMessenger
//
//  Created by Vladimir on 21.06.2024.
//

import Foundation

final class ClientB: Bank {
    var customersAccoutB: Double
    
    init(customersAccoutB: Double) {
        self.customersAccoutB = customersAccoutB
        
        super.init(acount: customersAccoutB)
    }
    
}
