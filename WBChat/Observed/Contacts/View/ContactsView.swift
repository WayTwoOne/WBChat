//
//  ContactsView.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var viewModel: ContactsViewModel 
    @EnvironmentObject var router: Router
    
    var body: some View {
        if viewModel.contacts.isEmpty {
            IfContactsIsEmptyView()
        } else {
            ContactsListView(viewModel: viewModel)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        router.push(.addNewContact)
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            
                    }
                }
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
            .environmentObject(ContactsViewModel())
    }
}
