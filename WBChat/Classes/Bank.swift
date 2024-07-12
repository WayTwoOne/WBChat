//
//  Bank.swift
//  WBMessenger
//
//  Created by Vladimir on 21.06.2024.
//

import Foundation

class Bank {
    
    var account: Double
    
    func transaction(from clientA: Bank, to clientB: Bank, and transfer: Double) {
        print("\(clientA.account) \(clientB.account)")
        
        clientA.account -= transfer
        clientB.account += transfer
        
        print("\(clientA.account) \(clientB.account)")
    }
    
    func refillAccount(with units: Double) {
        print(account.self)
        
        account.self += units
        
        print(account.self)
    }
    
    init(acount: Double) {
        self.account = acount
    }
}


