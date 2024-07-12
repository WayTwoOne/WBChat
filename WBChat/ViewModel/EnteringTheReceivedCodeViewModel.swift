//
//  EnteringTheReceivedCodeViewModel.swift
//  Profile
//
//  Created by Vladimir on 05.07.2024.
//

import Foundation

final class EnteringTheReceivedCodeViewModel: ObservableObject {
    
    @Published var pinCode: [String] = [""]
    @Published var hasFocus: Int?
    @Published var isButtonDisable = true
    @Published var phoneNumber = ""
    @Published var countryCode = ""
    
    let numberOfFields: Int
    
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.pinCode = Array(repeating: "", count: numberOfFields)
    }
    
    func onlyNumbers(index: Int, newValue: String) {
        pinCode[index] = newValue.filter {
            "0123456789".contains($0)
        }
    }
    
    func onlyOneDigitInTheField(index: Int) {
        if pinCode[index].count > 1 {
            pinCode[index] = String(pinCode[index].suffix(1))
        }
    }
    
    
    func correctPhoneNumber2() {
        var phone = "+\(countryCode) "
        for i in 0...phoneNumber.count - 1 {
            switch i {
            case 0..<3 :
                phone.append(String(Array(phoneNumber)[i]))
            case 3:
                phone.append(" \(String(Array(phoneNumber)[i]))")
            case 4..<6:
                phone.append(String(Array(phoneNumber)[i]))
            case 6, 8:
                phone.append("-\(String(Array(phoneNumber)[i]))")
            case 7:
                phone.append(String(Array(phoneNumber)[i]))
            case 9...10:
                phone.append(String(Array(phoneNumber)[i]))
            default:
                print("Такого числа нет((((((")
            }
        }
        phoneNumber = phone
    }
    
    func clearPhoneNumberAndCountryCode() {
        phoneNumber = ""
        countryCode = ""
    }
    
    func clearPinCodeTextField() {
        pinCode = Array(repeating: "", count: numberOfFields)
    }
    
    
    func stepLeftStepRightAcrossTheFields(newValue: String, index: Int) {
        if !newValue.isEmpty {
            if index == numberOfFields - 1 {
                hasFocus = nil
            } else {
                hasFocus = (hasFocus ?? 0) + 1
            }
        } else if index == 0 {
            hasFocus = index
        } else {
            hasFocus = (hasFocus ?? 0) - 1
        }
    }
}
