//
//  ContentView.swift
//  WBChat
//
//  Created by Vladimir on 12.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BankView(clientA: ClientA(customersAccountA: 200), clientB: ClientB(customersAccoutB: 200))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
