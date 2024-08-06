//
//  ChatListStories.swift
//  WBChat
//
//  Created by Vladimir on 06.08.2024.
//

import SwiftUI

struct ChatListStories: View {
    @StateObject private var viewModel = ChatListViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
                ForEach(viewModel.contactsWithStory, id: \.name) { contact in
                    LazyVStack {
                    if contact.didStory {
                        ChatStory(contact: contact)
                    }
                }
            }
        }
    }
}

struct ChatListStories_Previews: PreviewProvider {
    static var previews: some View {
        ChatListStories()
    }
}
