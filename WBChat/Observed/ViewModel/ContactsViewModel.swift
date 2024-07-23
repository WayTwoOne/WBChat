//
//  ContactsViewModel.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import Foundation

final class ContactsViewModel: ObservableObject {
    @Published var contacts: [User] = []
    
    func getUser(name: String, email: String, bio: String) {
        contacts.append(User(name: name, email: email, bio: bio))
    }
    
    func updateUserdata(user: User) {
        if contacts.contains(where: {$0.email == user.email}) {
            
        }
    }
    
    func deleteUser(of index: IndexSet) {
        contacts.remove(atOffsets: index)
    }
}
