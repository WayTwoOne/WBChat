//
//  ChatListVIewModel.swift
//  WBChat
//
//  Created by Vladimir on 06.08.2024.
//

import Foundation

final class ChatListViewModel: ObservableObject {
    @Published var contactsWithStory: [MockUser] = []
    private let contacts = MockUser.getContacts()
    
    init() {
        getContactWithStory()
    }
    
    func getContactWithStory() {
        for contact in contacts {
            if contact.didStory {
                contactsWithStory.append(contact)
            }
        }
    }
}
