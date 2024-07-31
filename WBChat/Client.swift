//
//  ClientHandler.swift
//  WBChat
//
//  Created by Vladimir on 31.07.2024.
//

import Foundation

final class Client {
    let id: String
    private let distributor: TaskDistributor

    init(distributor: TaskDistributor) {
        self.distributor = distributor
        self.id = UUID().uuidString
    }

    func sendTask(_ task: Task) {}

    func handleResponse(_ response: Data) {}
}
