//
//  CustomChatView.swift
//  WBChat
//
//  Created by Vladimir on 05.08.2024.
//

import SwiftUI
import ExyteChat
import ExyteMediaPicker

struct CustomChatView: View {
    let message: Message
    let isOp: Bool
    
    var body: some View {
        
        MessageBubbleView(isOP: message.user.isCurrentUser ? true : false, message: message)
    }
}

struct CustomChatView_Previews: PreviewProvider {
    static private var shortMessage = "Hi, buddy!"
    static private var longMessage = "Hello hello hello hello hello hello hello hello hello hello hello hello hello\n hello hello hello hello d d d d d d d d"

    static private var message = Message(
        id: UUID().uuidString,
        user: User(id: UUID().uuidString, name: "Stan", avatarURL: nil, isCurrentUser: true),
        status: .read,
        text: longMessage,
        attachments: []
    )
    
    static var previews: some View {
        CustomChatView(message: message, isOp: true)
    }
}
