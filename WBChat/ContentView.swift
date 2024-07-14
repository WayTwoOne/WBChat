//
//  ContentView.swift
//  WBChat
//
//  Created by Vladimir on 12.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CelendarViewModel()
    var body: some View {
       CelendarView()
            .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
