//
//  DetailsScreen.swift
//  WBMessenger
//
//  Created by Vladimir on 03.07.2024.
//

import SwiftUI

struct DetailsOfMainScreen: View {
    @Environment(\.dismiss) var dissmis
    @Binding var profile: Profile
    @Binding var username: String
    @Binding var prefersNotifications: Bool
    @Binding var seasonalPhoto: Profile.Season
    @Binding var goalDate: Date

    var body: some View {
        NavigationStack {
            Text(seasonalPhoto.rawValue)
                .font(.system(size: 150))
            VStack(alignment: .center, spacing: 15) {
                Picker("User image", selection: $seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                TextField("Username", text: $username)
                    .font(.system(size: 40))
                    .bold()
                HStack {
                    Text("Do you want to receive notifications?")
                    Toggle("", isOn: $prefersNotifications)
                        .frame(width: 50)
                }
                
                DatePicker("Change date", selection: $goalDate)
            }
            
            .frame(width: 350, height: 80)
            .multilineTextAlignment(.center)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            profile.getNewProfile(username, prefersNotifications, seasonalPhoto, goalDate)
                            dissmis()
                        } label: {
                            HStack {
                                Image(systemName: "tray.and.arrow.down.fill")
                                Text("Save")
                            }
                        }
                        
                    }
                }
        }
        
        .navigationBarBackButtonHidden()
    }
}
