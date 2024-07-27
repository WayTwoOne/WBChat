//
//  ContactsModel.swift
//  WBMessenger
//
//  Created by Vladimir on 10.06.2024.
//

import Foundation

struct Contacts: Hashable {
    var id = UUID()
    var name: String = ""
    var phoneNumber: String = ""
    var lastSeenOnline: Date? = nil
    var isOnline: Bool = false
    var didStory: Bool = false
    var hasAvatar: Bool = false
    var avatar: String? = nil
}

extension Contacts {
    static func getContacts() -> [Contacts] {
        [
            Contacts(name: "Анастасия Иванова", phoneNumber: "+7 999 999 99-99", lastSeenOnline: Date(timeIntervalSinceNow: -80400), isOnline: false, didStory: false, hasAvatar: true),
            Contacts(name: "Петя", phoneNumber: "+7 999 999 99-99", lastSeenOnline: nil, isOnline: true, didStory: false, hasAvatar: true),
            Contacts(name: "Маман", phoneNumber: "+7 999 999 99-99", lastSeenOnline: Date(timeIntervalSinceNow: -10800), isOnline: false, didStory: true, hasAvatar: true),
            Contacts(name: "Арбуз Дыня", phoneNumber: "+7 999 999 99-99", lastSeenOnline: nil, isOnline: true, didStory: false, hasAvatar: true),
            Contacts(name: "Иван Иванов", phoneNumber: "+7 999 999 99-99", lastSeenOnline: nil, isOnline: true, didStory: false, hasAvatar: false),
            Contacts(name: "Лиса Алиса", phoneNumber: "+7 999 999 99-99", lastSeenOnline: Date(timeIntervalSinceNow: -1800), isOnline: false, didStory: true, hasAvatar: false),
        ]
    }
}
