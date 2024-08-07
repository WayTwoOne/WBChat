//
//  MessageBubbleView.swift
//  WBChat
//
//  Created by Vladimir on 06.08.2024.
//

import SwiftUI
import ExyteChat

struct MessageBubbleView: View {
    var isOP: Bool
    var messageContent: Message
    var status: String
    
    var body: some View {
        ZStack {
            VStack {
                MessageWithPhotos(message: messageContent)
                HStack {
                    isOP ? Spacer() : nil
                    Text(messageContent.text)
                        .padding()
                        .foregroundStyle(isOP ? .white : .black,
                                         isOP ? .white : .black)
                        .background(isOP
                                    ? Color("wbPurple")
                                    : Color(red: 210/255, green: 210/255, blue: 210/255)
                        )
                        .clipShape(MessageBubbleShape(direction: isOP ? .right : .left))
                    isOP ? nil : Spacer()
                }
            }
        }
        .padding((isOP ? .leading : .trailing), 90.0)
        .padding(.vertical, 5)
        
    }
}

struct MessageBubbleView_Previews: PreviewProvider {
    static let message = Message(id: "", user: User(id: "", name: "", avatarURL: URL(string: "")!, isCurrentUser: true), text: "HEllo world wtosasgdhjashgdjhasgdjhagsdjhgasd")
    static var previews: some View {
        MessageBubbleView(isOP: true, messageContent: message, status: "отправлено")
    }
}
