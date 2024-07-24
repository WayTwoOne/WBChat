//
//  ContactsListView.swift
//  WBChat
//
//  Created by Vladimir on 24.07.2024.
//

import SwiftUI

struct ContactsListView: View {
    
    @ObservedObject var viewModel: ContactsViewModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        List {
            ForEach(viewModel.contacts) { user in
                Text(user.name)
                    .background {
                        Button("") {
                            router.push(.contactDetails(user))
                        }
                        .opacity(0)
                    }
            }.onDelete { index in
                viewModel.deleteUser(of: index)
            }
            
        }
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView(viewModel: ContactsViewModel())
    }
}
