//
//  WBChatApp.swift
//  WBChat
//
//  Created by Vladimir on 12.07.2024.
//

import SwiftUI

@main
struct WBChatApp: App {
    @StateObject private var viewModel = AnimeViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
