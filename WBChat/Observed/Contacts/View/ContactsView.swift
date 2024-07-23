//
//  ContactsView.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import SwiftUI

struct ContactsView: View {
    @EnvironmentObject var viewModel: ContactsViewModel // здесб используется DI
    @EnvironmentObject var router: Router
    
    var body: some View {
        if viewModel.contacts.isEmpty {
            VStack(alignment: .center) {
                Text("Нажми на меня, чтобы создать новый контакт")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                Button {
                    router.push(.addNewContact)
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .center)
                }
            }
        } else {
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
