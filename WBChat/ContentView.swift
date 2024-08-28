//
//  ContentView.swift
//  WBChat
//
//  Created by Vladimir on 12.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = EnteringTheReceivedCodeViewModel(numberOfFields: 4)
    var body: some View {
        EnteringCodeTextView()
            .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
