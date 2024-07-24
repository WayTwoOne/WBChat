//
//  AddNewContactView.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import SwiftUI

struct AddNewContactView: View {
    var user: User?
    @EnvironmentObject var router: Router
    @EnvironmentObject var viewModel: ContactsViewModel
    
    @State var name = ""
    @State var email = ""
    @State var bio = ""
    
    var body: some View {
        ContactsTextFieldsView(name: $name, email: $email, bio: $bio)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    router.goBack()
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.getUser(name: name, email: email, bio: bio)
                    router.goBack()
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
    }
}


struct AddNewContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewContactView()
    }
}
