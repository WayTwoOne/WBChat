//
//  NewContactsView.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import SwiftUI

struct ContactsSingletonView: View {
    @StateObject var viewModel = ContactsSingletonViewModel.shared
    
    var body: some View {
        NavigationStack {
            if viewModel.contacts.isEmpty {
                IfContactsIsEmptySingletonView()
                    .navigationTitle("Contacts")
            } else {
                ContactsListSingletonView(viewModel: viewModel)
                    .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddNewContactSingletonView()) {
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                }
            }
        }
    }
}



struct NewContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsSingletonView()
    }
}
