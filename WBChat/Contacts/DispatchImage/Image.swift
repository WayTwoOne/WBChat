//
//  Image.swift
//  WBChat
//
//  Created by Vladimir on 27.07.2024.
//

import SwiftUI

class DispatchImage: ObservableObject {
    @Published var image: Image = Image("")
    
    func asyncImage(frome name: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.image = Image(name)
        }
    }
}
