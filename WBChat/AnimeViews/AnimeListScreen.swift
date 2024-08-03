//
//  AnimeListView.swift
//  WBChat
//
//  Created by Vladimir on 02.08.2024.
//

import SwiftUI

struct AnimeListScreen: View {
    @EnvironmentObject var viewModel: AnimeViewModel
    let columns: [GridItem] = [
        GridItem(.fixed(180)),
        GridItem(.fixed(180))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 25) {
                        ForEach(viewModel.animeList) { anime in
                            NavigationLink(destination: AnimeDetailsScreen(anime: anime.media)) {
                                AnimeRowView(anime: anime.media)
                            }
                        }
                    }
                    .padding(.top, 15)
                    .navigationTitle("Anime")
            }
        }
    }
}

struct AnimeListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeListScreen()
    }
}
