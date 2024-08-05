//
//  ContactsVIew.swift
//  WBMessenger
//
//  Created by Vladimir on 10.06.2024.
//

import SwiftUI

struct ContactsScreen: View {
    @State private var searchText = ""
    @State private var contacts = User.getContacts()
    @EnvironmentObject var router: Router
    
    var body: some View {
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
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Контакты")
                    .font(.system(size: 20))
                    .bold()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    router.push(.addNewContact)
                }) {
                    Text("+")
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                        .bold()
                }
            }
        })
    }
}


struct ContactsVIew_Previews: PreviewProvider {
    static var previews: some View {
        ContactsScreen()
    }
}
