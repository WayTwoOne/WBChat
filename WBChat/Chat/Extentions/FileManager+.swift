//
//  FileManager+.swift
//  WBChat
//
//  Created by Vladimir on 08.08.2024.
//

import Foundation

extension FileManager {

    static var tempDirPath: URL {
        URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
    }

    static var tempFile: URL {
        FileManager.tempDirPath.appendingPathComponent(UUID().uuidString)
    }

    static var tempAudioFile: URL {
        FileManager.tempDirPath.appendingPathComponent(UUID().uuidString + ".aac")
    }
}
