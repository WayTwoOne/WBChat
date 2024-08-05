//
//  ChatViewModel.swift
//  WBChat
//
//  Created by Vladimir on 05.08.2024.
//

import Foundation
import ExyteChat
import UIKit
import ExyteMediaPicker
import Combine

final class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    
    private let interactor: ChatInteractorProtocol
    private var subscriptions = Set<AnyCancellable>()
    
    init(interactor: ChatInteractorProtocol = ChatInteractor()) {
        self.interactor = interactor
    }
    
    func send(draft: DraftMessage) {
        interactor.send(draftMessage: draft)
    }
    
    func onStart() {
        interactor.messages
            .compactMap { messages in
                messages.map { $0.toChatMessage() }
            }
            .assign(to: &$messages)

        interactor.connect()
    }

    func onStop() {
        interactor.disconnect()
    }

    func loadMoreMessage(before message: Message) {
        interactor.loadNextPage()
            .sink { _ in }
            .store(in: &subscriptions)
    }
}


