//
//  CustomChatView.swift
//  WBChat
//
//  Created by Vladimir on 05.08.2024.
//

import SwiftUI
import ExyteChat

struct CustomChatView: View {
    @EnvironmentObject private var viewModel: ChatViewModel
    @Binding var message: String
    let actions: (InputViewAction) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            Spacer()
            HStack(alignment: .center, spacing: 10) {
                Button {
                    actions(.photo)
                } label: {
                    Image("Photos")
                        .renderingMode(.template)
                        .foregroundColor(Color("wbGray"))
                        .frame(width: 24, height: 24)
                }
                
                TextField("Text", text: $message)
                    .font(.system(size: 14))
                    .frame(width: 279, height: 35)
                    .cornerRadius(4)
                    .background {
                        Color("wbTextField")
                    }
                    .padding(.horizontal)
                
                Button {
                    actions(.send)
                    
                } label: {
                    Image("SentMessage")
                        .renderingMode(.template)
                        .foregroundColor(Color("wbPurple"))
                        .frame(width: 24, height: 24)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height / 15)
            
//            .background(alignment: .top){
//                Rectangle()
//                    .foregroundColor(.gray)
//            }
            
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

//struct CustomChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomChatView(message: .constant("Hello world"))
//    }
//}
