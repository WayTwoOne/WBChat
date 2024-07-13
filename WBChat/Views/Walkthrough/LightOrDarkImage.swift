//
//  LightOrDarkImage.swift
//  WBMessenger
//
//  Created by Vladimir on 04.06.2024.
//

import SwiftUI

struct LightOrDarkImage: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Image(colorScheme == .dark ? "darkMode" : "lightMode")
    }
}

struct LightOrDarkImage_Previews: PreviewProvider {
    static var previews: some View {
        LightOrDarkImage()
    }
}
