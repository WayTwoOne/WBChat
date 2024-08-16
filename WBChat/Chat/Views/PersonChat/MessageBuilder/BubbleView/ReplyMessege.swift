//
//  ReplyMessave.swift
//  WBChat
//
//  Created by Vladimir on 16.08.2024.
//

import SwiftUI
import ExyteChat

struct ReplyMessege: View {
    var isOP: Bool
    var message: Message
    let isDisplayingMessageMenu: Bool
    
    var body: some View {
        VStack(alignment: message.user.isCurrentUser ? .trailing : .leading, spacing: 2) {
            if !isDisplayingMessageMenu, let reply = toMessage() {
                HStack(spacing: 8) {
                    Capsule()
                        .foregroundColor(.gray)
                        .frame(width: 2)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(message.user.name)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 20)

                        if !message.attachments.isEmpty {
                            MessageWithPhotos(message: message)
                                .padding(.top, 4)
                                .padding(.bottom, message.text.isEmpty ? 0 : 4)
                        }

                        if !message.text.isEmpty {
                                Text(message.text)
                                    .frame(width: 300, alignment: .leading)
                                    .padding(.all, 10)
                                    .font(.system(size: 14))
                                    .foregroundStyle(isOP ? .white : .black,
                                                     isOP ? .white : .black)
                                .padding(.horizontal, 20)
                        }

                        if let recording = message.recording {
                                RecordWaveformWithButtons(
                                    recording: recording,
                                    colorButton: .black,
                                    colorButtonBg: .black,
                                    colorWaveform: .black
                                )
                        }
                    }
                }
            }
        }
    }
    private func toMessage() -> Message {
        Message(
            id: message.replyMessage?.id ?? "",
            user: message.replyMessage?.user ?? User(id: "", name: "", avatarURL: nil, isCurrentUser: false),
            text: message.replyMessage?.text ?? "",
            attachments: message.replyMessage?.attachments ?? [],
            recording: message.replyMessage?.recording
        )
    }
}

//struct ReplyMessave_Previews: PreviewProvider {
//    static var previews: some View {
//        ReplyMessege()
//    }
//}
