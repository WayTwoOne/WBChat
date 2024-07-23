//
//  NewContactsView.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import SwiftUI

struct ContactsSingletonView: View {
    @StateObject var shared = Singleton.shared
    
    var body: some View {
        NavigationStack {
            if shared.contacts.isEmpty {
                VStack(alignment: .center) {
                    Text("Нажми на меня, чтобы создать новый контакт")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                    NavigationLink(destination: AddNewContactSingletonView()) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 70, height: 70, alignment: .center)
                    }
                    
                }
            } else {
                List {
                    ForEach(shared.contacts) { user in
                        Text(user.name)
                            .background {
                                NavigationLink(destination: ContactRow(user: user), label: {
                                    Text("")
                                })
                                .opacity(0)
                            }
                    }.onDelete { index in
                        shared.removeUser(with: index)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddNewContactSingletonView()) {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .frame(width: 70, height: 70, alignment: .center)
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
