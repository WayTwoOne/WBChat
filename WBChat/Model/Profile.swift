//
//  User.swift
//  WBMessenger
//
//  Created by Vladimir on 03.07.2024.
//

import Foundation

struct Profile {
    var username: String = "Vladimir"
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}

extension Profile {
    mutating func getNewProfile(_ username: String, _ prefersNotifications: Bool, _ seasonalPhoto: Profile.Season, _ goalDate: Date ) {
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = goalDate
    }
}
