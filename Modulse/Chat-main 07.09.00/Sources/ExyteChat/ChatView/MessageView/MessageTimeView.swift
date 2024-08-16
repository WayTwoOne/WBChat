//
//  Created by Alex.M on 08.07.2022.
//

import SwiftUI

struct MessageTimeView: View {

    let text: Date
    let isCurrentUser: Bool
    var chatTheme: ChatTheme

    var body: some View {
        Text(text, style: .time)
            .font(.caption)
            .foregroundColor(isCurrentUser ? .white : chatTheme.colors.frientMessageTime)
            .environment(\.locale, .init(identifier: "ru_RU"))
    }
}

struct MessageTimeWithCapsuleView: View {

    let text: Date
    let isCurrentUser: Bool
    var chatTheme: ChatTheme

    var body: some View {
        Text(text, style: .time)
            .environment(\.locale, .init(identifier: "ru_RU"))
            .font(.caption)
            .foregroundColor(chatTheme.colors.timeCapsuleForeground)
            .opacity(1)
            .padding(.top, 4)
            .padding(.bottom, 4)
            .padding(.horizontal, 8)
            .background {
                Capsule()
                    .fill(chatTheme.colors.timeCapsuleBackground)
            }
    }
}

