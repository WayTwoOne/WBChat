//
//  ViewModel.swift
//  WBChat
//
//  Created by Vladimir on 07.08.2024.
//

import Foundation
import Combine
import ExyteChat

public typealias ChatPaginationClosure = (Message) -> Void

final class AttachmentViewModel: ObservableObject {
    
    @Published private(set) var fullscreenAttachmentItem: Optional<Attachment> = nil
    @Published var fullscreenAttachmentPresented = false
    
    func presentAttachmentFullScreen(_ attachment: Attachment) {
        fullscreenAttachmentItem = attachment
        fullscreenAttachmentPresented = true
    }
    
    func dismissAttachmentFullScreen() {
        fullscreenAttachmentPresented = false
        fullscreenAttachmentItem = nil
    }
}
