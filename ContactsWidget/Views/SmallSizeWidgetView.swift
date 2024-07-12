//
//  MediumSizeWidgetView.swift
//  ContactsWidgetExtension
//
//  Created by Vladimir on 20.06.2024.
//

import WidgetKit
import SwiftUI

struct SmallSizeWidgetView: View {
    var entry: SimpleEntry
    var contact = Contacts.getContacts()
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(.gray.gradient)
            VStack {
                Image(contact[0].name)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                Text(contact[0].name)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }
            
        }
    }
}
