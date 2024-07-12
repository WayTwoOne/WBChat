//
//  MainScreen.swift
//  WBMessenger
//
//  Created by Vladimir on 03.07.2024.
//

import SwiftUI

struct MainScreen: View {
    @State private var profile = Profile()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Text(profile.seasonalPhoto.rawValue)
                    .font(.system(size: 150))
                Text(profile.username)
                    .font(.system(size: 30))
                    .bold()
                Text("\(profile.goalDate)")
                HStack {
                    Text(profile.prefersNotifications ? "You receive notifications" : "You do not receive notifications")
                }
                Spacer()
                NavigationLink {
                    DetailsOfMainScreen(profile: $profile, username: $profile.username, prefersNotifications: $profile.prefersNotifications, seasonalPhoto: $profile.seasonalPhoto, goalDate: $profile.goalDate)
                } label: {
                    Text("Go to detail screen")
                }
                
                
                
            }
            .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
