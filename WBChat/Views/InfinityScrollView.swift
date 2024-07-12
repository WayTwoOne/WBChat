//
//  ScrollView.swift
//  WBMessenger
//
//  Created by Vladimir on 01.07.2024.
//

import SwiftUI

struct InfinityScrollView: View {
    @State var rows: [String] = Array(repeating: "Item", count: 20)
    @State var random = 0
    
    let columns: [GridItem] = [
            GridItem(.fixed(300), spacing: 16)
    ]
    
    func infinityScrollView(encounteredIndex: Int) {
        guard encounteredIndex == rows.count - 1 else { return }
        rows.append(contentsOf: Array(repeating: "", count: 20))
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 15) {
                    Section(header: Text("Emojy").font(.title)) {
                        ForEach(0...rows.count, id: \.self) { index in
                            ZStack {
                                Text(String(UnicodeScalar(Array(0x1F300...0x1F3F0).randomElement()!)!))
                                    .font(.system(size: 250))
                                    .opacity(0.5)
                                switch random {
                                case 0:
                                    TwoOnTopOneOnBottom()
                                case 1:
                                    TwoOnLeftOneOnRight()
                                case 2:
                                    OneOnTopTwoOnBottom()
                                case 3:
                                    OneOnLeftTwoOnRight()
                                default:
                                    OneOnTopTwoOnBottom()
                                }
                            }
                            .onAppear {
                                self.infinityScrollView(encounteredIndex: index)
                            }
                            .onAppear {
                                randomViews()
                            }
                        }
                    }
                }
        }
    }
    
    private func randomViews() {
        random = Int.random(in: 0...4)
    }
}
