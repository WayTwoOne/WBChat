//
//  PersonWithoutAvatarView.swift
//  WBMessenger
//
//  Created by Vladimir on 10.06.2024.
//

import SwiftUI

struct AvatarView: View {
    let contact: Contacts
    var body: some View {
        ZStack {
            Image(contact.name)
                .resizable()
                .frame(width: 56, height: 56)
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
                Circle()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.green)
                    
            }
            .opacity(contact.isOnline ? 1 : 0)
            .offset(x: 25, y: -25)
                
        }
    }
}

extension AvatarView {
    private func RGBColor(_ color: Double) -> Double {
        color / 255
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(contact: Contacts(name: "Анастасия Иванова", phoneNumber: "+7 999 999 99-99", lastSeenOnline: Date(timeIntervalSinceNow: -80400), isOnline: false, didStory: false, hasAvatar: true))
    }
}
