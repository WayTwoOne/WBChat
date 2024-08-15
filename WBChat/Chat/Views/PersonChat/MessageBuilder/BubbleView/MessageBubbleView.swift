//
//  MessageBubbleView.swift
//  WBChat
//
//  Created by Vladimir on 06.08.2024.
//

import SwiftUI
import ExyteChat

struct MessageBubbleView: View {
    @Environment(\.locale) var locale
    @State private var statusStruct = Status()
    @State private var theme: ChatTheme.Colors = .init()
    
    var isOP: Bool
    var message: Message
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    isOP ? Spacer() : nil
                    VStack {
                        if !message.attachments.isEmpty {
                            MessageWithPhotos(message: message)
                        }
                        if !message.text.isEmpty {
                            Text(message.text)
                                .multilineTextAlignment(.leading)
                                .frame(width: 300)
                                .padding(.all, 10)
                                .font(.system(size: 14))
                                .foregroundStyle(isOP ? .white : .black,
                                                 isOP ? .white : .black)
                        }
                        
                        if let recording = message.recording {
                            VStack(alignment: .trailing, spacing: 8) {
                                RecordWaveformWithButtons(
                                    recording: recording,
                                    colorButton: message.user.isCurrentUser ? theme.myMessage : .white,
                                    colorButtonBg: message.user.isCurrentUser ? .white : theme.myMessage,
                                    colorWaveform: message.user.isCurrentUser ? theme.textDarkContext : theme.textLightContext
                                )
                                .padding(.horizontal, 8)
                                .padding(.top, 8)
                                .padding(.bottom, 8)
                                .padding(.trailing, 12)
                            }
                        }
                        
                        TimeAndStatusView(message: message, isOP: isOP, statusStruct: statusStruct.getStatus(status: message.status))
                            .multilineTextAlignment(isOP ? .leading : .trailing)
                            .padding(isOP ? .leading : .trailing, 110)
                            .padding(.bottom, 5)
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                    }
                    .background(isOP
                                ? Color("wbPurple")
                                : Color(.gray)
                    )
                    .clipShape(MessageBubbleShape(direction: isOP ? .right : .left))
                    
                    isOP ? nil : Spacer()
                }
            }
        }
        .padding((isOP ? .leading : .trailing), 50)
        .padding(.vertical, 5)
        
    }
}

struct Status {
    func getStatus(status: Message.Status?) -> String {
        switch status {
        case .sending:
            return "Отправляется"
        case .sent:
            return "Отправлено"
        case .read:
            return "Прочитано"
        case .error(let error):
            return error.text.localizedLowercase
        case .none:
            return ""
        }
    }
}

struct MessageBubbleView_Previews: PreviewProvider {
    static private var shortMessage = "Hi, buddy!"
    static private var longMessage = "Hello hello hello hello hello hello hello hello hello hello hello hello hello\n hello hello hello hello d d d d d d d d"

    static private var message = Message(
        id: UUID().uuidString,
        user: User(id: UUID().uuidString, name: "Stan", avatarURL: nil, isCurrentUser: true),
        status: .sending,
        text: shortMessage,
        attachments: []
    )
    static var previews: some View {
        MessageBubbleView(isOP: true, message: message)
    }
}
