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
        TabView {
            NavigationStack(path: $router.path) {
                router.getPage(.contactsList)
                    .navigationDestination(for: MyPage.self) { page in
                        router.getPage(page)
                    }
                    .tabItem {
                    Image("person.2")
                        .renderingMode(.template)
                }
            }
//            .overlay(alignment: .bottom) {
//                CustomTabBarView(tabSelcted: $tabSelected)
//            }
            .environmentObject(router)
            .searchable(text: $searchText)
            
            Text("Messages List")
                .tabItem {
                    Image("message")
                        .renderingMode(.template)
                }
            
            Text("More")
                .tabItem {
                    Image("more")
                        .renderingMode(.template)
                }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Router())
    }
}
