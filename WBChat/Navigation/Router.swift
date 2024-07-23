//
//  Router.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(_ page: Pages) {
        path.append(page)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    @ViewBuilder
    func getPage(_ page: Pages) -> some View {
        switch page {
        case .contacts:
            ContactsView()
        case .addNewContact:
            AddNewContactView()
        case .contactDetails(let user):
            ContactRow(user: user)
        }
    }
}

enum Pages: Hashable {
    case contacts, addNewContact, contactDetails(User)
}
