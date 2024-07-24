//
//  IfContactsIsEmptyView.swift
//  WBChat
//
//  Created by Vladimir on 24.07.2024.
//

import SwiftUI

struct IfContactsIsEmptyView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
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
    }
}

struct IfContactsIsEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        IfContactsIsEmptyView()
    }
}
