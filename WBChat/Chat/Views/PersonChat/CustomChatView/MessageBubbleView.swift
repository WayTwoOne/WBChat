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
    var messageContent: String
    var status: Message.Status?
    var statusStruct: Status
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    isOP ? Spacer() : nil
                    Text(messageContent)
                        .padding()
                        .foregroundStyle(isOP ? .white : .black,
                                         isOP ? .white : .black)
                        .background(isOP
                                    ? .blue
                                    : Color(red: 210/255, green: 210/255, blue: 210/255)
                        )
                        .clipShape(MessageBubbleShape(direction: isOP ? .right : .left))
                    isOP ? nil : Spacer()
                }
               Text(statusStruct.getStatus(status: status))
            }
        }
        .padding((isOP ? .leading : .trailing), 90.0)
        
    }
}

//struct MessageBubbleView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageBubbleView(isOP: true, messageContent: "Hello")
//    }
//}
