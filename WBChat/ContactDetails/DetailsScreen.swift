//
//  DetailsScreen.swift
//  WBMessenger
//
//  Created by Vladimir on 12.06.2024.
//

import SwiftUI

struct DetailsScreen: View {
    let contact: User
    @EnvironmentObject var router: Router
    
    
    var body: some View {
            VStack(spacing: 60) {
                DetailsAvatarView(contact: contact)
                DetailsView(contact: contact)
                SocialNetworkView()
                    .padding(.top, -20)
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        router.goBack()
                    } label: {
                        HStack {
                            Image("vector")
                            Text("Контакты")
                                .foregroundColor(.black)
                        }
                        .bold()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "pencil")
                        .bold()
                }
            }
        .navigationBarBackButtonHidden()
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen(contact: User(uid: "Петя", name: "Петя", phoneNumber: "+7 999 999 99-99", lastSeenOnline: nil, isOnline: true, didStory: false, hasAvatar: true))
    }
}
