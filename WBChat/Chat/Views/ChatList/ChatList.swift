//
//  ChatList.swift
//  WBChat
//
//  Created by Vladimir on 06.08.2024.
//

import SwiftUI

struct ChatList: View {
    @State private var searchText = ""
    @State private var contacts = MockUser.getContacts()
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            ChatListStories()
            
            List(contacts, id: \.name) { contact in
                ContactsRow(contact: contact)
                    .padding(.leading, -15)
                    .background {
                        Button("", action: {
                            router.push(.chat(contact))
                        })
                        .opacity(0)
                    }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Чаты")
                    .font(.system(size: 20))
                    .bold()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    ()
                } label: {
                    Image("newChat")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                }
                
                
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    ()
                } label: {
                    Image("iDontKnow")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                }
                
                
            }
        })
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatList()
    }
}
