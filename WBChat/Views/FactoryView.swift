//
//  FactoryView.swift
//  WBMessenger
//
//  Created by Vladimir on 26.06.2024.
//

import SwiftUI

struct FactoryView: View {
    @State var present = false
    var body: some View {
        NavigationStack {
            Button {
                present.toggle()
            } label: {
                Text("Button")
            }
            .sheet(isPresented: $present) {
                StartedWorkView()
            }
        }
        
    }
}

struct FactoryView_Previews: PreviewProvider {
    static var previews: some View {
        FactoryView()
    }
}
