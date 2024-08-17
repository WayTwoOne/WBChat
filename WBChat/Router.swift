//
//  Router.swift
//  WBChat
//
//  Created by Vladimir on 12.07.2024.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var homeScreen: MyPage = .contactsList
    
    func push(_ page: MyPage) {
        path.append(page)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func goToFirst() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func getPage(_ page: MyPage) -> some View {
        switch page {
        case .contactsList:
            ContactsScreen()
        case .contactsDetails(let contact):
            DetailsScreen(contact: contact)
        case .chat(let contact):
            ContactChatScreen(contact: contact)
        case .addNewContact:
            NewContactView()
        }
    }
}

enum MyPage: Hashable {
    case contactsList, contactsDetails(MockUser), chat(MockUser), addNewContact
}
