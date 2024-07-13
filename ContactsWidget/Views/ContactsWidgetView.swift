//
//  ContactsWidgetEntryView.swift
//  WBMessenger
//
//  Created by Vladimir on 20.06.2024.
//

import WidgetKit
import SwiftUI

struct ContactsWidgetView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            SmallSizeWidgetView(entry: entry)
        case .systemMedium:
            MediumSizeWidgetView(entry: entry)
        case .systemLarge:
            LargeSizeWidgetView(entry: entry)
        default:
            Text("")
        }
    }
}
