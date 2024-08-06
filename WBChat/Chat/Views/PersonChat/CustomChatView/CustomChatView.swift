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
    @State private var status = Status()
    
    var body: some View {
        MessageBubbleView(isOP: message.user.name == "You" ? true : Bool.random(), messageContent: message.text, status: message.status, statusStruct: status)
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

//struct CustomChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomChatView()
//    }
//}
