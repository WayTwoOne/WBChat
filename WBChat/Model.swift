//
//  Model.swift
//  WBChat
//
//  Created by Vladimir on 02.08.2024.
//

import Foundation
import AnimeList

typealias AnimeData = AnimeListQuery.Data.Page

struct AnimeList: Codable {
    var page: Page

    enum CodingKeys: String, CodingKey {
        case page = "Page"
    }
}

struct Page: Codable {
    var mediaList: [MediaList]
    
    init(_ animies: AnimeData?) {
        self.mediaList = animies?.mediaList?.map({ anime -> MediaList in
            MediaList(anime)
        }) ?? []
      }
}

struct MediaList: Codable, Identifiable {
    var id = UUID()
    
    var media: Media
    
    init(_ anime: AnimeData.MediaList?) {
        self.media = Media(anime?.media)
    }
}

struct Media: Codable {
    var title: Title
    var coverImage: CoverImage
    var description: String
    var episodes: Int
    
    init(_ anime: AnimeData.MediaList.Media?) {
        self.title = Title(anime?.title)
        self.coverImage = CoverImage(anime?.coverImage)
        self.description = anime?.description ?? ""
        self.episodes = anime?.episodes ?? 0
    }
}

struct CoverImage: Codable {
    var extraLarge: String
    
    init(_ anime: AnimeData.MediaList.Media.CoverImage?) {
        self.extraLarge = anime?.extraLarge ?? ""
    }
}

struct Title: Codable {
    var english: String?
    var native: String
    
    init(_ anime: AnimeData.MediaList.Media.Title?) {
        self.english = anime?.english
        self.native = anime?.native ?? ""
    }
}
