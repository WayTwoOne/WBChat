//
//  ContentView.swift
//  WBChat
//
//  Created by Vladimir on 12.07.2024.
//

import SwiftUI

struct ContentView: View {
    let custom = CustomHashFunction(string: "Button")
    let stringHash = StringHash()
    
    var body: some View {
        VStack {
            Button {
                custom.hashValue
            } label: {
                Text("Button")
            }
            
        }
        .padding(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
