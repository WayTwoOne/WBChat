//
//  WBChatApp.swift
//  WBChat
//
//  Created by Vladimir on 12.07.2024.
//

import SwiftUI

@main
struct WBChatApp: App {
    @StateObject var viewModel = ContactsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
