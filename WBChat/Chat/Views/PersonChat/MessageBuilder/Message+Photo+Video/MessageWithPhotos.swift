//
//  MessageWithPhotos.swift
//  WBChat
//
//  Created by Vladimir on 07.08.2024.
//

import SwiftUI
import ExyteChat


struct MessageWithPhotos: View {
    @StateObject private var viewModel = AttachmentViewModel()
    let message: Message
    
    var body: some View {
        AttachmentsGrid(attachments: message.attachments) {
            viewModel.presentAttachmentFullScreen($0)
        }
//        .overlay(alignment: .bottomTrailing) {
//            if message.text.isEmpty {
//                messageTimeView(needsCapsule: true)
//                    .padding(4)
//            }
//        }
        .contentShape(Rectangle())
    }
}

struct AttachmentsGrid: View {
    
    let onTap: (Attachment) -> Void
    let maxImages: Int = 4 // TODO: Make injectable

    private let single: (Attachment)?
    private let grid: [Attachment]
    private let onlyOne: Bool

    private let hidden: String?
    private let showMoreAttachmentId: String?

    init(attachments: [Attachment], onTap: @escaping (Attachment) -> Void) {
        var toShow = attachments

        if toShow.count > maxImages {
            toShow = attachments.prefix(maxImages).map({ $0 })
            hidden = "+\(attachments.count - (maxImages - 1))"
            showMoreAttachmentId = attachments[(maxImages - 1)].id
        } else {
            hidden = nil
            showMoreAttachmentId = nil
        }
        if toShow.count % 2 == 0 {
            single = nil
            grid = toShow
        } else {
            single = toShow.first
            grid = toShow.dropFirst().map { $0 }
        }
        self.onlyOne = attachments.count == 1
        self.onTap = onTap
    }

    var columns: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible())]
    }

    var body: some View {
        VStack(spacing: 4) {
            if let attachment = single {
                AttachmentCell(attachment: attachment, onTap: onTap)
                    .frame(width: 204, height: grid.isEmpty ? 200 : 100)
                    .clipped()
                    .cornerRadius(onlyOne ? 0 : 12)
            }
            if !grid.isEmpty {
                ForEach(pair(), id: \.id) { pair in
                    HStack(spacing: 4) {
                        AttachmentCell(attachment: pair.left, onTap: onTap)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(12)
                        AttachmentCell(attachment: pair.right, onTap: onTap)
                            .frame(width: 100, height: 100)
                            .clipped()
                            .overlay {
                                if pair.right.id == showMoreAttachmentId, let hidden = hidden {
                                    ZStack {
                                        RadialGradient(
                                            colors: [
                                                .black.opacity(0.8),
                                                .black.opacity(0.6),
                                            ],
                                            center: .center,
                                            startRadius: 0,
                                            endRadius: 90
                                        )
                                        Text(hidden)
                                            .font(.body)
                                            .bold()
                                            .foregroundColor(.white)
                                    }
                                    .allowsHitTesting(false)
                                }
                            }
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}

struct AttachmentCell: View {
    @State var theme: ChatTheme.Images = ChatTheme.Images.init()

    let attachment: Attachment
    let onTap: (Attachment) -> Void

    var body: some View {
        Group {
            if attachment.type == .image {
                content
            } else if attachment.type == .video {
                content
                    .overlay {
                        theme.message.playVideo
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                    }
            } else {
                content
                    .overlay {
                        Text("Unknown")
                    }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onTap(attachment)
        }
    }

    var content: some View {
        AsyncImageView(url: attachment.thumbnail)
    }
}

struct AsyncImageView: View {

    let url: URL

    var body: some View {
        CachedAsyncImage(url: url, urlCache: .imageCache) { imageView in
            imageView
                .resizable()
                .scaledToFill()
        } placeholder: {
            Rectangle()
                .foregroundColor(Color.gray)
                .frame(minWidth: 100, minHeight: 100)
        }
    }
}

private extension AttachmentsGrid {
    func pair() -> Array<AttachmentsPair> {
        return stride(from: 0, to: grid.count - 1, by: 2)
            .map { AttachmentsPair(left: grid[$0], right: grid[$0+1]) }
    }
}

struct AttachmentsPair {
    let left: Attachment
    let right: Attachment

    var id: String {
        left.id + "+" + right.id
    }
}

struct MessageWithPhotos_Previews: PreviewProvider {
    static let message = Message(id: "", user: User(id: "", name: "", avatarURL: URL(string: "")!, isCurrentUser: true), text: "HEllo world wtosasgdhjashgdjhasgdjhagsdjhgasd")
    
    static var previews: some View {
        MessageWithPhotos(message: message)
    }
}
