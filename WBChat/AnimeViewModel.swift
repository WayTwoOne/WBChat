//
//  AnimeViewModel.swift
//  WBChat
//
//  Created by Vladimir on 02.08.2024.
//

import Foundation
import DataLoader
import AnimeList

final class AnimeViewModel: ObservableObject {
    @Published var animeList: [MediaList] = []
    
    init() {
        fetchMedia()
    }
    
    func fetchMedia() {
        Network.shared.apollo.fetch(query: AnimeListQuery()) { [weak self] result in
            switch result {
            case .success(let anime):
                if let animeList = anime.data?.page {
                    guard let list = self?.process(with: animeList) else { return }
                    self?.animeList = list
                } else if let errors = anime.errors {
                    print("GraphQL errors \(errors)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    
    private func process(with data: AnimeData?) -> [MediaList] {
        guard data != nil else { return [] }
        
        return Page(data).mediaList
    }
    
    func title(_ name: Title) -> String {
        var title = ""
        if name.english != nil {
            title = name.english ?? ""
        } else {
            title = name.native
        }
        
        return title
    }
}

