//
//  ContactsModel.swift
//  WBMessenger
//
//  Created by Vladimir on 10.06.2024.
//

import Foundation
import ExyteChat

struct MockUser: Hashable, Equatable {
    var id = UUID()
    let uid: String
    var name: String = ""
    var phoneNumber: String = ""
    var lastSeenOnline: Date? = nil
    var isOnline: Bool = false
    var didStory: Bool = false
    var hasAvatar: Bool = false
    var avatar: URL? = nil
}

extension MockUser {
    static func getContacts() -> [MockUser] {
        [
            MockUser(uid: "Настя", name: "Анастасия Иванова", phoneNumber: "+7 999 999 99-99", lastSeenOnline: Date(timeIntervalSinceNow: -80400), isOnline: false, didStory: false, hasAvatar: true),
            MockUser(uid: "Петя", name: "Петя", phoneNumber: "+7 999 999 99-99", lastSeenOnline: nil, isOnline: true, didStory: false, hasAvatar: true),
            MockUser(uid: "Маман", name: "Маман", phoneNumber: "+7 999 999 99-99", lastSeenOnline: Date(timeIntervalSinceNow: -10800), isOnline: false, didStory: true, hasAvatar: true),
            MockUser(uid: "Арбуз", name: "Арбуз Дыня", phoneNumber: "+7 999 999 99-99", lastSeenOnline: nil, isOnline: true, didStory: false, hasAvatar: true),
            MockUser(uid: "Иван", name: "Иван Иванов", phoneNumber: "+7 999 999 99-99", lastSeenOnline: nil, isOnline: true, didStory: false, hasAvatar: false),
            MockUser(uid: "Лиса", name: "Лиса Алиса", phoneNumber: "+7 999 999 99-99", lastSeenOnline: Date(timeIntervalSinceNow: -1800), isOnline: false, didStory: true, hasAvatar: false),
        ]
    }
}

extension MockUser {
    var isCurrentUser: Bool {
        uid == "1"
    }
}

extension MockUser {
    func toChatUser() -> User {
        User(id: uid, name: name, avatarURL: avatar, isCurrentUser: isCurrentUser)
    }
}
