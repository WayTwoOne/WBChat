//
//  Model.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import Foundation

struct User: Hashable, Identifiable {
    var id = UUID()
    let name: String
    let email: String
    let bio: String
    
    init(name: String, email: String, bio: String) {
        self.name = name
        self.email = email
        self.bio = bio
    }

    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}


