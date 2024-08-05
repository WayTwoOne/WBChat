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
    
        let system = User(uid: "0", name: "System")
        let petya = User(
            uid: "1",
            name: "Петя",
            avatar: AssetExtractor.createLocalUrl(forImageNamed: "Петя")
        )
        let maman = User(
            uid: "2",
            name: "Маман",
            avatar: AssetExtractor.createLocalUrl(forImageNamed: "Маман")
        )
    
    func send(draftMessage: DraftMessage) {
        if draftMessage.id != nil {
            guard let index = messages.firstIndex(where: { $0.id == draftMessage.id }) else {
                // TODO: Create error
                return
            }
            messages.remove(at: index)
        }
        
        Task {
            var status: Message.Status = .sending
            if Int.random(in: 0...20) == 0 {
                status = .error(draftMessage)
            }
            let userMessage = await draftMessage.toMockMessage(user: system, status: status)
            let message = userMessage.toChatMessage()
            DispatchQueue.main.async { [weak self] in
                self?.messages.append(message)
            }
        }
    }
}
    
extension DraftMessage {
    func makeMockImages() async -> [MockImage] {
        await medias
            .filter { $0.type == .image }
            .asyncMap { (media : Media) -> (Media, URL?, URL?) in
                (media, await media.getThumbnailURL(), await media.getURL())
            }
            .filter { (media: Media, thumb: URL?, full: URL?) -> Bool in
                thumb != nil && full != nil
            }
            .map { media, thumb, full in
                MockImage(id: media.id.uuidString, thumbnail: thumb!, full: full!)
            }
    }

    func makeMockVideos() async -> [MockVideo] {
        await medias
            .filter { $0.type == .video }
            .asyncMap { (media : Media) -> (Media, URL?, URL?) in
                (media, await media.getThumbnailURL(), await media.getURL())
            }
            .filter { (media: Media, thumb: URL?, full: URL?) -> Bool in
                thumb != nil && full != nil
            }
            .map { media, thumb, full in
                MockVideo(id: media.id.uuidString, thumbnail: thumb!, full: full!)
            }
    }

    func toMockMessage(user: User, status: Message.Status = .read) async -> UserMessage {
        UserMessage(
            uid: id ?? UUID().uuidString,
            sender: user,
            createdAt: createdAt,
            status: user.isCurrentUser ? status : nil,
            text: text,
            images: await makeMockImages(),
            videos: await makeMockVideos(),
            recording: recording,
            replyMessage: replyMessage
        )
    }
}

extension Sequence {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}

class AssetExtractor {

    static func createLocalUrl(forImageNamed name: String) -> URL? {

        let fileManager = FileManager.default
        let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let url = cacheDirectory.appendingPathComponent("\(name).pdf")

        guard fileManager.fileExists(atPath: url.path) else {
            guard
                let image = UIImage(named: name),
                let data = image.pngData()
            else { return nil }

            fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
            return url
        }

        return url
    }
}
