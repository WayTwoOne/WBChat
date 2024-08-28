//
//  PinCodeTextFieldView.swift
//  Profile
//
//  Created by Vladimir on 05.07.2024.
//

import SwiftUI

struct PinCodeTextFieldView: View {
    @EnvironmentObject var viewModel: EnteringTheReceivedCodeViewModel
    @FocusState private var hasFocus: Int?
    
    
    var body: some View {
        HStack {
            ForEach(0..<viewModel.numberOfFields, id: \.self) { index in
                ZStack {
                    Circle()
                        .frame(width: 32, height: 40, alignment: .center)
                        .foregroundColor(Color(red: RGBColor(237), green: RGBColor(237), blue: RGBColor(237)))
                        .opacity(viewModel.pinCode[index].isEmpty ? 1 : 0)
                        .padding(.horizontal, 5)
                    TextField("", text: $viewModel.pinCode[index])
                        .keyboardType(.numberPad)
                        .font(.system(size: 32))
                        .cornerRadius(5)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .focused($hasFocus, equals: index)
                    
                        .tag(index)
                    
                        .sync($viewModel.hasFocus, with: _hasFocus)
                }
                .frame(width: 60, height: 40, alignment: .center)
                
                    .onChange(of: viewModel.pinCode[index]) { newValue in
                        
                        viewModel.onlyNumbers(index: index, newValue: newValue)
                        
                        viewModel.onlyOneDigitInTheField(index: index)
                        
                        viewModel.stepLeftStepRightAcrossTheFields(newValue: newValue, index: index)
                    }
            }
        }
    }
}

extension PinCodeTextFieldView {
    private func RGBColor(_ color: Double) -> Double {
        color / 255
    }
}

struct PinCodeTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PinCodeTextFieldView()
            .environmentObject(EnteringTheReceivedCodeViewModel(numberOfFields: 4))
    }
}
