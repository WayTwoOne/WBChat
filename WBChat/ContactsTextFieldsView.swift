//
//  ContactsTextFieldsView.swift
//  WBChat
//
//  Created by Vladimir on 24.07.2024.
//

import SwiftUI

struct ContactsTextFieldsView: View {
    
    @Binding var name: String
    @Binding var email: String
    @Binding var bio: String
    
    var body: some View {
        LazyVStack(alignment: .center, spacing: 15) {
            Text("Укажите данные нового контакта")
                .font(.system(size: 20))
                Spacer()
            TextField("Name", text: $name)
            TextField("Email", text: $email)
            TextField("Bio", text: $bio)
        }
        .padding(.horizontal, 30)
    }
}

struct ContactsTextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsTextFieldsView(name: .constant("Name"), email: .constant("Email"), bio: .constant("bio"))
    }
}
