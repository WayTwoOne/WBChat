//
//  MediumSizeWidgetView.swift
//  ContactsWidgetExtension
//
//  Created by Vladimir on 20.06.2024.
//

import WidgetKit
import SwiftUI

struct MediumSizeWidgetView: View {
    
    var entry: SimpleEntry
    var contact = Contacts.getContacts()
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(.gray.gradient)
            HStack {
                VStack(alignment: .leading, spacing: 5, content: {
                    ForEach(0..<3) { number in
                        HStack {
                            Image(contact[number].name)
                                .resizable()
                                .frame(width: 45, height: 45, alignment: .center)
                            Text(contact[number].name)
                                .padding(.horizontal)
                        }
                    }
                    
                })
                .padding(.leading, -25)
                VStack(alignment: .trailing, spacing: 30) {
                    ForEach(0..<3) { number in
                        Text(contact[number].isOnline ? "Online " : "Offline")
                            .foregroundColor(contact[number].isOnline ? .blue : .red)
                    }
                }
            }
            .font(.system(size: 15))
        }
    }
}

struct MediumSizeWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        MediumSizeWidgetView(entry: SimpleEntry(date: .now, contact: Contacts.getContacts()))
    }
}
