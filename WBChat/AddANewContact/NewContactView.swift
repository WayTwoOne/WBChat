//
//  NewContactView.swift
//  WBMessenger
//
//  Created by Vladimir on 18.06.2024.
//

import SwiftUI

struct NewContactView: View {
    @EnvironmentObject var router: Router
    
    var body: some View {
        Text("New contact")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        router.goBack()
                    } label: {
                        HStack {
                            Image("vector")
                            Text("Новый контакт")
                                .foregroundColor(.black)
                        }
                        .bold()
                    }
                    
                }
            }
            .navigationBarBackButtonHidden()
    }
}

struct NewContactView_Previews: PreviewProvider {
    static var previews: some View {
        NewContactView()
    }
}
