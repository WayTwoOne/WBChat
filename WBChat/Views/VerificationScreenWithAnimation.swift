//
//  VerificationScreenWithAnimation.swift
//  Profile
//
//  Created by Vladimir on 04.07.2024.
//

import SwiftUI

struct VerificationScreenWithAnimation: View {
    @State private var letsGo = false
    @State private var phoneNumber = ""
    @State private var countryCode = ""
    
//    @EnvironmentObject var router: RouterHW11
    
    var body: some View {
        VStack {
            PhoneNumberLabel()
                .offset(x: 0, y: letsGo ? -520 : 0)
                .animation(.easeIn(duration: 3), value: letsGo)
            PhoneNumberTextField(phoneNumber: $phoneNumber, countryCode: $countryCode, letsGo: $letsGo)
                .offset(x: 0, y: letsGo ? 520 : 0)
                .animation(.easeOut(duration: 3), value: letsGo)
            ContinueButton(letsGo: $letsGo, phoneNumber: $phoneNumber)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    letsGo.toggle()
                } label: {
                    Image("vector")
                        .bold()
                }
                
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct VerificationScreenWithAnimation_Previews: PreviewProvider {
    static var previews: some View {
        VerificationScreenWithAnimation()
    }
}
