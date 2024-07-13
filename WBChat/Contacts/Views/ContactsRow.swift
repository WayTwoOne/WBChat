//
//  ContactsRow.swift
//  WBMessenger
//
//  Created by Vladimir on 10.06.2024.
//

import SwiftUI

struct ContactsRow: View {
    let contact: Contacts
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            if contact.hasAvatar {
                AvatarView(contact: contact)
            } else {
                WithoutAvatarView(contact: contact)
            }
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.system(size: 14))
                    .padding(.vertical, 1)
                Text(getDate(with: contact.lastSeenOnline))
                    .font(.system(size: 12))
                    .foregroundColor(Color(red: RGBColor(173), green: RGBColor(181), blue: RGBColor(189)))
                   
                    
            }
            
            .padding(.bottom, 10)
        }
    }
    
    private func getDate(with date: Date?) -> String {
        guard let date = date else { return "Online" }
        var string = ""
        let dateMinute = Calendar.current.dateComponents([.minute], from: date, to: Date.now)
        let dateHour = Calendar.current.dateComponents([.hour], from: date, to: Date.now)
        guard let hour = dateHour.hour else { return "0"}
        
        switch hour {
        case 24... :
            string = "Last seen yesterday"
        case 1...24 :
            string = "Last seen \(hour) hours ago"
        case ..<1 :
            let minutes = dateMinute.minute ?? 0
            string = "Last seen \(minutes) minutes ago"
        default:
            break
        }

        return string
    }
}

extension ContactsRow {
    private func RGBColor(_ color: Double) -> Double {
        color / 255
    }
}

struct ContactsRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactsRow(contact: Contacts(name: "Петя", phoneNumber: "+7 999 999 99-99", lastSeenOnline: nil, isOnline: true, didStory: false, hasAvatar: true))
    }
}
