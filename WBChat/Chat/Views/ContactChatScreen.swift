//
//  ContactChatScreen.swift
//  WBChat
//
//  Created by Vladimir on 05.08.2024.
//

import SwiftUI
import ExyteChat
import Messages

struct ContactChatScreen: View {
    @StateObject private var viewModel = ChatViewModel()
    @EnvironmentObject var router: Router
    let contact: MockUser
    var body: some View {
        ChatView(messages: viewModel.messages) { draft in
            viewModel.send(draft: draft)
        } inputViewBuilder: { message, attachment, state, style, actions in
            Group {
                switch style {
                case .message:
                    CustomChatView(message: message, actions: actions)
                case .signature:
                    VStack {
                        HStack {
                            Button("Send") { actions(.send) }
                        }
                        TextField("Compose a signature for photo", text: message)
                            .background(Color.green)
                    }
                }
            }
        }
        .chatTheme(colors: .init(grayStatus: .gray, errorStatus: .red, buttonBackground: .purple, myMessage: Color("wbPurple"), textMediaPicker: Color("wbPurple"), recordDot: Color("wbPurple")))
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.goBack()
                } label: {
                    HStack {
                        Image("vector")
                            .renderingMode(.template)
                            .foregroundColor(.black)
                        Text(contact.name)
                            .foregroundColor(.black)
                    }
                }

            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    ()
                } label: {
                    Image("search")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                }

                
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    ()
                } label: {
                    Image("moreOptions")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                }

            }
        }
        .onAppear(perform: viewModel.onStart)
        .onDisappear(perform: viewModel.onStop)
    }
}

struct ContactChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContactChatScreen(contact: MockUser(uid: "Lisa", name: "Лиса Алиса", phoneNumber: "+7 999 999 99-99", lastSeenOnline: Date(timeIntervalSinceNow: -1800), isOnline: false, didStory: true, hasAvatar: false))
    }
}
