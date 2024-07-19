//
//  StartedWorkView.swift
//  WBMessenger
//
//  Created by Vladimir on 26.06.2024.
//

import SwiftUI

struct StartedWorkView: View {
    @State var person: Person? = .init(name: "", lastname: "", patronymic: "", age: 0, passport: nil)
    @State var passport: Passport? = .init(series: 0, number: 0, date: Date.now, person: nil)
    @Environment(\.dismiss) var dismiss
    
    init() {
        person?.passport = passport
        passport?.person = person
    }
    
    var body: some View {
        VStack {
            Button(action: {
                dismiss()
            }, label: {
                Text("Button to dismiss")
            })
        }
        .buttonStyle(.borderedProminent)
        .onDisappear {
            deInit()
        }
    }
    
    private func deInit() {
        person = nil
        passport = nil
    }
}
