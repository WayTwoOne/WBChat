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
    var statusStruct: String
    var body: some View {
        Group {
            if isOP {
                HStack(spacing: 2) {
                    Text(message.createdAt, style: .time)
                        .environment(\.locale, .init(identifier: "ru_RU"))
                    Text("·")
                    Text(statusStruct)
                }
                .frame(width: 120)
            } else {
                Text(message.createdAt, style: .time)
                    .environment(\.locale, .init(identifier: "ru_RU"))
                    .padding(.leading, -40)
            }
        }
        .padding(isOP ? .leading : .trailing, 90)
            .padding(.bottom, 10)
            .font(.system(size: 10))
            .foregroundColor(isOP ? .white : Color("wbGray"))
    }
}

struct TimeAndStatusView_Previews: PreviewProvider {
    static var previews: some View {
        TimeAndStatusView(message: Message(id: "", user: User(id: "", name: "", avatarURL: nil, isCurrentUser: true)), isOP: true, statusStruct: "status")
    }
}
