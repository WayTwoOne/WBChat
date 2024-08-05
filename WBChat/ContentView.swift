//
//  ContentViewHW2.swift
//  WBMessenger
//
//  Created by Vladimir on 13.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected = 1
    @State private var searchText = ""
    @StateObject var router = Router()
    
    var body: some View {
        TabView(selection: $tabSelected) {
            NavigationStack(path: $router.path) {
                router.getPage(.contactsList)
                    .navigationDestination(for: MyPage.self) { page in
                        router.getPage(page)
                    }
            }
            .tag(1)
            
            Text("Messenger")
                .tag(2)
            
            Text("More info")
                .tag(3)
        }
        .overlay(alignment: .bottom) {
            CustomTabBarView(tabSelcted: $tabSelected)
        }
        
        .environmentObject(router)
        .searchable(text: $searchText)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Router())
    }
}
