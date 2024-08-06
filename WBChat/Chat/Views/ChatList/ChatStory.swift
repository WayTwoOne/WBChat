//
//  ChatStory.swift
//  WBChat
//
//  Created by Vladimir on 06.08.2024.
//

import SwiftUI

struct ChatStory: View {
    let contact: MockUser
    var body: some View {
        if contact.hasAvatar {
            VStack {
                AvatarView(contact: contact)
                Text(contact.name)
            }
            
        } else {
            WithoutAvatarView(contact: contact)
            Text(contact.name)
        }
    }
}

struct ChatStory_Previews: PreviewProvider {
    static var previews: some View {
        ChatStory(contact: MockUser(uid: "Петя", name: "Петя", phoneNumber: "+7 999 999 99-99", lastSeenOnline: nil, isOnline: true, didStory: false, hasAvatar: true))
    }
}
