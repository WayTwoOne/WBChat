//
//  Actor.swift
//  WBChat
//
//  Created by Vladimir on 29.07.2024.
//

import Foundation

final class TaskDistributor {
    private var clients: [String: Client] = [:]
    private var taskQueue: Set<Task> = []
    private let queue = DispatchQueue(label: "TaskDistributorQueue")

    func addTask(_ task: Task) {
        queue.async {
            self.taskQueue.insert(task)
            self.distributeTasks()
        }
    }

    private func distributeTasks() {
        guard !taskQueue.isEmpty else { return }
        queue.async { [weak self] in
            guard let self else { return }
            for client in self.clients.values {
                if let task = self.taskQueue.popFirst() {
                    client.sendTask(task)
                }
            }
        }
    }

    func registerClient(_ client: Client) {
        queue.async {
            self.clients[client.id] = client
        }
    }

    func unregisterClient(_ client: Client) {
        queue.async {
            self.clients.removeValue(forKey: client.id)
        }
    }
}

