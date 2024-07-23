//
//  ContactDetailView.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import SwiftUI

struct ContactDetailView: View {
    var user: User?
    @EnvironmentObject var router: Router
    @EnvironmentObject var viewModel: ContactsViewModel
    
    @State var name = ""
    @State var email = ""
    @State var bio = ""
    
    var body: some View {
        LazyVStack(alignment: .center, spacing: 15) {
            TextField("name", text: $name)
            TextField("email", text: $email)
            TextField("bio", text: $bio)
        }
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

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(user: nil, name: "", email: "", bio: "")
    }
}
