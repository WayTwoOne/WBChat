//
//  BankView.swift
//  WBMessenger
//
//  Created by Vladimir on 21.06.2024.
//

import SwiftUI

struct BankView: View {
    @State private var transferCountA = "0"
    @State private var transferCountB = "0"
    var clientA: ClientA
    var clientB: ClientB
    
    var body: some View {
        HStack {
            ForEach(0..<2) { number in
                VStack {
                    number == 0 ?
                        Text("Клиент А")
                    :
                        Text("Клиент Б")
                    
                    Text("🏛")
                        .font(.system(size: 150))
                    number == 0 ?
                    TextField("Сколько вы хотите перевести?", text: $transferCountA)
                    :
                    TextField("Сколько вы хотите перевести?", text: $transferCountB)
                    Button {
                        if number == 0 { clientA.transaction(from: clientA, to: clientB, and: transferCountA.toDouble())
                            transferCountA = ""
                        } else {
                            clientB.transaction(from: clientB, to: clientA, and: transferCountB.toDouble())
                            transferCountB = ""
                        }
                    } label: {
                        Text("Перевод")
                    }
                    Button {
                        if number == 0 { clientA.refillAccount(with: transferCountA.toDouble())
                            transferCountA = ""
                        } else {
                            clientB.refillAccount(with: transferCountB.toDouble())
                            transferCountB = ""
                        }
                        
                    } label: {
                        Text("Пополнение")
                    }
                    
                    .padding(.vertical)
                    
                    number == 0 ?
                    Text("\(clientA.account)")
                    :
                    Text("\(clientB.account)")
                }
                .multilineTextAlignment(.center)
            }
        }
    }
}

extension String {
    func toDouble() -> Double {
        guard let number = NumberFormatter().number(from: self)?.doubleValue else { return 0.0 }
        
        return number
    }
}

struct BankView_Previews: PreviewProvider {
    static var previews: some View {
        BankView(clientA: ClientA(customersAccountA: 100), clientB: ClientB(customersAccoutB: 100))
    }
}
