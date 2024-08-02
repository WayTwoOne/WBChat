//
//  Model.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import Foundation

public struct User: Hashable, Identifiable {
    public var id = UUID()
    public let name: String
    public let email: String
    public let bio: String
    
    public init(name: String, email: String, bio: String) {
        self.name = name
        self.email = email
        self.bio = bio
    }

    public static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}


