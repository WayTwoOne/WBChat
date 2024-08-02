//
//  ContentView.swift
//  WBChat
//
//  Created by Vladimir on 12.07.2024.
//

import SwiftUI
import UISystem

struct ContentView: View {
    @StateObject private var router = Router()
    var body: some View {
        TabView {
            NavigationStack(path: $router.path) {
                router.getPage(.contacts)
                    .navigationDestination(for: Pages.self) { page in
                        router.getPage(page)
                    }
                    .navigationTitle("Contacts")
            }
            
            .tabItem {
                Text("Observed")
            }
            
            ContactsSingletonView()
                .tabItem {
                    Text("Singleton")
                }
        }
        .environmentObject(router)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environmentObject(Router())
    }
}
