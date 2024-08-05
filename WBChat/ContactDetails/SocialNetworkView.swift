//
//  SocialNetworkView.swift
//  WBMessenger
//
//  Created by Vladimir on 12.06.2024.
//

import SwiftUI

struct SocialNetworkView: View {
    let socialIcons = ["x", "instagram", "link", "facebook"]
    
    var body: some View {
        HStack {
            ForEach(socialIcons, id: \.self) { icon in
                Button {
                    ()
                } label: {
                    Image(icon)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color(red: RGBColor(154), green: RGBColor(65), blue: RGBColor(254)))
                        .background(content: {
                            Rectangle()
                                .frame(width: 70, height: 40, alignment: .center)
                                .foregroundColor(.white)
                                .overlay(alignment: .center, content: {
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(lineWidth: 1.5)
                                    
                                })
                        })
                }
                .foregroundColor(Color(red: RGBColor(154), green: RGBColor(65), blue: RGBColor(254)))
                .padding(.horizontal, 30)
            }
        }
    }
}

extension SocialNetworkView {
    private func RGBColor(_ color: Double) -> Double {
        color / 255
    }
}

struct SocialNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        SocialNetworkView()
    }
}
