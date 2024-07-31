//
//  Actor.swift
//  WBChat
//
//  Created by Vladimir on 29.07.2024.
//

import Foundation

actor TaskDistributor {
    private var clients: [String: Client] = [:]
    private var results: [String: String] = [:]
    private var taskQueue: Set<Task> = []


    func addTask(_ task: Task) async {
        taskQueue.insert(task)
        await distributeTasks()
    }

    private func distributeTasks() async {
        guard !taskQueue.isEmpty else { return }
        for client in clients.values {
            if let task = taskQueue.popFirst() {
                await client.sendTask(task)
            }
        }
    }
    
    func receiveResult(_ result: String, forTaskID taskID: String) async {
        results[taskID] = result
    }

    func registerClient(_ client: Client) {
        clients[client.id] = client
    }

    func unregisterClient(_ client: Client) {
        clients.removeValue(forKey: client.id)
    }
}

