//
//  TimeAndStatusView.swift
//  WBChat
//
//  Created by Vladimir on 07.08.2024.
//

import SwiftUI
import ExyteChat

struct TimeAndStatusView: View {
    var message: Message
    var isOP: Bool
    var statusStruct: Status
    var body: some View {
        if isOP {
            HStack(spacing: 2) {
                Text(message.createdAt, style: .time)
                    .environment(\.locale, .init(identifier: "ru_RU"))
                Text("·")
                Text(statusStruct.getStatus(status: message.status))
                
            }
            .padding(.leading, 150)
            .padding(.bottom, 10)
            .font(.system(size: 10))
            .foregroundColor(.white)
        }
    }
}

struct TimeAndStatusView_Previews: PreviewProvider {
    static var previews: some View {
        TimeAndStatusView(message: Message(id: "", user: User(id: "", name: "", avatarURL: nil, isCurrentUser: true)), isOP: true, statusStruct: Status())
    }
}
