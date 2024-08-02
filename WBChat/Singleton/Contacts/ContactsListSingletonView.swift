//
//  ContactsListSingletonView.swift
//  WBChat
//
//  Created by Vladimir on 24.07.2024.
//

import SwiftUI
import UISystem

struct ContactsListSingletonView: View {
    var viewModel: ContactsSingletonViewModel
    var body: some View {
        List {
            ForEach(viewModel.contacts) { user in
                Text(user.name)
                    .background {
                        NavigationLink(destination: ContactRow(user: user), label: {
                            Text("")
                        })
                        .opacity(0)
                    }
            }.onDelete { index in
                viewModel.removeUser(with: index)
            }
        }
    }
}

//struct ContactsListSingletonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactsListSingletonView()
//    }
//}
