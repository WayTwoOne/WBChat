//
//  ContactRow.swift
//  WBChat
//
//  Created by Vladimir on 23.07.2024.
//

import SwiftUI

public struct ContactRow: View {
    public let user: User
    
    public init(user: User) {
        self.user = user
    }
    
    public var body: some View {
        ScrollView {
            LazyVStack(alignment: .center) {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .padding()
                
                LazyHStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Name: ")
                        Text("Email: ")
                        
                            .padding(.vertical, 5)
                    }
                    
                    
                    VStack(alignment: .leading)  {
                        Text(user.name)
                        Text(user.email)
                            .padding(.vertical, 5)
                    }
                }
                .padding()
                Text(user.bio)
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
            }
        }
        .navigationTitle(user.name)
    }
}

//struct ContactRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ContactRow(user: User(name: "Tim", email: "email.con", bio: "Hello world"))
//    }
//}
