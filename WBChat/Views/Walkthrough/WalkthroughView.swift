//
//  WalkthroughView.swift
//  WBMessenger
//
//  Created by Vladimir on 04.06.2024.
//

import SwiftUI

struct WalkthroughView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 35) {
            Spacer()
            Spacer()
            
            LightOrDarkImage()
            
            Text("Общайтесь с друзьями и близкими легко")
                .font(.system(size: 24))
                .bold()
            UserAgreementAndButtonView()
        }
        .multilineTextAlignment(.center)
        .foregroundColor(colorScheme == .dark ? Color(.white) : Color(.black))
    }
}

struct WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
    }
}
