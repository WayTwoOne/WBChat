//
//  EnteringCodeTextView.swift
//  Profile
//
//  Created by Vladimir on 05.07.2024.
//

import SwiftUI

struct EnteringCodeTextView: View {
    @EnvironmentObject var viewModel: EnteringTheReceivedCodeViewModel
    var body: some View {
        VStack(spacing: 49) {
            VStack(alignment: .center, spacing: 8) {
                Text("Введите код")
                    .font(.title)
                    .bold()
                VStack(alignment: .center, spacing: 10) {
                    Text("Отправили код на номер")
                    Text(viewModel.phoneNumber)
                    
                }
            }
                .font(.system(.body))
                .multilineTextAlignment(.center)
                PinCodeTextFieldView()
            
            Button {
                viewModel.clearPinCodeTextField()
            } label: {
                Text("Запросить код повторно")
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 154/255, green: 65/255, blue: 254/255))
            }

            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    viewModel.clearPhoneNumberAndCountryCode()
                    viewModel.clearPinCodeTextField()
                } label: {
                    Image("vector")
                        .bold()
                }
                
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct EnteringCodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        EnteringCodeTextView()
            .environmentObject(EnteringTheReceivedCodeViewModel(numberOfFields: 4))
    }
}
