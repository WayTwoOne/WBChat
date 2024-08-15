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
        if !message.attachments.isEmpty {
        }
        
        if !message.text.isEmpty {
            
        }
        if let recording = message.recording {
            VStack(alignment: .trailing, spacing: 8) {
                RecordWaveformWithButtons(
                    recording: recording,
                    colorButton: message.user.isCurrentUser ? .white : .gray,
                    colorButtonBg: message.user.isCurrentUser ? .white : .gray,
                    colorWaveform: message.user.isCurrentUser ? .white : .gray
                )
                    .padding(.bottom, 8)
                    .padding(.trailing, 12)
            }
        }
        MessageBubbleView(isOP: message.user.isCurrentUser ? true : false, message: message)
    }
}

struct CustomChatView_Previews: PreviewProvider {
    static private var shortMessage = "Hi, buddy!"
    static private var longMessage = "Hello hello hello hello hello hello hello hello hello hello hello hello hello\n hello hello hello hello d d d d d d d d"

    static private var message = Message(
        id: UUID().uuidString,
        user: User(id: UUID().uuidString, name: "Stan", avatarURL: nil, isCurrentUser: false),
        status: .read,
        text: longMessage,
        attachments: []
    )
    
    static var previews: some View {
        CustomChatView(message: message, isOp: true)
    }
}
