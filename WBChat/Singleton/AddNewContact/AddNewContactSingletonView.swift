//
//  AddNewContactSingletonView.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import SwiftUI
import UISystem

struct AddNewContactSingletonView: View {
    @State var name = ""
    @State var email = ""
    @State var bio = ""
    
    @Environment(\.dismiss) var dissmis
    
    var shared = ContactsSingletonViewModel.shared
    
    var body: some View {
        NavigationStack {
            ContactsTextFieldsView(name: $name, email: $email, bio: $bio)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dissmis()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                    }

                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        shared.getUser(name: name, email: email, bio: bio)
                        dissmis()
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

struct AddNewContactSingletonView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewContactSingletonView()
    }
}
