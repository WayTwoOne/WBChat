//
//  CustomChatView.swift
//  WBChat
//
//  Created by Vladimir on 05.08.2024.
//

import SwiftUI
import ExyteChat
import ExyteMediaPicker

struct CustomInputTextInChatView: View {
    @EnvironmentObject var viewModel: ChatViewModel
    @Binding var message: String
    let actions: (InputViewAction) -> Void
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Button {
                    actions(.photo)
                } label: {
                    Image("Photos")
                        .renderingMode(.template)
                        .foregroundColor(Color("wbGray"))
                        .frame(width: 24, height: 24)
                }
                TextField("Text", text: $message)
                    .font(.system(size: 14))
                    .frame(width: 279, height: 35)
                    .cornerRadius(4)
                    .background {
                        Color("wbTextField")
                    }
                    .padding(.horizontal, 10)
                
                if message.isEmpty {
                    Button {
                        actions(.recordAudioLock)
                        actions(.send)
                        viewModel.sendToUser()
                    } label: {
                        Image(systemName: "mic")
                            .renderingMode(.template)
                            .foregroundColor(Color("wbPurple"))
                            .frame(width: 24, height: 24)
                    }
                } else {
                    Button {
                        actions(.send)
                        viewModel.sendToUser()
                    } label: {
                        Image("SentMessage")
                            .renderingMode(.template)
                            .foregroundColor(Color("wbPurple"))
                            .frame(width: 24, height: 24)
                    }
                }
            }
        }
        .padding(.bottom, 20)
    }
}

struct CustomInputTextInChatView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputTextInChatView(message: .constant("Hello world"), actions: { action in
            ()
        })
            .environmentObject(ChatViewModel(isOp: true))
    }
}
