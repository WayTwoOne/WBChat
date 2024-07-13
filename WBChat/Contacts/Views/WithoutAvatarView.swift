//
//  PersonWithoutAvatarView.swift
//  WBMessenger
//
//  Created by Vladimir on 11.06.2024.
//

import SwiftUI

struct WithoutAvatarView: View {
    let contact: Contacts
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .frame(width: 56, height: 56)
                                .foregroundColor(Color(red: RGBColor(154), green: RGBColor(65), blue: RGBColor(254)))
                   
                Text(getInitials(from:contact.name))
                    .foregroundColor(.white)
            }
            .cornerRadius(15)
            .padding(.all, 3)
            .overlay(alignment: .center, content: {
                RoundedRectangle(cornerRadius: 17)
                    .stroke(lineWidth: 2.5)
                    .foregroundColor(Color(red: RGBColor(154), green: RGBColor(65), blue: RGBColor(254)))
                    
                    .opacity(contact.didStory ? 1 : 0)
            })
            
            ZStack {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .overlay(alignment: .center) {
                        Circle()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.green)
                    }
            }
            .opacity(contact.isOnline ? 1 : 0)
            .offset(x: 25, y: -25)
                
        }
    }
    
    private func getInitials(from name: String) -> String {
        return name.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
    }
}

extension WithoutAvatarView {
    private func RGBColor(_ color: Double) -> Double {
        color / 255
    }
}

struct WithoutAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        WithoutAvatarView(contact: Contacts(name: "Лиса Алиса", phoneNumber: "+7 999 999 99-99", lastSeenOnline: Date(timeIntervalSinceNow: -1800), isOnline: false, didStory: true, hasAvatar: false))
    }
}
