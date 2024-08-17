//
//  Created by Alex.M on 07.07.2022.
//

import SwiftUI

struct MessageStatusView: View {

//    @Environment(\.chatTheme) private var theme
    @State var customStatus = Status()

    let message: Message
//    let onRetry: () -> Void

    var body: some View {
        Group {
            switch message.status {
            case .sending:
                Text(customStatus.getStatus(status: message.status))
                    .font(.system(size: 10))
                    .foregroundColor(message.user.isCurrentUser ? .white : .black)
            case .sent:
                Text(customStatus.getStatus(status: message.status))
                    .font(.system(size: 10))
                    .foregroundColor(message.user.isCurrentUser ? .white : .black)
            case .read:
                Text(customStatus.getStatus(status: message.status))
                    .font(.system(size: 10))
                    .foregroundColor(message.user.isCurrentUser ? .white : .black)
            case .error:
//                Button {
//                    onRetry()
//                } label: {
//                    Text(customStatus.getStatus(status: message.status))
//                        .font(.system(size: 10))
//                }
                Text("Ошибка отправки")
                    .font(.system(size: 10))
                .foregroundColor(message.user.isCurrentUser ? .white : .black)
            case .none:
                Text("")
            }
        }
//        .viewSize(MessageView.statusViewSize)
        .padding(.trailing, MessageView.horizontalStatusPadding)
    }
}

struct Status {
    func getStatus(status: Message.Status?) -> String {
        switch status {
        case .sending:
            return "Отправляется"
        case .sent:
            return "Отправлено"
        case .read:
            return "Прочитано"
        case .error(let error):
            return error.text.localizedLowercase
        case .none:
            return ""
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            MessageStatusView(status: .sending, onRetry: {})
//            MessageStatusView(status: .sent, onRetry: {})
//            MessageStatusView(status: .read, onRetry: {})
//        }
//    }
//}
