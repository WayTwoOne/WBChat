//
//  IfContactsIsEmptySingletonView.swift
//  WBChat
//
//  Created by Vladimir on 24.07.2024.
//

import SwiftUI

struct IfContactsIsEmptySingletonView: View {
    var body: some View {
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
    }
}

struct IfContactsIsEmptySingletonView_Previews: PreviewProvider {
    static var previews: some View {
        IfContactsIsEmptySingletonView()
    }
}
