//
//  Singleton.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import Foundation
import UISystem

final class ContactsSingletonViewModel: ObservableObject {
    @Published var contacts: [User] = []
    @Published var contact: User = User(name: "", email: "", bio: "")
    
    static let shared = ContactsSingletonViewModel()
    
    private init() {}
    
    func getUser(name: String, email: String, bio: String) {
        contacts.append(User(name: name, email: email, bio: bio))
    }
    
    func removeUser(with index: IndexSet) {
        contacts.remove(atOffsets: index)
    }
}
