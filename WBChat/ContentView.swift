//
//  ContentViewHW2.swift
//  WBMessenger
//
//  Created by Vladimir on 13.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @StateObject var router = Router()
    @StateObject var viewModel = ChatViewModel(isOp: false)
    var body: some View {
            NavigationStack(path: $router.path) {
                router.getPage(.contactsList)
                    .navigationDestination(for: MyPage.self) { page in
                        router.getPage(page)
                    }
            }
        .environmentObject(viewModel)
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
