//
//  AnimeDetailsView.swift
//  WBChat
//
//  Created by Vladimir on 02.08.2024.
//

import SwiftUI

struct AnimeDetailsScreen: View {
    @EnvironmentObject var viewModel: AnimeViewModel
    @Environment(\.dismiss) var dissmis
    
    let anime: Media
    var body: some View {
        ScrollView {
            LazyVStack {
                Text(viewModel.title(anime.title))
                    .font(.title)
                Text("\(anime.episodes) episodes")
                AsyncImage(url: URL(string: anime.coverImage.extraLarge)) { image in
                    image.resizable()
                        .cornerRadius(20)
                        .frame(width: 350, height: 350, alignment: .center)
                } placeholder: {
                    ProgressView()
                }
                
                Text(anime.description)
                    .frame(width: 350)
            }
            .padding(.top, -70)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dissmis()
                } label: {
                    Image(systemName: "arrow.backward")
                        .renderingMode(.template)
                        .foregroundColor(.black)
                }

            }
        }
    }
}

//struct AnimeDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimeDetailsView()
//    }
//}
