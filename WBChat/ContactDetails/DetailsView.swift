//
//  DetailsView.swift
//  WBMessenger
//
//  Created by Vladimir on 12.06.2024.
//

import SwiftUI

struct DetailsView: View {
    let contact: User
    var body: some View {
        VStack {
                Text(contact.name)
                .font(.system(size: 24))
                .foregroundColor(.black)
                Text(contact.phoneNumber)
                .font(.system(size: 16))
                .foregroundColor(Color(red: RGBColor(173), green: RGBColor(181), blue: RGBColor(189)))
                
            
        }
    }
}

extension DetailsView {
    private func RGBColor(_ color: Double) -> Double {
        color / 255
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(contact: User(uid: "Петя", name: "Петя", phoneNumber: "+7 999 999 99-99", lastSeenOnline: nil, isOnline: true, didStory: false, hasAvatar: true))
    }
}
