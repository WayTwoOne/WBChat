//
//  Extention.swift
//  Profile
//
//  Created by Vladimir on 04.07.2024.
//

import UIKit
import SwiftUI

extension View {
    func hideKeyboardOnTap() -> some View {
        ModifiedContent(content: self, modifier: HideKeyboardOnTapModifier())
    }
}

extension View {
    func endEditing() {
        HideKeyboardOnTapModifier.hideKeyboard()
    }
}

struct HideKeyboardOnTapModifier: ViewModifier {
    static func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {}
                .onLongPressGesture(perform: {}, onPressingChanged: { isPressed in
                    if isPressed {
                        Self.hideKeyboard()
                    }
                }
                )

            content
        }
    }
}
