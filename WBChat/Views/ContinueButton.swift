//
//  ContinueButtonView.swift
//  Profile
//
//  Created by Vladimir on 03.07.2024.
//

import SwiftUI

struct ContinueButton: View {
    
    @Binding var letsGo: Bool
    @Binding var phoneNumber: String
    
    var body: some View {
        Button {
            letsGo.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 35)
                Text("Продолжить")
                    .foregroundColor(.white)
            }
            .frame(width: 350, height: 60, alignment: .center)
            .foregroundColor(Color(red: RGBColor(154), green: RGBColor(65), blue: RGBColor(254)))
            .opacity(continueAction(phoneNumber) ? 0.5 : 1)

        }
        .disabled(continueAction(phoneNumber))

    }

    private func RGBColor(_ color: Double) -> Double {
           color / 255
       }

    private func continueAction(_ phoneNumber: String) -> Bool {
        if phoneNumber.count == 10 {
             return false
        }
        return true
    }
}

struct ContinueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContinueButton(letsGo: .constant(false), phoneNumber: .constant("12345"))
    }
}
