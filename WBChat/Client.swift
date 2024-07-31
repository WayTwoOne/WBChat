//
//  ClientHandler.swift
//  WBChat
//
//  Created by Vladimir on 31.07.2024.
//

import Foundation

enum Errors: Error {
    case invalidURL
    case noData
    case decodingError
}

final class Client {
    
    let id: String
    private let distributor: TaskDistributor

    init(distributor: TaskDistributor) {
        self.distributor = distributor
        self.id = UUID().uuidString
    }

    func sendTask(_ task: Task) async {
        do {

        } catch Errors.invalidURL {
            print("Неверный url")
        } catch Errors.decodingError {
            print("Ошибка декодирования")
        }
    }

    func handleResponse(_ response: Data) async {
        do {
        } catch Errors.noData {
            print("Нет данных")
        }
    }
}
