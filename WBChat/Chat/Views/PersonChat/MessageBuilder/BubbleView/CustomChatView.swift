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
    @State private var status = Status()
    
    var body: some View {
        
        MessageBubbleView(isOP: message.user.isCurrentUser ? true : false, messageContent: message, status: status.getStatus(status: message.status))
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

struct CustomChatView_Previews: PreviewProvider {
    static let string: Message = .init(id: "", user: User(id: "", name: "", avatarURL: URL(string: "")!, isCurrentUser: true))
    
    static var previews: some View {
        CustomChatView(message: string, isOp: true)
    }
}
