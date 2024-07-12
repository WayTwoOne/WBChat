//
//  PhoneNumberLabel.swift
//  Profile
//
//  Created by Vladimir on 03.07.2024.
//

import SwiftUI

struct PhoneNumberLabel: View {
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text("Введите номер телефона")
                .font(.system(size: 24))
                .bold()
            Text("Мы вышлем код подтверждения\n\nна указаный номер")
                .font(.system(size: 14))
        }
        .multilineTextAlignment(.center)
    }
}

struct PhoneNumberLabel_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberLabel()
    }
}
