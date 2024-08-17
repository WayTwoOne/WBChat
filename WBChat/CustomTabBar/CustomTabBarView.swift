//
//  CustomTabBarView.swift
//  WBMessenger
//
//  Created by Vladimir on 13.06.2024.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @Binding var tabSelcted: Int
    
    private let tabBar = [
        TabBarIcons(iconName: "person.2"),
        TabBarIcons(iconName: "message"),
        TabBarIcons(iconName: "more")
    ]
    
    var body: some View {
        HStack {
            ForEach(0..<3) { index in
                Spacer()
                Button {
                    tabSelcted = index + 1
                } label: {
                    
                    Image(tabBar[index].iconName)
                        .renderingMode(.template)
                }
                .foregroundColor(index + 1 == tabSelcted ? .purple : .black)
                Spacer()
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 50)
    }
}


struct CustomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView(tabSelcted: .constant(1))
    }
}
